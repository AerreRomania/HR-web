
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Globalization
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf

Partial Class form_intervali_stiro
    Inherits System.Web.UI.Page

    'Protected Sub Page_error(sender As Object, e As EventArgs) Handles Me.Error
    '    Response.Redirect("http://loknitting.olimpias.it/form-intervali-stiro.aspx")
    'End Sub

    Dim dtStart As Date = DateTime.Today
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
            
       'Try
       ' dtStart  = DateTime.ParseExact(DateTime.Today, "MM/dd/yyyy", CultureInfo.InvariantCulture)
       ' Catch ex As Exception
       ' dtStart = datetime.today
       ' End Try


        _eff.Clear()
        _eff = Efficiency_Procedure_Stiro

        Dim year As String = DateTime.Now.Year.ToString

        'cal_intervali.Text = DateTime.Now.ToString("MM/dd/yyyy")
        cal_intervali.TextMode=TextBoxMode.Date

        Dim decimalLength As Integer = System.DateTime.Today.Day.ToString("D").Length
        Dim varDay As String = System.DateTime.Today.Day.ToString("D" + decimalLength.ToString())
        Dim varMonth As String = System.DateTime.Today.Month.ToString("D" + decimalLength.ToString())

        cal_intervali.Attributes("min") = DateTime.Now.ToString("2017-05-03")
        cal_intervali.Attributes("max") = year + "-" + varMonth + "-" + varDay

        If Page.IsPostBack = False
            PrimaTurno_Click(Nothing, Nothing)

        End If

     

        Dim scriptManager As ScriptManager = ScriptManager.GetCurrent(Page)
        scriptManager.RegisterPostBackControl(btnexcel)
        scriptManager.RegisterPostBackControl(get_pdf_intervali)
        scriptManager.RegisterPostBackControl(gv_intervali)
    End Sub

    Shared ReadOnly _myConnection As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
    Dim Shared _eff As New DataTable


    Public Function Efficiency_Procedure_Stiro As DataTable
        Dim dtStart1 As String = FormatDateTime(DateTime.Today, vbShortDate)
        Dim cmd As New SqlCommand("spEfficiencyStiro", _myConnection)

        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@startTime", SqlDbType.DateTime).Value = dtStart1
        cmd.Parameters.Add("@stopTime", SqlDbType.DateTime).Value = dtStart1

        If _myConnection.State = ConnectionState.Closed Then
            _myConnection.Open()
        End If

        Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

        _eff.Load(dr)
        dr.Close()
        cmd.Dispose()

        If _myConnection.State = ConnectionState.Open Then
            _myConnection.Close()
        End If

        Return _eff
    End Function

    ReadOnly _dataSet As New DataSet
    Dim _mainTable As New DataTable
    Dim _dtV As DataView

    'GV_INTERVAL
    Public Sub btnintervali_Click(sender As Object, e As EventArgs)

        Dim tKey As String = String.Empty
        Dim line As String = String.Empty
        Dim name As String = String.Empty
        Dim phase As String = String.Empty
        Dim comm As String = String.Empty
        Dim art As String = String.Empty
        Dim qty = 0
        Dim hour = 0
        Dim sort = 0
        Dim qtyMan As Single = 0
        Dim idrealizar As String = 0
        Dim time As Single = 0

        '_mainTable.Clear()
        _dataSet.Clear()
        _mainTable = Daily_Work_Stiro
        'Efficiency_Procedure(maineff)

        Dim htbl As New Hashtable
        Dim index = 0
        Dim sumEttcomp = 0

        Dim sumEtt = 0
        Dim sumMan = 0
        Dim sumRam = 0
        Dim sumPre = 0
        Dim sumPie = 0

        LoadColumns()

        _dataSet.Tables("HRPROD").Columns.Add("EachTotale", Type.GetType("System.Int32"))
        _dataSet.Tables("HRPROD").Columns.Add("Efficiency", Type.GetType("System.String"))
        _dataSet.Tables("HRPROD").Columns.Add("Media", Type.GetType("System.Int32"))
        _dataSet.Tables("HRPROD").Columns.Add("Tempo", Type.GetType("System.String"))
        _dataSet.Tables("HRPROD").Columns.Add("Sorting", Type.GetType("System.Int32"))


        Dim totRowEt As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowEtcomp As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowMan As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowRam As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowPre As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowPie As DataRow = _dataSet.Tables("HRPROD").NewRow



        For Each row As DataRow In _mainTable.Rows

            line = CType(Int32.Parse(CType(row(0).Remove(0, 5), String)), String)
            name = row(3).ToString()
            phase = row(7).ToString()
            comm = row(4).ToString()
            art = row(5).ToString()
            qty = CInt(row.Item(11)) * CInt(row.Item(6))
            Try
                qtyMan = CInt(row.Item(8)) * CInt(row.Item(9))
            Catch ex As Exception
                qtyMan = CInt(row.Item(8)) * 1
            End Try
            idrealizar = row(12).ToString()

            hour = CInt(row.Item(10))

            If phase.Contains("ET. COPP") Then
                sort = 1
            ElseIf phase.Contains("ET. COMP") Then
                sort = 2
            ElseIf phase.Contains("MANICHINO") Then
                sort = 3
            ElseIf phase.Contains("RAMMENDO") Then
                sort = 4
            ElseIf phase.Contains("PRESSA") Then
                sort = 5
            ElseIf phase.Contains("PIEGO") Then
                sort = 6
            Else
                sort = 7
            End If

            tKey = idrealizar & name & phase ' & comm & art
            'idrealizar
            If Not htbl.ContainsKey(tKey) Then
                Dim newRow As DataRow = _dataSet.Tables("HRPROD").NewRow
                newRow.Item(0) = line
                newRow.Item(1) = name
                newRow.Item(2) = phase
                newRow.Item(3) = comm
                newRow.Item(4) = art
                newRow.Item(hour + 5) = qty
                newRow.Item("EachTotale") = qty
                newRow.Item("Efficiency") = 0
                newRow.Item("Media") = JobPonderationMedia(idrealizar).ToString()
                newRow.Item("Efficiency") = JobPonderation(idrealizar).ToString() & "%"
                newRow.Item("Tempo") = ReturnHourJ(JobPonderationTempo(idrealizar))
                newRow.Item("Sorting") = sort
                _dataSet.Tables("HRPROD").Rows.Add(newRow)
                htbl.Add(tKey, index)
                index += 1
            Else
                Dim secRow = CInt(htbl(tKey))
                _dataSet.Tables("HRPROD").Rows(secRow).Item(hour + 5) = qty
                _dataSet.Tables("HRPROD").Rows(secRow).Item("EachTotale") += qty
            End If

            If sort = 1 Then
                sumEtt += qty
                If totRowEt.Item(hour + 5) Is DBNull.Value Then
                    totRowEt.Item(hour + 5) = qty
                Else
                    totRowEt.Item(hour + 5) += qty
                End If

            ElseIf sort = 2 Then
                sumEttcomp += qty
                If totRowEtcomp.Item(hour + 5) Is DBNull.Value Then
                    totRowEtcomp.Item(hour + 5) = qty
                Else
                    totRowEtcomp.Item(hour + 5) += qty
                End If

            ElseIf sort = 3 Then
                sumMan += qty
                If totRowMan.Item(hour + 5) Is DBNull.Value Then
                    totRowMan.Item(hour + 5) = qty
                Else
                    totRowMan.Item(hour + 5) += qty
                End If

            ElseIf sort = 4 Then
                sumRam += qty
                If totRowRam.Item(hour + 5) Is DBNull.Value Then
                    totRowRam.Item(hour + 5) = qty
                Else
                    totRowRam.Item(hour + 5) += qty
                End If

            ElseIf sort = 5 Then
                sumPre += qty
                If totRowPre.Item(hour + 5) Is DBNull.Value Then
                    totRowPre.Item(hour + 5) = qty
                Else
                    totRowPre.Item(hour + 5) += qty
                End If

            ElseIf sort = 6 Then
                sumPie += qty
                If totRowPie.Item(hour + 5) Is DBNull.Value Then
                    totRowPie.Item(hour + 5) = qty
                Else
                    totRowPie.Item(hour + 5) += qty
                End If
            End If
        Next

        'Etichete Totale - Row add
        totRowEt.Item(1) = "zzEt"
        totRowEt.Item("EachTotale") = sumEtt
        totRowEt.Item("Sorting") = 1
        _dataSet.Tables("HRPROD").Rows.Add(totRowEt)

        'Etichete Totale - Row add
        totRowEtcomp.Item(1) = "zzEtcomp"
        totRowEtcomp.Item("EachTotale") = sumEttcomp
        totRowEtcomp.Item("Sorting") = 2
        _dataSet.Tables("HRPROD").Rows.Add(totRowEtcomp)

        'Manichino Totale - Row add
        totRowMan.Item(1) = "zzMan"
        totRowMan.Item("EachTotale") = sumMan
        totRowMan.Item("Sorting") = 3
        _dataSet.Tables("HRPROD").Rows.Add(totRowMan)

        'Rammendo Totale - Row add
        totRowRam.Item(1) = "zzRam"
        totRowRam.Item("EachTotale") = sumRam
        totRowRam.Item("Sorting") = 4
        _dataSet.Tables("HRPROD").Rows.Add(totRowRam)

        'Pressa Totale - Row add
        totRowPre.Item(1) = "zzPre"
        totRowPre.Item("EachTotale") = sumPre
        totRowPre.Item("Sorting") = 5
        _dataSet.Tables("HRPROD").Rows.Add(totRowPre)

        'Piego Totale - Row add
        totRowPie.Item(1) = "zzPie"
        totRowPie.Item("EachTotale") = sumPie
        totRowPie.Item("Sorting") = 6
        _dataSet.Tables("HRPROD").Rows.Add(totRowPie)


        _dtV = New DataView(_dataSet.Tables("HRPROD"))
        _dtV.Sort = "Sorting Asc, Phase Desc, name Asc, line Asc"
        _dataSet.Tables("HRPROD").Columns.Remove("Sorting")
        gv_intervali.DataSource = _dtV
        gv_intervali.DataBind()

        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showintervali();", True)
        modalintervali.Visible = True
    End Sub
    'Dim _dt_Start As DateTime = DateTime.now
    Public Function Daily_Work_Stiro As DataTable
        Dim dt As New DataTable
        'dtStart = FormatDateTime(DateTime.Today)
        If sat < 15 Then
            Dim theCommand As New SqlCommand("spDailyWorkStiroTurnoOne", _myConnection)
            theCommand.CommandType = CommandType.StoredProcedure
            theCommand.Parameters.AddWithValue("@datew", dtStart)

            If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

            Dim dr As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.SequentialAccess)
            dt.Load(dr)
            dr.Close()
            theCommand = Nothing

            If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        End If

        If sat >= 15 Then

            Dim theCommand As New SqlCommand("spDailyWorkStiroTurnoTwo", _myConnection)
            theCommand.CommandType = CommandType.StoredProcedure
            theCommand.Parameters.AddWithValue("@datew", dtStart)

            If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

            Dim dr As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.SequentialAccess)
            dt.Load(dr)
            dr.Close()
            theCommand = Nothing

            If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        End If

        Return dt
    End Function
    Private _rowCheck As String = "ET."
    Private _phaseSum As Integer = 0

    Dim _tableIdx As Integer
    Dim _selName As String = Nothing
    'GV_INTERVAL
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gv_intervali.PageIndex = e.NewPageIndex
        Me.DataBind()
    End Sub

    Structure Break
        Dim StartPause, EndPause As Date
    End Structure

    Public Shared JPauze() As Break
    Public Shared _StartShift As DateTime
    Public Shared _EndShift As DateTime
    'PAUSE INTERVAL
    Public Shared Sub InitialPauseTime()
        Dim sat As Integer = DateTime.Now.Hour

        If sat < 15 Then
            _StartShift = #7:00:00 AM#
            _EndShift = #3:00:00 PM#
            Dim strPause As String = "10:40:00/11:00:00" & vbCrLf & "13:10:00/13:20:00"
            Dim tArray() As String = strPause.Split(CChar(vbCrLf))
            Dim len As Integer = tArray.Length - 1
            ReDim JPauze(len)
            For i As Integer = NullJ() To len
                Dim tdate() As String = tArray(i).Split(CChar("/"))
                JPauze(i).StartPause = CDate(tdate(0))
                JPauze(i).EndPause = CDate(tdate(1))
            Next
        Else
            _StartShift = #3:00:00 PM#
            _EndShift = #11:00:00 PM#
            Dim strPause As String = "18:30:00/18:50:00" & vbCrLf & "21:00:00/21:10:00"
            Dim tArray() As String = strPause.Split(CChar(vbCrLf))
            Dim len As Integer = tArray.Length - 1
            ReDim JPauze(len)
            For i As Integer = NullJ() To len
                Dim tdate() As String = tArray(i).Split(CChar("/"))
                JPauze(i).StartPause = CDate(tdate(0))
                JPauze(i).EndPause = CDate(tdate(1))
            Next

        End If


    End Sub
    'TIME INTERVAL
    Private Shared Function TimeInterval(startDate As Date, endDate As Date) As Single
        Dim startTmp, endTmp As TimeSpan
        Dim totalPauza As Single = NullJ()

        For Each pauzaJ As Break In JPauze
            Dim startPauza As TimeSpan = pauzaJ.StartPause.TimeOfDay
            Dim endPauza As TimeSpan = pauzaJ.EndPause.TimeOfDay

            If _
                (TimeSpan.Compare(endPauza, startDate.TimeOfDay) < 0) OrElse
                (TimeSpan.Compare(startPauza, endDate.TimeOfDay) > 0) Then
                Continue For
            Else
                If (TimeSpan.Compare(startPauza, startDate.TimeOfDay) > 0) Then startTmp = startPauza Else _
                    startTmp = startDate.TimeOfDay
                If (TimeSpan.Compare(endPauza, endDate.TimeOfDay) < 0) Then endTmp = endPauza Else _
                    endTmp = endDate.TimeOfDay
            End If

            totalPauza += CSng((endTmp - startTmp).TotalHours)
        Next

        Dim timpJob As Single = Convert.ToSingle((endDate - startDate).TotalHours) - totalPauza

        If timpJob < 0 Then timpJob = 0

        Return (timpJob)
    End Function

    Dim _selNameTbl As String
    'GV_Interval Name Persone
    Private Property RetName As String
        Get
            Return _selNameTbl
        End Get
        Set
            _selNameTbl = Value
        End Set
    End Property

    Shared _fixm As ISet(Of Single)    'set of fixed objects
    Interface IFixed
        Sub _fixer()
    End Interface

    Public Shared TblPnr As New DataTable

    Structure OutData
        Dim TimpJ As Single
        Dim QtyJ As Object
        Dim BphJ As Single
    End Structure

    Shared Shadows _tmpJobs(), _rfsTime As OutData
    Public Shared Function NullJ() As Single 'return sequences' zero values
        Return 0
    End Function
    'PONDERATION
    Private Function JobPonderation(vals As String) As Single
        InitialPauseTime()
        Dim efficiency As Single = 0

        Dim lng As Integer
        If IsNothing(_tmpJobs) Then lng = 0 Else lng = _tmpJobs.Length
        ReDim _tmpJobs(lng)
        _tmpJobs(lng).TimpJ = NullJ()
        _tmpJobs(lng).QtyJ = NullJ()
        _tmpJobs(lng).BphJ = NullJ()

        Dim bphxTl As Object = NullJ()
        Dim qtyxTl As Object = NullJ()
        Dim effGlobalJ As Single = NullJ()
        Dim medGlobalJ As Single = NullJ()

        For Each jRow As DataRow In _eff.Rows
            'GETTING DATA FOR CALCULATION
            Dim dbName As String = jRow.Item(0).ToString()

            Dim idSector As String = jRow.Item(17).ToString()
            Dim name As String = jRow.Item(0).ToString
            Dim startTimeJ = CDate(jRow.Item(10))

            Dim ts As TimeSpan = _StartShift.TimeOfDay - startTimeJ.TimeOfDay
            If ts.Minutes > 30 Then
                Dim tmpD As Date = startTimeJ.Date
                startTimeJ = tmpD + _StartShift.TimeOfDay
            End If

            Dim endTimeJ As Date
            If IsDBNull(jRow(13)) Then
                If IsDBNull(jRow.Item(12)) Then
                    If (Now < (startTimeJ.Date + _EndShift.TimeOfDay)) Then
                        endTimeJ = Now
                    Else
                        endTimeJ = startTimeJ.Date + _EndShift.TimeOfDay
                    End If
                Else
                    endTimeJ = CDate(jRow(12))
                End If
            Else
                endTimeJ = CDate(jRow(13))
            End If

            If dbName = vals Then
                'CALCULATION
                _tmpJobs(lng).TimpJ += TimeInterval(startTimeJ, endTimeJ)

                Dim jobQty As Object = IIf(IsDBNull(jRow.Item(8)), 0, CSng(jRow.Item(8)))
                Dim jobClick As Object = IIf(IsDBNull(jRow.Item(9)), 0, CSng(jRow.Item(9)))

                _tmpJobs(lng).QtyJ = jobQty * jobClick
                _tmpJobs(lng).BphJ = CSng(jRow.Item(7))

                bphxTl += (_tmpJobs(lng).QtyJ / _tmpJobs(lng).BphJ)
                qtyxTl += _tmpJobs(lng).QtyJ

                'MEDIA
                medGlobalJ = CSng(Math.Round((IIf(_tmpJobs(lng).TimpJ <> 0, ((qtyxTl / _tmpJobs(lng).TimpJ)), 0)), 0))

                'EFFICIENCY
                efficiency = CSng(Math.Round((IIf(_tmpJobs(lng).TimpJ <> 0, ((bphxTl / _tmpJobs(lng).TimpJ) * 100), 0)), 2))

            End If
        Next

        RetName = vals

        Return efficiency
    End Function
    'MEDIA
    Private Function JobPonderationMedia(vals As String) As Single
        InitialPauseTime()
        Dim efficiency As Single = 0

        Dim lng As Integer
        If IsNothing(_tmpJobs) Then lng = 0 Else lng = _tmpJobs.Length
        ReDim _tmpJobs(lng)
        _tmpJobs(lng).TimpJ = NullJ()
        _tmpJobs(lng).QtyJ = NullJ()
        _tmpJobs(lng).BphJ = NullJ()

        Dim bphxTl As Object = NullJ()
        Dim qtyxTl As Object = NullJ()
        Dim effGlobalJ As Single = NullJ()
        Dim medGlobalJ As Single = NullJ()
        'Dim s As New SimplexStiro '= New Simplex_Stiro

        For Each jRow As DataRow In _eff.Rows
            'GETTING DATA FOR CALCULATION
            Dim dbName As String = jRow.Item(0).ToString()

            Dim idSector As String = jRow.Item(17).ToString()
            Dim name As String = jRow.Item(0).ToString
            Dim startTimeJ = CDate(jRow.Item(10))

            Dim ts As TimeSpan = _StartShift.TimeOfDay - startTimeJ.TimeOfDay
            If ts.Minutes > 30 Then
                Dim tmpD As Date = startTimeJ.Date
                startTimeJ = tmpD + _StartShift.TimeOfDay
            End If

            Dim endTimeJ As Date
            If IsDBNull(jRow(13)) Then
                If IsDBNull(jRow.Item(12)) Then
                    If (Now < (startTimeJ.Date + _EndShift.TimeOfDay)) Then
                        endTimeJ = Now
                    Else
                        endTimeJ = startTimeJ.Date + _EndShift.TimeOfDay
                    End If
                Else
                    endTimeJ = CDate(jRow(12))
                End If
            Else
                endTimeJ = CDate(jRow(13))
            End If

            If dbName = vals Then
                'CALCULATION
                _tmpJobs(lng).TimpJ += TimeInterval(startTimeJ, endTimeJ)

                Dim jobQty As Object = IIf(IsDBNull(jRow.Item(8)), 0, CSng(jRow.Item(8)))
                Dim jobClick As Object = IIf(IsDBNull(jRow.Item(9)), 0, CSng(jRow.Item(9)))

                _tmpJobs(lng).QtyJ = jobQty * jobClick
                _tmpJobs(lng).BphJ = CSng(jRow.Item(7))

                bphxTl += (_tmpJobs(lng).QtyJ / _tmpJobs(lng).BphJ)
                qtyxTl += _tmpJobs(lng).QtyJ

                'MEDIA
                medGlobalJ = CSng(Math.Round((IIf(_tmpJobs(lng).TimpJ <> 0, ((qtyxTl / _tmpJobs(lng).TimpJ)), 0)), 0))

                'EFFICIENCY
                efficiency = CSng(Math.Round((IIf(_tmpJobs(lng).TimpJ <> 0, ((bphxTl / _tmpJobs(lng).TimpJ) * 100), 0)), 2))

            End If
        Next

        RetName = vals

        Return medGlobalJ
    End Function
    'TEMPO
    Private Function JobPonderationTempo(vals As String) As Single
        InitialPauseTime()
        Dim efficiency As Single = 0

        Dim lng As Integer
        If IsNothing(_tmpJobs) Then lng = 0 Else lng = _tmpJobs.Length
        ReDim _tmpJobs(lng)
        _tmpJobs(lng).TimpJ = NullJ()
        _tmpJobs(lng).QtyJ = NullJ()
        _tmpJobs(lng).BphJ = NullJ()

        Dim bphxTl As Single = NullJ()
        Dim qtyxTl As Single = NullJ()
        Dim effGlobalJ As Single = NullJ()
        Dim medGlobalJ As Single = NullJ()
        Dim tmpTime As Single = NullJ()
        'Dim s As New SimplexStiro '= New Simplex_Stiro

        For Each jRow As DataRow In _eff.Rows
            'GETTING DATA FOR CALCULATION
            Dim dbName As String = jRow.Item(0).ToString()

            Dim idSector As String = jRow.Item(17).ToString()
            Dim name As String = jRow.Item(0).ToString
            Dim startTimeJ = CDate(jRow.Item(10))

            Dim ts As TimeSpan = _StartShift.TimeOfDay - startTimeJ.TimeOfDay
            If ts.Minutes > 30 Then
                Dim tmpD As Date = startTimeJ.Date
                startTimeJ = tmpD + _StartShift.TimeOfDay
            End If

            Dim endTimeJ As Date
            If IsDBNull(jRow(13)) Then
                If IsDBNull(jRow.Item(12)) Then
                    If (Now < (startTimeJ.Date + _EndShift.TimeOfDay)) Then
                        endTimeJ = Now
                    Else
                        endTimeJ = startTimeJ.Date + _EndShift.TimeOfDay
                    End If
                Else
                    endTimeJ = CDate(jRow(12))
                End If
            Else
                endTimeJ = CDate(jRow(13))
            End If

            If dbName = vals Then
                'CALCULATION
                _tmpJobs(lng).TimpJ += TimeInterval(startTimeJ, endTimeJ)

                Dim jobQty As Single = IIf(IsDBNull(jRow.Item(8)), 0, CSng(jRow.Item(8)))
                Dim jobClick As Single = IIf(IsDBNull(jRow.Item(9)), 0, CSng(jRow.Item(9)))

                _tmpJobs(lng).QtyJ = jobQty * jobClick
                _tmpJobs(lng).BphJ = CSng(jRow.Item(7))

                bphxTl += (_tmpJobs(lng).QtyJ / _tmpJobs(lng).BphJ)
                qtyxTl += _tmpJobs(lng).QtyJ

                'MEDIA
                medGlobalJ = CSng(Math.Round((IIf(_tmpJobs(lng).TimpJ <> 0, ((qtyxTl / _tmpJobs(lng).TimpJ)), 0)), 0))

                'EFFICIENCY
                efficiency = CSng(Math.Round((IIf(_tmpJobs(lng).TimpJ <> 0, ((bphxTl / _tmpJobs(lng).TimpJ) * 100), 0)), 2))
                tmpTime = TimeInterval(startTimeJ, endTimeJ)
            End If
        Next

        RetName = vals

        Return tmpTime
    End Function
    'MEDIA - FUNCTION
    Private Shared Function ReturnHourJ(decimalJ As Single) As String
        Dim hourJ, minJ As Integer
        hourJ = CInt(Int(decimalJ))
        If hourJ > NullJ() Then
            minJ = CInt((decimalJ Mod hourJ) * 60)
            If minJ = 60 Then
                hourJ += 1
                minJ = NullJ()
            End If
        Else
            minJ = CInt(decimalJ * 60)
        End If
        ReturnHourJ = Format(hourJ, "0") & ":" & Format(minJ, "00")  'decimal to string converter 
    End Function
    Protected Sub ExportToPdf1(ByVal fileName As String, ByVal gv As GridView)

        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.ContentType = "application/pdf"
        Using sw As StringWriter = New StringWriter()
            Using htw As HtmlTextWriter = New HtmlTextWriter(sw)
                Dim table As Table = New Table()
                If gv.HeaderRow IsNot Nothing Then
                    table.Rows.Add(gv.HeaderRow)
                End If

                For Each row As GridViewRow In gv.Rows
                    table.Rows.Add(row)
                Next

                If gv.FooterRow IsNot Nothing Then
                    table.Rows.Add(gv.FooterRow)
                End If

                table.RenderControl(htw)
                Dim sr As New StringReader(sw.ToString())
                Dim pdfDoc As New Document(PageSize.A1, 1.0F, 1.0F, 1.0F, 0.0F)
                Dim htmlparser As New HTMLWorker(pdfDoc)
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
                pdfDoc.Open()
                htmlparser.Parse(sr)
                pdfDoc.Close()

                Response.ContentType = "application/pdf"
                Response.AddHeader("content-disposition", "attachment;filename=Stiro_Intervals.pdf")
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Write(pdfDoc)
                Response.[End]()

                HttpContext.Current.Response.Write(htw.ToString())
                HttpContext.Current.Response.End()
            End Using
        End Using
    End Sub
    Protected Sub ExportToPDF(ByVal sender As Object, ByVal e As EventArgs)
        Dim day As String = DateTime.Now.Day.ToString()
        Dim mounth As String = DateTime.Now.Month.ToString()
        Dim year As String = DateTime.Now.Year.ToString()

        Dim sat As String = DateTime.Now.Hour.ToString()
        Dim min As String = DateTime.Now.Minute.ToString()


        Dim s As String = "Stiro Intervals" + " " + day + "." + mounth + "." + year + " " + " " + sat + "h" + min + "min"

        gv_intervali.AllowPaging = False
        If Page.IsPostBack = False
            btnintervali_Click(sender, e)
        End If
        ExportToPdf1("'" + s + "'.pdf", gv_intervali)
    End Sub
    Protected Sub ExportToEXC(ByVal sender As Object, ByVal e As EventArgs)

        Dim day As String = DateTime.Now.Day.ToString()
        Dim mounth As String = DateTime.Now.Month.ToString()
        Dim year As String = DateTime.Now.Year.ToString()

        Dim sat As String = DateTime.Now.Hour.ToString()
        Dim min As String = DateTime.Now.Minute.ToString()


        Dim s As String = "Stiro Intervals" + " " + day + "." + mounth + "." + year + " " + " " + sat + "h" + min + "min"

        gv_intervali.AllowPaging = False
        If Page.IsPostBack = False
            btnintervali_Click(sender, e)
        End If
        ExportExcel("'" + s + "'.xls", gv_intervali)
    End Sub
    Public Shared Sub ExportExcel(ByVal fileName As String, ByVal gv As GridView)
        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.AddHeader("content-disposition", String.Format("attachment; filename={0}", fileName))
        HttpContext.Current.Response.ContentType = "application/ms-excel"
        Using sw As StringWriter = New StringWriter()
            Using htw As HtmlTextWriter = New HtmlTextWriter(sw)
                Dim table As Table = New Table()
                If gv.HeaderRow IsNot Nothing Then
                    gv.HeaderRow.Attributes.Add("style", "background-color:#333333;color:white;font-size:medium;")

                    table.Rows.Add(gv.HeaderRow)
                    'gv.HeaderRow.Attributes.Add("style","background-color:#333333;color:white;font-size:medium;")

                End If

                For Each row As GridViewRow In gv.Rows
                    table.Rows.Add(row)
                Next

                If gv.FooterRow IsNot Nothing Then
                    table.Rows.Add(gv.FooterRow)
                End If

                table.RenderControl(htw)
                HttpContext.Current.Response.Write(sw.ToString())
                HttpContext.Current.Response.End()
            End Using
        End Using
    End Sub

    ReadOnly _hr(24) As Boolean
    Sub LoadHours()
        Const query = "SELECT * FROM Hours Where Idx='6'"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader

        While dr.Read()
            For i = 0 To 23
                _hr(i) = CBool(dr(i))
            Next
        End While
        cmd.Dispose()
        dr.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub
    Sub LoadColumns()
        LoadHours()

        Dim colTable As New DataTable
        colTable = _dataSet.Tables.Add("HRPROD")
        Dim str = String.Empty
        Dim i As Integer


        colTable.Columns.Add("Line", GetType(String))
        colTable.Columns.Add("Name", GetType(String))
        colTable.Columns.Add("Phase", GetType(String))
        colTable.Columns.Add("Commessa", GetType(String))
        colTable.Columns.Add("Article", GetType(String))

        For i = 0 To 23
            str = Format(i, "00") & "h"
            colTable.Columns.Add(str, GetType(Integer))
        Next

    End Sub
    Dim sat As Int32 = DateTime.Now.Hour
    'OVO JE PO OSOBAMA
    Public Sub Strasnafunkcija(sender As Object, e As GridViewRowEventArgs)
        'Dim sat As Int32
        'sat = DateTime.Now.Hour

        If sat < 15 Then
            For i = 5 To 10
                e.Row.Cells(i).Visible = False
            Next

            For i = 22 To 28
                e.Row.Cells(i).Visible = False
            Next
        End If

        If sat >= 15 Then
            For i = 5 To 19
                e.Row.Cells(i).Visible = False
            Next
        End If
    End Sub
    'OVO JE ZA SVE INTERVALE
    Public Sub Strasnafunkcijaintervali(sender As Object, e As GridViewRowEventArgs)

        e.Row.Cells(1).Attributes.Add("style", "padding-left:5px;")
        e.Row.Cells(2).Attributes.Add("style", "padding-left:5px;")
        e.Row.Cells(3).Attributes.Add("style", "padding-left:5px;")
        e.Row.Cells(4).Attributes.Add("style", "padding-left:5px;")

        'ETICHETE COPP
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzEt" Then
            e.Row.Cells(1).Text = "ET.Copp Totale:"
            e.Row.Attributes.Add("style", "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
        End If

        'ETICHETE COMP
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzEtcomp" Then
            e.Row.Cells(1).Text = "ET.Comp Totale:"
            e.Row.Attributes.Add("style", "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
        End If

        'MANICHINO 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzMan" Then
            e.Row.Cells(1).Text = "Manichino Totale:"
            e.Row.Attributes.Add("style", "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
        End If

        'RAMMENDO 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzRam" Then
            e.Row.Cells(1).Text = "Rammendo Totale:"
            e.Row.Attributes.Add("style", "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
        End If

        'PRESSA 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzPre" Then
            e.Row.Cells(1).Text = "Pressa Totale:"
            e.Row.Attributes.Add("style", "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
        End If

        'PIEGO 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzPie" Then
            e.Row.Cells(1).Text = "Piego Totale:"
            e.Row.Attributes.Add("style", "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
        End If

        For i = 5 To e.Row.Cells.Count - 1
            e.Row.Cells(i).Attributes.Add("style", "text-align:center;")
        Next

        If sat < 15 Then
            For i = 5 To 10
                e.Row.Cells(i).Visible = False
            Next

            For i = 22 To 28
                e.Row.Cells(i).Visible = False
            Next
        End If

        If sat >= 15 Then
            For i = 5 To 19
                e.Row.Cells(i).Visible = False
            Next
        End If
    End Sub
    Public Sub PrimaTurno_Click(sender As Object, e As EventArgs) Handles btnintervali.Click

        Dim tKey As String = String.Empty
        Dim line As String = String.Empty
        Dim name As String = String.Empty
        Dim phase As String = String.Empty
        Dim comm As String = String.Empty
        Dim art As String = String.Empty
        Dim qty = 0
        Dim hour = 0
        Dim sort = 0
        Dim qtyMan As Single = 0
        Dim idrealizar As String = 0
        Dim time As Single = 0

        _mainTable.Clear()
        _mainTable = Daily_Work_Stiro

        Dim htbl As New Hashtable
        Dim index = 0
        Dim sumEttcomp = 0

        Dim sumEtt = 0
        Dim sumMan = 0
        Dim sumRam = 0
        Dim sumPre = 0
        Dim sumPie = 0

        LoadColumns()

        _dataSet.Tables("HRPROD").Columns.Add("EachTotale", Type.GetType("System.Int32"))
        _dataSet.Tables("HRPROD").Columns.Add("Efficiency", Type.GetType("System.String"))
        _dataSet.Tables("HRPROD").Columns.Add("Media", Type.GetType("System.Int32"))
        _dataSet.Tables("HRPROD").Columns.Add("Tempo", Type.GetType("System.String"))
        _dataSet.Tables("HRPROD").Columns.Add("Sorting", Type.GetType("System.Int32"))

        Dim totRowEt As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowEtcomp As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowMan As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowRam As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowPre As DataRow = _dataSet.Tables("HRPROD").NewRow
        Dim totRowPie As DataRow = _dataSet.Tables("HRPROD").NewRow

        For Each row As DataRow In _mainTable.Rows

            line = CType(Int32.Parse(CType(row(0).Remove(0, 5), String)), String)
            name = row(3).ToString()
            phase = row(7).ToString()
            comm = row(4).ToString()
            art = row(5).ToString()
            qty = CInt(row.Item(11)) * CInt(row.Item(6))
            Try
                qtyMan = CInt(row.Item(8)) * CInt(row.Item(9))
            Catch ex As Exception
                qtyMan = CInt(row.Item(8)) * 1
            End Try
            idrealizar = row(12).ToString()

            hour = CInt(row.Item(10))

            If phase.Contains("ET. COPP") Then
                sort = 1
            ElseIf phase.Contains("ET. COMP") Then
                sort = 2
            ElseIf phase.Contains("MANICHINO") Then
                sort = 3
            ElseIf phase.Contains("RAMMENDO") Then
                sort = 4
            ElseIf phase.Contains("PRESSA") Then
                sort = 5
            ElseIf phase.Contains("PIEGO") Then
                sort = 6
            Else
                sort = 7
            End If

            tKey = idrealizar & name & phase ' & comm & art
            'idrealizar
            If Not htbl.ContainsKey(tKey) Then
                Dim newRow As DataRow = _dataSet.Tables("HRPROD").NewRow
                newRow.Item(0) = line
                newRow.Item(1) = name
                newRow.Item(2) = phase
                newRow.Item(3) = comm
                newRow.Item(4) = art
                newRow.Item(hour + 5) = qty
                newRow.Item("EachTotale") = qty
                newRow.Item("Efficiency") = 0
                newRow.Item("Media") = JobPonderationMedia(idrealizar).ToString()
                newRow.Item("Efficiency") = JobPonderation(idrealizar).ToString() & "%"
                newRow.Item("Tempo") = ReturnHourJ(JobPonderationTempo(idrealizar))

                'newRow.Item("ID") = idrealizar
                newRow.Item("Sorting") = sort
                _dataSet.Tables("HRPROD").Rows.Add(newRow)
                htbl.Add(tKey, index)
                index += 1
            Else
                Dim secRow = CInt(htbl(tKey))
                _dataSet.Tables("HRPROD").Rows(secRow).Item(hour + 5) = qty
                _dataSet.Tables("HRPROD").Rows(secRow).Item("EachTotale") += qty
                'dataSet.Tables("HRPROD").Rows(secRow).Item("Media") += 0
            End If

            If sort = 1 Then
                sumEtt += qty
                If totRowEt.Item(hour + 5) Is DBNull.Value Then
                    totRowEt.Item(hour + 5) = qty
                Else
                    totRowEt.Item(hour + 5) += qty
                End If

            ElseIf sort = 2 Then
                sumEttcomp += qty
                If totRowEtcomp.Item(hour + 5) Is DBNull.Value Then
                    totRowEtcomp.Item(hour + 5) = qty
                Else
                    totRowEtcomp.Item(hour + 5) += qty
                End If

            ElseIf sort = 3 Then
                sumMan += qty
                If totRowMan.Item(hour + 5) Is DBNull.Value Then
                    totRowMan.Item(hour + 5) = qty
                Else
                    totRowMan.Item(hour + 5) += qty
                End If

            ElseIf sort = 4 Then
                sumRam += qty
                If totRowRam.Item(hour + 5) Is DBNull.Value Then
                    totRowRam.Item(hour + 5) = qty
                Else
                    totRowRam.Item(hour + 5) += qty
                End If

            ElseIf sort = 5 Then
                sumPre += qty
                If totRowPre.Item(hour + 5) Is DBNull.Value Then
                    totRowPre.Item(hour + 5) = qty
                Else
                    totRowPre.Item(hour + 5) += qty
                End If

            ElseIf sort = 6 Then
                sumPie += qty
                If totRowPie.Item(hour + 5) Is DBNull.Value Then
                    totRowPie.Item(hour + 5) = qty
                Else
                    totRowPie.Item(hour + 5) += qty
                End If
            End If
        Next

        'Etichete Totale - Row add
        totRowEt.Item(1) = "zzEt"
        totRowEt.Item("EachTotale") = sumEtt
        lbl_et_copp_tot.Text = sumEtt.ToString()
        totRowEt.Item("Sorting") = 1
        _dataSet.Tables("HRPROD").Rows.Add(totRowEt)


        'Etichete Totale - Row add
        totRowEtcomp.Item(1) = "zzEtcomp"
        totRowEtcomp.Item("EachTotale") = sumEttcomp
        lbl_et_comp_tot.Text = sumEttcomp.ToString()
        totRowEtcomp.Item("Sorting") = 2
        _dataSet.Tables("HRPROD").Rows.Add(totRowEtcomp)

        'Manichino Totale - Row add
        totRowMan.Item(1) = "zzMan"
        totRowMan.Item("EachTotale") = sumMan
        lbl_et_manichino_tot.Text = sumMan.ToString()
        totRowMan.Item("Sorting") = 3
        _dataSet.Tables("HRPROD").Rows.Add(totRowMan)

        'Rammendo Totale - Row add
        totRowRam.Item(1) = "zzRam"
        totRowRam.Item("EachTotale") = sumRam
        lbl_et_rammendo_tot.Text = sumRam.ToString()
        totRowRam.Item("Sorting") = 4
        _dataSet.Tables("HRPROD").Rows.Add(totRowRam)

        'Pressa Totale - Row add
        totRowPre.Item(1) = "zzPre"
        totRowPre.Item("EachTotale") = sumPre
        lbl_et_pressa_tot.Text = sumPre.ToString()
        totRowPre.Item("Sorting") = 5
        _dataSet.Tables("HRPROD").Rows.Add(totRowPre)

        'Piego Totale - Row add
        totRowPie.Item(1) = "zzPie"
        totRowPie.Item("EachTotale") = sumPie
        lbl_et_piego_tot.Text = sumPie.ToString()
        totRowPie.Item("Sorting") = 6
        _dataSet.Tables("HRPROD").Rows.Add(totRowPie)


        _dtV = New DataView(_dataSet.Tables("HRPROD"))
        _dtV.Sort = "Sorting Asc, Phase Desc, name Asc, line Asc"
        _dataSet.Tables("HRPROD").Columns.Remove("Sorting")
        gv_intervali.DataSource = _dtV
        gv_intervali.DataBind()

        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showintervali();", True)
        'System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, GetType(Page), "Script", "showchart();", True)

    End Sub
    Public Sub Intervali_choser() Handles cal_button.Click
        Dim turno As Integer = Convert.ToInt32(cal_turno1.SelectedValue)
        'cal_intervali.Text = Date.Now

        'intervali_current_turno.Text = "Turno: " & turno.ToString()

        If cal_intervali.Text <> String.Empty
            dtStart = (cal_intervali.Text)
        Else
            dtStart = DateTime.ParseExact(DateTime.Today, "MM/dd/yyyy", CultureInfo.InvariantCulture)
            'cal_intervali.Text = dtStart
        End If

        'intervali_current_date.Text = "Date: " & dtStart
        If turno = 1
            sat = 8
        End If

        If turno = 2
            sat = 16
        End If

        PrimaTurno_Click(Nothing, Nothing)


    End Sub


End Class
