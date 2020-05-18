Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing

Namespace Views.Produzione


    Partial Class ConfezioneB
        Inherits System.Web.UI.Page

        Dim _eff_b As New DataTable
        Dim _dtStart, _dtStop As DateTime
        Public CtX As Integer = 1

        Dim _strConnection As String
        Public MyConnection As New SqlConnection
        Public MyDataSet As New DataSet

        Public Shared StartShift As DateTime
        Public Shared EndShift As DateTime

        Dim _pnGroup As Panel()
        Dim _pnTitGroup As Panel()
        Dim ActiveDT As Object

        Structure WorkerDetails
            Dim Name As String
            Dim Commesse As String
            Dim Masina As String
            Dim Faza As String
            Dim Linea As String
            Dim Norm As Single
            Dim Qty As Single
            Dim ComQty As Single
            Dim HrQty As Single
            Dim Different As Single
            Dim Time As Single
            Dim Realiz As String
            Dim Ord As String
            Dim ValClick As Single
            Dim SingleQty As Single
            Dim Articole As String
            Dim efficenzapersona As String
        End Structure

        Public Shared Inform() As WorkerDetails
        ReadOnly _dtOrganizator As New DataTable

        Structure Liber
            Dim StartPauza As Date
            Dim EndPauza As Date
        End Structure

        Shared _arrPauze() As Liber
        Shared modEff As Integer

        Dim _dt_Start As Date
        ReadOnly hr(24) As Boolean
        ReadOnly dataSet As New DataSet
        Dim dtV As DataView
        ReadOnly mainTable As New DataTable
        Dim _mainName As String
        Shared ReadOnly _ds As New DataSet()
        ReadOnly dtBreak As New DataTable
        Private lblPresentEff As Label
        Private pnTit As Panel
        'Private sender As Object
        Shared _dtAssent As New DataTable
        Dim pInactiv As String = String.Empty
        Private Property _obj As Object
        Dim p As New Panel
        Shared ReadOnly _dtVerifyLinea As New DataTable
        Dim tmpTable As DataTable
        ReadOnly _tblPauza As New DataTable
        Dim _manichinoColleciton() As Button  'group manichino 
        Public Shared Man As Manichin
        Dim Results As Object
        Dim cappitot As Integer = 0
        Shared _leng As Integer

        Dim WithEvents btn_get_cappi As ImageButton
        Dim WithEvents btn_get_efficiency As ImageButton
        Dim WithEvents btn_get_assenteismo As ImageButton
        Dim WithEvents btn_get_machines As ImageButton

        Dim WithEvents btn_report As ImageButton
        Dim WithEvents btn_org As ImageButton
        Dim WithEvents btn_pause As ImageButton

        Dim WithEvents btn_crveno As Button
        Dim WithEvents btn_zuto As Button
        Dim WithEvents btn_zeleno As Button
        Dim WithEvents btn_default As Button
        Dim WithEvents btn_assenteismo As ImageButton

        Dim lbl_total_eff_text_confA As Label
        Dim lbl_total_eff_value_confA As Label
        Dim lbl_total_ass_text_confA As Label
        Dim lbl_total_ass_value_confA As Label
        Dim lbl_ultimo_agiornato_text As Label


        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
            Page.Title = "Confezione B"

            'If Not Me.Page.User.Identity.IsAuthenticated Then
            '    FormsAuthentication.RedirectToLoginPage()
            'End If

            Response.BufferOutput = True
            Response.Buffer = True

            btn_get_efficiency = CType(Master.FindControl("cmdDownload"), ImageButton)
            btn_get_cappi = CType(Master.FindControl("capiDownload"), ImageButton)
            btn_get_assenteismo = CType(Master.FindControl("ppptDownload"), ImageButton)
            btn_get_machines = CType(Master.FindControl("testdugme"), ImageButton)

            btn_report = CType(Master.FindControl("btn_report"), ImageButton)
            btn_org = CType(Master.FindControl("btn_org"), ImageButton)
            btn_pause = CType(Master.FindControl("btn_pause"), ImageButton)

            'Efficiency and Assenteismo
            lbl_total_eff_text_confA = CType(Master.FindControl("lbl_total_eff_text"), Label)
            lbl_total_eff_value_confA = CType(Master.FindControl("lbl_total_eff_value"), Label)
            lbl_total_ass_text_confA = CType(Master.FindControl("lbl_total_ass_text"), Label)
            lbl_total_ass_value_confA = CType(Master.FindControl("lbl_total_ass_value"), Label)

            lbl_ultimo_agiornato_text = CType(Master.FindControl("lbl_ultimo_agiornato"), Label)
            'Sorting Panels
            CType(Master.FindControl("pnl_sort_by_phase"), Panel).Controls.Add(pnl_sort_by_phase_confb)
            CType(Master.FindControl("pnl_sort_by_line"), Panel).Controls.Add(pnl_sort_by_line_confb)

            'Sorting Buttons - Colors / Default
            btn_crveno = CType(Master.FindControl("crveno"), Button)
            btn_zuto = CType(Master.FindControl("zuto"), Button)
            btn_zeleno = CType(Master.FindControl("zeleno"), Button)
            btn_default = CType(Master.FindControl("btndefault"), Button)
            btn_assenteismo = CType(Master.FindControl("filterassenteismo"), ImageButton)


            _pnGroup = New Panel() _
                {contLine1, contLine2, contLine3, contLine4, contLine5, contLine6, contLine7, contLine8, contLine9,
                 contLine10, contLine11, contLine12}

            _strConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
            MyConnection = New SqlConnection(_strConnection)


            StartShift = #7:00:00 AM#
            EndShift = #3:00:00 PM#

            Dim nl As String = Environment.NewLine

            StartTimeEndTimePauses()
            ActiveDT = New DataTable
            TopLeftTimer()

            Controls.Remove(ModalPanel)
            ModalPanel.Visible = False

            _dtAssent.Clear()

            btn_crveno.BackColor = Color.Crimson
            btn_zuto.BackColor = Color.Yellow
            btn_zeleno.BackColor = Color.FromArgb(42, 171, 42)

            If (Page.IsPostBack = False) Then
                GetMachines(MyConnection)
                BtnDownload_click(sender, e)
            End If

            lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")
            ScriptManager.RegisterStartupScript(upd_confb, upd_confb.GetType(), "a_key", "<script type='text/javascript' src='../../js/confb-js.js'></script>", False)

        End Sub


        Protected Sub Timer_db_update_Tick(sender As Object, e As EventArgs)
            _dtAssent.Clear()
            lbl_ultimo_agiornato_text = CType(Master.FindControl("lbl_ultimo_agiornato"), Label)

            BtnDownload_click(sender, e)

            'For Each p As Panel In _pnGroup
            '    DrawBreakRectangles(p)
            'Next

            If modEff = 2 Then
                BtnDownload_pppt_click(Nothing, Nothing)
            ElseIf modEff = 3 Then
                BtnDownload_capi_click(Nothing, Nothing)
            End If

            lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")
            ScriptManager.RegisterStartupScript(upd_confb, upd_confb.GetType(), "a_key", "<script type='text/javascript' src='../../js/confb-js.js'></script>", False)

        End Sub

        'Protected Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error

        '    Dim ex = Server.GetLastError

        '    If ex.Message.Contains("Specific string from controls' error") Then
        '        Server.ClearError()
        '        Response.Redirect("https://loknitting.olimpias.it/ConfezioneB.aspx")
        '    End If
        '    Response.Redirect("https://loknitting.olimpias.it/ConfezioneB.aspx")

        'End Sub

        Protected Sub StartTimeEndTimePauses()

            Select Case Weekday(Now)
                Case vbSunday
                    Call Weekend()
                Case vbMonday
                    Call NonWeekend()
                Case vbTuesday
                    Call NonWeekend()
                Case vbWednesday
                    Call NonWeekend()
                Case vbThursday
                    Call NonWeekend()
                Case vbFriday
                    Call NonWeekend()
                Case vbSaturday
                    Call Weekend()
            End Select

        End Sub

        Protected Sub NonWeekend()
            Dim sat As Integer = DateTime.Now.Hour
            Dim strPause As String
            Dim danas As DateTime = DateTime.Today
            Dim subota = vbSaturday

            If sat < 15 Then
                StartShift = #7:00:00 AM#
                EndShift = #3:00:00 PM#
                strPause = "10:40:00/11:00:00" & vbCrLf & "13:10:00/13:20:00"
                Dim tArray() As String = strPause.Split(CChar(vbCrLf))
                Dim len As Integer = tArray.Length - 1
                ReDim _arrPauze(len)
                For i = 0 To len
                    Dim tdate() As String = tArray(i).Split(CChar("/"))
                    _arrPauze(i).StartPauza = Convert.ToDateTime(tdate(0))
                    _arrPauze(i).EndPauza = Convert.ToDateTime(tdate(1))
                Next

            Else

                StartShift = #3:00:00 PM#
                EndShift = #11:00:00 PM#
                strPause = "18:30:00/18:50:00" & vbCrLf & "21:00:00/21:10:00"
                Dim tArray() As String = strPause.Split(CChar(vbCrLf))
                Dim len As Integer = tArray.Length - 1
                ReDim _arrPauze(len)
                For i = 0 To len
                    Dim tdate() As String = tArray(i).Split(CChar("/"))
                    _arrPauze(i).StartPauza = Convert.ToDateTime(tdate(0))
                    _arrPauze(i).EndPauza = Convert.ToDateTime(tdate(1))
                Next
            End If
        End Sub

        Protected Sub Weekend()

            Dim sat As Integer = DateTime.Now.Hour
            Dim strPause As String
            Dim danas As DateTime = DateTime.Today
            Dim subota = vbSaturday

            StartShift = #7:00:00 AM#
            EndShift = #3:00:00 PM#
            strPause = "10:40:00/11:00:00" & vbCrLf & "13:10:00/13:20:00"

            Dim tArray() As String = strPause.Split(CChar(vbCrLf))
            Dim len As Integer = tArray.Length - 1
            ReDim _arrPauze(len)
            For i = 0 To len
                Dim tdate() As String = tArray(i).Split(CChar("/"))
                _arrPauze(i).StartPauza = Convert.ToDateTime(tdate(0))
                _arrPauze(i).EndPauza = Convert.ToDateTime(tdate(1))
            Next

        End Sub

        Public Sub btn_org_click(sender As Object, e As EventArgs) Handles btn_org.Click
            Page.Response.Redirect("./Report_Light.aspx")
        End Sub

        Public Sub btn_pause_click(sender As Object, e As EventArgs) Handles btn_pause.Click
            Page.Response.Redirect("./Pauses.aspx")
        End Sub

        'GET
        Public Sub Efficiency_Procedure()
            Try
                _eff_b.Clear()

                Dim dtStart As String
                dtStart = FormatDateTime(DateTime.Today)

                Dim cmd As New SqlCommand("spEfficiencyConfB", MyConnection)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@startTime", SqlDbType.DateTime).Value = dtStart
                cmd.Parameters.Add("@stopTime", SqlDbType.DateTime).Value = dtStart


                If MyConnection.State = ConnectionState.Closed Then
                    MyConnection.Open()
                End If

                Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

                _eff_b.Load(dr)

                dr.Close()
                cmd.Dispose()

                If MyConnection.State = ConnectionState.Open Then
                    MyConnection.Close()
                End If
            Catch ex As Exception
                Efficiency_Procedure()
            End Try

        End Sub

        'GET
        Public Sub Buttons_Hover(ByVal dt1 As DataTable, ByVal dt2 As DataTable)

            If dt1 Is Nothing OrElse dt2 Is Nothing Then
                If _dtVerifyLinea Is Nothing Then
                    FaseVerify()
                End If

                If _eff_b Is Nothing Then
                    Efficiency_Procedure()
                End If

                Buttons_Hover(_dtVerifyLinea, _eff_b)
            End If

            For Each p As Panel In _pnGroup
                For Each obj As Object In p.Controls
                    Dim btn = TryCast(obj, Button)

                    Dim Results =
                            (
                            From table1 In dt1 Join table2 In dt2 On table1.Field(Of String)("Name") Equals table2.Field(Of String)("Angajat") Where table1.Field(Of String)("Name") = table2.Field(Of String)("Angajat") And
                                                                                                                                                     table1.Field(Of String)("Line") <> table2.Field(Of String)("Linie")
                            Select table1)

                    If btn IsNot Nothing Then
                        GetPropertiesDetails(btn.TabIndex.ToString())
                        Results = From myRow In Results Where myRow(0) = Inform(_leng).Name Select myRow


                        With Inform(_leng)

                            btn.Attributes("title") = .Name

                            For Each row In Results

                                If row.Item(1).ToString() IsNot .Linea And btn.BackColor <> Color.White Then
                                    btn.Attributes("title") = .Name & " - " & row.Item(1).ToString()
                                    btn.Attributes.Add("style", "border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")
                                End If
                            Next

                        End With

                    End If
                Next
            Next
        End Sub

        Public Sub btndefault_Click() Handles btn_default.Click
            Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
        End Sub
        'GET
        Public Sub FaseVerify()
            'CutEff()
            VeriftyFase()
            Buttons_Hover(_dtVerifyLinea, _eff_b)
        End Sub
        'GET

        Dim tbl_breaktable As New DataTable

        Private Sub GetBreakTable(con As SqlConnection)
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            tbl_machines.Clear()

            'Dim query As String
            'query = "Select * FROM Machine_Code"
            Dim q As String = "SELECT tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Masini.CodMasina "
            q += "FROM tblPause INNER JOIN Realizari ON tblPause.IdRealization = Realizari.Id "
            q += "INNER JOIN Masini ON Realizari.IdMasina = Masini.Id WHERE "
            q += "tblPause.StartTime > CAST(CURRENT_TIMESTAMP As Date)"
            Dim cmd = New SqlDataAdapter(q, con)
            cmd.Fill(tbl_machines)
            cmd.Dispose()
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub
        Private Sub DrawBreakRectangles(p As Panel)
            'dtBreak.Clear()

            'continue after another operation when it's done
            'If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()

            'Dim q As String = "SELECT tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Masini.CodMasina "
            'q += "FROM tblPause INNER JOIN Realizari ON tblPause.IdRealization = Realizari.Id "
            'q += "INNER JOIN Masini ON Realizari.IdMasina = Masini.Id WHERE "
            'q += "tblPause.StartTime > CAST(CURRENT_TIMESTAMP As Date)"
            'Dim adap As New SqlDataAdapter(q, MyConnection)
            'adap.Fill(dtBreak)
            'adap.Dispose()
            'If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

            For Each o As Object In p.Controls
                Dim lbl As Button = TryCast(o, Button)

                If lbl IsNot Nothing Then
                    For Each row As DataRow In tbl_machines.Rows
                        Dim breakType As String = row(0).ToString()
                        If Not breakType = "WC" Then Continue For
                        Dim breakCode As String = (row(3).ToString())
                        If breakCode = lbl.TabIndex.ToString() AndAlso IsDBNull(row(2)) Then
                            lbl.BorderColor = Color.DarkGray
                            lbl.BackColor = Color.Gray
                            lbl.Attributes.Add("value", "WC")
                            lbl.ForeColor = Color.White
                            lbl.CssClass += " example"
                        End If
                    Next
                End If
            Next
            tbl_machines.Dispose()
        End Sub



        'The ReadData and WriteData methods can be safely called from multiple 
        ' threads.
        Public ReadWriteLock As New System.Threading.ReaderWriterLock()
        Sub ReadData()
            ' This procedure reads information from some source.
            ' The read lock prevents data from being written until the thread 
            ' is done reading, while allowing other threads to call ReadData.
            ReadWriteLock.AcquireReaderLock(System.Threading.Timeout.Infinite)
            Try
                ' Perform read operation here.
                AddButtonsHandlers()
                GetOffline()
                GetPPandPt()
                Efficiency_Procedure()
                FaseVerify()


            Finally
                ReadWriteLock.ReleaseReaderLock() ' Release the read lock.
            End Try
        End Sub


        Public Sub BtnDownload_click(sender As Object, e As EventArgs) Handles btn_get_efficiency.Click
            modEff = 1
            ReadData()
            ColorByEfficiency()

            GetBreakTable(MyConnection)
            For Each p As Panel In _pnGroup
                DrawBreakRectangles(p)
            Next

            lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")
        End Sub


        Public Sub BtnDownload_pppt_click(sender As Object, e As EventArgs)
            modEff = 2

            modEff = 2
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn As Button = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.BorderColor = Color.Red Then
                            btn.BorderWidth = 1
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.DodgerBlue
                        End If
                    End If
                Next
            Next

        End Sub

        Public Sub BtnDownload_capi_click(sender As Object, e As EventArgs) Handles btn_get_cappi.Click
            modEff = 3

            If _eff_b Is Nothing Then
                Efficiency_Procedure()
            End If

            Dim str As String = String.Empty
            For Each pan As Panel In _pnGroup
                cappitot = 0

                For Each butt As Button In pan.Controls.OfType(Of Button)
                    butt.Text = String.Empty
                    Dim results = From myRow In _eff_b.Rows Where myRow("CodMasina") = butt.TabIndex Select myRow
                    For Each row In results
                        If IsDBNull(row("Closed")) Then
                            butt.Text = (CSng(row.Item("Cantitate")) * CInt(row.Item("BucatiButon"))).ToString()
                            cappitot += Convert.ToInt32(butt.Text)

                        End If
                    Next
                Next

                For Each pnPan As Panel In pan.Controls.OfType(Of Panel)

                    For Each lbl As Label In pnPan.Controls.OfType(Of Label)
                        lbl.Text = lbl.Text & " "
                    Next
                Next
            Next
        End Sub

        Public Sub TopLeftTimer()
            Dim sat As Integer
            Dim min As Integer
            Dim sec As Integer
            Dim diorefatte As String
            Dim diorefatte1 As String

            sat = DateTime.Now.Hour
            min = DateTime.Now.Minute
            sec = DateTime.Now.Second

            diorefatte = DateTime.Now.AddHours(-7).ToString("hh:mm:ss")
            diorefatte1 = DateTime.Now.AddHours(-15).ToString("hh:mm:ss")

            'If sat < 15 Then
            '    lblTime1.Text = "Numero di ore fatte: " & diorefatte
            'End If

            'If sat > 15 Then
            '    lblTime1.Text = "Numero di ore fatte: " & diorefatte1
            'End If
        End Sub


        Public Function GetEficiencyDetails(masina As Short) As Single
            Dim efficiency As Single

            Dim temp As String  'machine
            Dim isActive = False 'act activation

            Dim tempOra As String = String.Empty
            Dim tempCantitate As String = String.Empty
            Dim tempBucati As String = String.Empty
            Dim temp1 As String

            Dim workTime As Single

            'If _eff Is Nothing
            '    Efficiency_Procedure()
            'End If

            For Each row As DataRow In _eff_b.Rows
                temp = row.Item(3).ToString()

                If temp = masina Then
                    temp1 = row.Item(8).ToString()
                    tempOra = row.Item(7).ToString()
                    tempBucati = row.Item(9).ToString()

                    isActive = CBool(row.Item(16))

                    If temp1 <> "0" Then
                        tempCantitate = row.Item(8).ToString()
                    End If

                    Dim startTime = CDate(row.Item(10))
                    Dim ts As TimeSpan = StartShift.TimeOfDay - startTime.TimeOfDay
                    If ts.Minutes > 30 Then
                        Dim tmpD As DateTime = startTime.Date
                        startTime = tmpD + StartShift.TimeOfDay
                    End If

                    Dim endTime As DateTime

                    If IsDBNull(row(13)) Then
                        If IsDBNull(row.Item(12)) Then
                            If (Now < (startTime.Date + EndShift.TimeOfDay)) Then
                                endTime = Now
                            Else
                                endTime = startTime.Date + EndShift.TimeOfDay
                            End If
                        Else
                            endTime = CDate(row(12))
                        End If
                    Else
                        endTime = CDate(row(13))
                    End If

                    If startTime > endTime Then
                        Continue For
                    End If

                    workTime = WorkersRunetime(startTime, endTime)
                End If

                Dim norm As Single
                Dim cantitate As Single
                Dim bucati As Single

                If tempOra <> String.Empty OrElse tempOra <> Nothing Then
                    norm = Single.Parse(tempOra)
                End If

                If tempCantitate <> String.Empty OrElse tempCantitate <> Nothing Then
                    cantitate = Single.Parse(tempCantitate)
                End If

                If tempBucati <> String.Empty OrElse tempBucati <> Nothing Then
                    bucati = Single.Parse(tempBucati)
                End If

                Dim fullQty As Single = (cantitate * bucati)
                Dim wkTime As Single = (norm * workTime)

                If isActive = False Then
                    efficiency = 0
                Else
                    If cantitate >= 0 AndAlso cantitate < 2 Then
                        efficiency = 0
                    Else
                        efficiency = (fullQty / wkTime)
                    End If
                End If
            Next

            Return (efficiency * 100)

        End Function

        Public Shared Function WorkersRunetime(startInterval As DateTime, endInterval As DateTime) As Single
            Dim startTmp, endTmp As TimeSpan

            Dim totalPauza As Single = 0
            For Each pauza As Liber In _arrPauze
                Dim startPauza As TimeSpan = pauza.StartPauza.TimeOfDay
                Dim endPauza As TimeSpan = pauza.EndPauza.TimeOfDay

                If (TimeSpan.Compare(endPauza, startInterval.TimeOfDay) < 0) OrElse
                   (TimeSpan.Compare(startPauza, endInterval.TimeOfDay) > 0) Then
                    Continue For
                Else
                    If (TimeSpan.Compare(startPauza, startInterval.TimeOfDay) > 0) Then
                        startTmp = startPauza
                    Else
                        startTmp = startInterval.TimeOfDay
                    End If
                    If (TimeSpan.Compare(endPauza, endInterval.TimeOfDay) < 0) Then
                        endTmp = endPauza
                    Else
                        endTmp = endInterval.TimeOfDay
                    End If
                End If

                totalPauza += CSng((endTmp - startTmp).TotalHours)
            Next

            Dim timpJob As Single = CSng((endInterval - startInterval).TotalHours) - totalPauza

            If timpJob < 0 Then
                timpJob = 0
            End If

            Return (timpJob)
        End Function

        Public Sub GetPropertiesDetails(idMasina As String)

            If IsNothing(Inform) Then
                _leng = 0
            Else
                _leng = Inform.Length
            End If

            ReDim Preserve Inform(_leng)

            With Inform(_leng)
                .Commesse = String.Empty
                .Faza = String.Empty
                .Masina = String.Empty
                .Name = String.Empty
                .Articole = String.Empty
                .Linea = String.Empty

                Dim temp As String

                For Each row As DataRow In _eff_b.Rows
                    temp = row.Item(3).ToString()
                    If temp = idMasina Then
                        .Masina = temp.ToString()
                        .Linea = row.Item(18).ToString()
                        .Name = row.Item(2).ToString()
                        .Articole = row.Item(21).ToString()
                        .Faza = row.Item(6).ToString()
                        .Norm = CSng(row.Item(7))
                        .Qty = CSng(row.Item(8)) * CInt(row.Item(9))
                        .ComQty = CInt(row.Item(15))
                        .ValClick = CSng(row.Item(9))
                        .SingleQty = CSng(row.Item(8))

                        Dim startTime = CDate(row.Item(10))
                        Dim ts As TimeSpan = StartShift.TimeOfDay - startTime.TimeOfDay
                        If ts.Minutes > 30 Then
                            Dim tmpD As DateTime = startTime.Date
                            startTime = tmpD + StartShift.TimeOfDay
                        End If

                        Dim endTime As DateTime
                        If IsDBNull(row(13)) Then
                            If IsDBNull(row.Item(12)) Then
                                If (Now < (startTime.Date + EndShift.TimeOfDay)) Then
                                    endTime = Now
                                Else
                                    endTime = startTime.Date + EndShift.TimeOfDay
                                End If
                            Else
                                endTime = CDate(row(12))
                            End If
                        Else
                            endTime = CDate(row(13))
                        End If

                        Dim factor As Single = WorkersRunetime(startTime, endTime)

                        .HrQty = CSng(Math.Round(.Qty / factor, 0))

                        If Single.IsInfinity(.HrQty) Then
                            .HrQty = 0
                        ElseIf Single.IsNaN(.HrQty) Then
                            .HrQty = 0
                        End If

                        .Different = CSng(Math.Round(.Norm - .HrQty, 0))
                        .Time = WorkersRunetime(startTime, endTime)

                    End If
                Next
            End With
        End Sub

        Public Sub ColorByEfficiency()

            Dim totEff As Single
            Dim mac = 0

            Dim newMac = 0
            Dim newSim As New Button

            Dim efc As Single = 0




            SummTotalEffByLine(contLine1, LINEA1, lbltitle1, lblLine1, wclineP1, newSim, newMac, efc)
            SummTotalEffByLine(contLine2, LINEA2, lblTitle2, lblLine2, wclineP2, newSim, newMac, efc)
            SummTotalEffByLine(contLine3, LINEA3, lblTitle3, lblLine3, wclineP3, newSim, newMac, efc)
            SummTotalEffByLine(contLine4, LINEA4, lblTitle4, lblLine4, wclineP4, newSim, newMac, efc)
            SummTotalEffByLine(contLine5, LINEA5, lblTitle5, lblLine5, wclineP5, newSim, newMac, efc)
            SummTotalEffByLine(contLine6, LINEA6, lblTitle6, lblLine6, wclineP6, newSim, newMac, efc)
            SummTotalEffByLine(contLine7, LINEA7, lblTitle7, lblLine7, wclineP7, newSim, newMac, efc)
            SummTotalEffByLine(contLine8, LINEA8, lblTitle8, lblLine8, wclineP8, newSim, newMac, efc)
            SummTotalEffByLine(contLine9, LINEA9, lblTitle9, lblLine9, wclineP9, newSim, newMac, efc)
            SummTotalEffByLine(contLine10, LINEA10, lblTitle10, lblLine10, wclineP10, newSim, newMac, efc)
            SummTotalEffByLine(contLine11, LINEA11, lblTitle11, lblLine11, wclineP11, newSim, newMac, efc)
            SummTotalEffByLine(contLine12, LINEA12, lblTitle12, lblLine12, wclineP12, newSim, newMac, efc)

            For Each iPanel As Panel In _pnGroup
                For Each o As Object In iPanel.Controls

                    Dim simulator = TryCast(o, Button)
                    If simulator IsNot Nothing Then
                        NewMethod(totEff, mac, efc, simulator)
                    End If
                Next
            Next


            'Odsutne(assL1, contLine1)
            'Odsutne(assL2, contLine2)
            'Odsutne(assL3, contLine3)
            'Odsutne(assL4, contLine4)
            'Odsutne(assL5, contLine5)
            'Odsutne(assL6, contLine6)
            'Odsutne(assL7, contLine7)
            'Odsutne(assL8, contLine8)
            'Odsutne(assL9, contLine9)
            'Odsutne(assL10, contLine10)
            'Odsutne(assL11, contLine11)
            'Odsutne(assL12, contLine12)
        End Sub

        Public Sub Odsutne(listaOdsutnih As DataView, panel As Panel)
            Dim rand As New Random


            Dim emptyButtons As New List(Of Int32)
            Dim buttons = panel.Controls.OfType(Of Button)
            Dim odsutne As New List(Of String)
            Dim faze As New List(Of String)
            Dim data = (From a In buttons Select a).ToList()

            For index = 0 To data.Count
                If index < data.Count Then
                    If data(index).Text.Equals(String.Empty) Then
                        emptyButtons.Add(index)
                    End If
                End If
            Next


            For Each row As DataRowView In listaOdsutnih
                odsutne.Add(row.Item(1).ToString)
                faze.Add(row.Item(2).ToString)
                odsutne.Distinct()

            Next

            For index = 0 To listaOdsutnih.Count
                Dim idx As Integer = rand.Next(0, emptyButtons.Count)

                odsutne.Distinct()

                Dim btn As New Button
                'btn.BorderColor = Color.Silver
                btn = panel.Controls.OfType(Of Button).ToList(emptyButtons(idx))

                If index = 4 Then
                    btn = panel.Controls.OfType(Of Button).ToList(emptyButtons(index + 1))
                End If

                If index < odsutne.Count Then

                    btn.Text = odsutne.ToList(index)
                    btn.ForeColor = Color.Red
                    'btn.BorderColor = Color.Red
                    'btn.BorderWidth = 1
                End If
            Next


        End Sub

        'GET
        Public Sub GetPPandPt()

            _dtOrganizator.Clear()

            Dim cmd As New SqlCommand("AssenteismoOrganizator", MyConnection)

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@Sector", SqlDbType.Int).Value = 1
            cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = 1
            '1 => line in line1 -> linea12; 0=> line in line13 ->linea17
            cmd.Parameters.Add("@bool", SqlDbType.Bit).Value = 1



            If MyConnection.State = ConnectionState.Closed Then
                MyConnection.Open()
            End If

            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

            _dtOrganizator.Load(dr)

            dr.Close()
            cmd.Dispose()

            If MyConnection.State = ConnectionState.Open Then
                MyConnection.Close()
            End If

            FaseVerify()
        End Sub

        'Public Sub GetAssent(dtass As DataTable)
        '    dtass.Clear()

        '    Dim cmd As New SqlCommand("AssenteismoOrganizator", MyConnection)

        '    cmd.CommandType = CommandType.StoredProcedure
        '    cmd.Parameters.Add("@Sector", SqlDbType.Int).Value = 1
        '    cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = 0
        '    cmd.Parameters.Add("@bool", SqlDbType.Bit).Value = 1



        '    If MyConnection.State = ConnectionState.Closed Then
        '        MyConnection.Open()
        '    End If

        '    Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

        '    dtass.Load(dr)

        '    dr.Close()
        '    cmd.Dispose()

        '    If MyConnection.State = ConnectionState.Open Then
        '        MyConnection.Close()
        '    End If
        'End Sub

        Private Sub NewMethod(ByRef totEff As Single, ByRef mac As Integer, ByRef efc As Single, ByRef simulator As Button)

            With simulator
                If .TabIndex > 0 Then
                    efc = GetEficiencyDetails(simulator.TabIndex)
                    efc = CSng(Math.Round(efc, 0))

                    If Single.IsInfinity(efc) Then
                        efc = 100
                    ElseIf Single.IsNaN(efc) Then
                        efc = 0
                    End If

                    If efc > 200 Then
                        efc = 100
                    End If


                    With simulator
                        If (efc <= 0) Then
                            .BackColor = Color.White
                            .Text = String.Empty
                            .BorderStyle = BorderStyle.Solid

                        Else
                            .BorderStyle = BorderStyle.Solid
                            If (efc > 0 AndAlso efc <= 69.5) Then
                                mac = mac + 1
                                .BackColor = Color.Crimson
                                .ForeColor = Color.White
                                .BorderColor = Color.DarkRed
                            ElseIf (efc > 69.5 AndAlso efc <= 89.5) Then
                                mac = mac + 1
                                .BackColor = Color.Yellow
                                .ForeColor = Color.Black
                                .BorderColor = Color.Gold
                            ElseIf (efc > 89.5) Then
                                mac = mac + 1
                                .BackColor = Color.FromArgb(42, 171, 42)
                                .ForeColor = Color.White
                                .BorderColor = Color.Green
                            End If
                        End If
                    End With

                    If efc > 0 Then
                        Dim sb As New StringBuilder
                        sb.AppendLine(efc.ToString())
                        simulator.Text = sb.ToString() & "%"
                    Else
                        simulator.Text = String.Empty
                    End If

                    totEff = totEff + efc

                    SummTotalEfficiency(totEff, mac, lblTotEfficiency)

                End If
            End With
        End Sub

        Private Sub ColorizeSystem(r1 As Integer, r2 As Integer, r3 As Integer, y1 As Integer, y2 As Integer, y3 As Integer,
                                   g1 As Integer, g2 As Integer, g3 As Integer, ByRef btn As Button, ByRef int As Integer,
                                   ByRef efc As Single)

            Dim rColor As Color = Color.FromArgb(r1, r2, r3)
            Dim yColor As Color = Color.FromArgb(y1, y2, y3)
            Dim gColor As Color = Color.FromArgb(g1, g2, g3)

            With btn
                If (efc <= 0) Then
                    .BackColor = Color.White
                    .Text = String.Empty
                    .Font.Size = 9
                    .BorderColor = Color.DodgerBlue
                    .BorderStyle = BorderStyle.Solid
                    .BorderWidth = 1
                    '.ForeColor = Color.White
                Else
                    .BorderStyle = BorderStyle.Solid
                    If (efc >= 0 AndAlso efc <= 69.5) Then
                        int = int + 1
                        .Font.Size = 9
                        .BackColor = rColor
                        ModalPanel.BackColor = rColor
                        .ForeColor = Color.White
                        .BorderColor = Color.FromArgb(255, 210, 15, 52)
                    ElseIf (efc > 69.5 AndAlso efc <= 89.5) Then
                        int = int + 1
                        .Font.Size = 9
                        .BackColor = yColor
                        ModalPanel.BackColor = yColor

                        .ForeColor = Color.Black
                        .BorderColor = Color.Gold
                    ElseIf (efc > 89.5) Then
                        int = int + 1
                        .Font.Size = 9
                        .BackColor = gColor
                        ModalPanel.BackColor = gColor
                        .ForeColor = Color.White
                        .BorderColor = Color.FromArgb(1, 0, 152, 0)
                    End If
                End If
            End With
        End Sub
        Private Sub SummTotalEfficiency(sngEff As Single, machines As Integer, lbl As Label)
            'GetPPandPT()
            'zero as default
            Dim totalEfficiency As Single = 0
            Dim pinactivee As Single = 0
            Dim strBuild As New StringBuilder

            'arithmetical value
            Dim totEffFirst As Single = (sngEff / machines)

            totalEfficiency = CSng(Math.Round(totEffFirst, 0)) '%
            lbltoteffConfA.Text = totalEfficiency.ToString()
            strBuild.AppendLine("Conf B eff = " & totalEfficiency.ToString())


            Dim pInactiveView As DataView = New DataView(_tblassent)
            pinactivee = pInactiveView.Count

            Dim totalEfficiencyAss As Single = 0
            Dim totEffFirstAss As Single = (sngEff / (machines + pinactivee))

            totalEfficiencyAss = CSng(Math.Round(totEffFirstAss, 0))

            ColorTotalEffLabel(totalEfficiency, lbl)
            lbl.Text = strBuild.ToString() & "%"

            lbl1.Text = "Current Efficiency: " & totalEfficiency & "%"


            If totalEfficiency < 69 Then

                lbl_total_eff_text_confA.ForeColor = Color.Red
                lbl_total_eff_value_confA.ForeColor = Color.Red
            ElseIf totalEfficiency > 69 And totalEfficiency < 89 Then
                lbl_total_eff_text_confA.ForeColor = Color.Yellow
                lbl_total_eff_value_confA.ForeColor = Color.Yellow
            ElseIf totalEfficiency > 89 Then
                lbl_total_eff_text_confA.ForeColor = Color.YellowGreen
                lbl_total_eff_value_confA.ForeColor = Color.YellowGreen
            End If

            If totalEfficiencyAss < 69 Then
                lbl_total_ass_text_confA.ForeColor = Color.Red
                lbl_total_ass_value_confA.ForeColor = Color.Red
            ElseIf totalEfficiencyAss > 69 And totalEfficiency < 89 Then
                lbl_total_ass_text_confA.ForeColor = Color.Yellow
                lbl_total_ass_value_confA.ForeColor = Color.Yellow
            ElseIf totalEfficiencyAss > 89 Then
                lbl_total_ass_text_confA.ForeColor = Color.YellowGreen
                lbl_total_ass_value_confA.ForeColor = Color.YellowGreen
            End If

            lbl_total_eff_value_confA.Text = totalEfficiency.ToString() & "%"
            lbl_total_ass_value_confA.Text = totalEfficiencyAss.ToString() & "%"

            Page.Title = "Confezione B = " + lbl_total_eff_value_confA.Text

        End Sub


        Private Sub SummTotalEffByLine(p As Panel, pnTit As Panel, lbltitle As Label, lblPresentEff As Label, lblshortstat As Label, btn As Button, n As Integer, efc As Single)
            Dim e As Single
            Dim totEff As Single = 0
            Dim pp As String
            Dim pt As String
            Dim ass As Single

            Try
                For Each obj As Object In p.Controls
                    btn = TryCast(obj, Button)
                    If btn IsNot Nothing Then
                        If btn.TabIndex > 0 Then

                            efc = GetEficiencyDetails(btn.TabIndex)
                            efc = CSng(Math.Round(efc, 0))

                            If (efc > 0 AndAlso efc <= 69.5) Then
                                n = n + 1
                            ElseIf (efc > 69.5 AndAlso efc <= 89.5) Then
                                n = n + 1
                            ElseIf (efc > 89.5 AndAlso efc <= 99.5) Then
                                n = n + 1
                            ElseIf (efc > 99.5 AndAlso efc <= 10000) Then
                                n = n + 1
                            End If

                            If efc > 200 Then
                                efc = 100
                            End If

                            If Single.IsNaN(efc) Then
                                efc = 0
                            End If

                            e = e + efc
                        End If
                    End If

                    totEff = e / n
                    totEff = CSng(Math.Round(totEff, 0))


                    If Single.IsNaN(totEff) Then
                        totEff = 0
                    End If

                    If Single.IsInfinity(totEff) Then
                        totEff = 100
                    End If



                    Try

                        Dim pInactivEff As Single
                        Dim pInactivView As DataView = New DataView(_tblassent)
                        pInactivView.RowFilter = "Line='" & pnTit.ID.ToString & "'"

                        Dim ppView As DataView = New DataView(_dtOrganizator)
                        ppView.RowFilter = "Line='" & pnTit.ID.ToString & "'"

                        Dim ptView As DataView = New DataView(_dtOrganizator)
                        ptView.RowFilter = "Line='" & pnTit.ID.ToString & "' "

                        pInactiv = pInactivView.Count.ToString()
                        pInactivView.Dispose()

                        pInactivEff = e / CSng(n + pInactiv)
                        pInactivEff = CSng(Math.Round(pInactivEff, 0))

                        If Single.IsNaN(pInactivEff) Then
                            pInactivEff = 0
                        End If

                        If Single.IsInfinity(pInactivEff) Then
                            pInactivEff = 100
                        End If
                        pp = ppView.Count.ToString()
                        ppView.Dispose()

                        pt = ptView.Count.ToString()
                        ptView.Dispose()

                        ass = CSng(pt) - CSng(pp)


                        _dtOrganizator.Dispose()


                        If modEff = 1 Then ' BTN EFF
                            lbltitle.Text = pnTit.ID.ToString()
                            lblPresentEff.Text = totEff.ToString() & "%" & "/" & pInactivEff.ToString() & "% "
                            lblshortstat.Text = n.ToString() & "/" & pInactiv
                        End If

                        If modEff = 2 Then

                            lblPresentEff.Text = pnTit.ID.ToString() & " " & totEff.ToString() & "%" & " PT: " & pt & " / PP: " &
                                                 pp & " / AS: " & ass

                        End If

                        If modEff = 3 Then ' BTN CAPI

                            lblPresentEff.Text = pnTit.ID.ToString() & " "

                        End If

                    Catch ex As Exception

                    End Try

                    If Double.IsInfinity(totEff) Then
                        totEff = 100
                    End If

                    If Double.IsNaN(totEff) Then
                        totEff = 0
                    End If
                Next
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            'If totEff <= 0 Then
            '    pnTit.BackColor = Color.Silver
            '    lblPresentEff.ForeColor = Color.White
            'End If

            If (totEff > 0 AndAlso totEff <= 69.5) Then
                pnTit.CssClass = "red-title"
                lblPresentEff.ForeColor = Color.White

            ElseIf (totEff > 69.5 AndAlso totEff <= 89.5) Then
                pnTit.CssClass = "yellow-title"
                lblPresentEff.ForeColor = Color.Black
            ElseIf (totEff > 89.5) Then
                pnTit.CssClass = "green-title"
                lblPresentEff.ForeColor = Color.White
            ElseIf totEff <= 0 Then
                'pnTit.BackColor = Color.Silver
                pnTit.CssClass = "silver-title"
                lblPresentEff.ForeColor = Color.Black

            End If
        End Sub

        Private Shared Sub ColorTotalEffLabel(value As Single, lbl As Label)
            With lbl
                If value > 0 AndAlso value < 69.5 Then
                    .ForeColor = Color.Crimson
                    .BorderColor = Color.DarkRed
                ElseIf (value > 69.5 AndAlso value <= 89.5) Then
                    .ForeColor = Color.Gold
                    .BorderColor = Color.YellowGreen
                ElseIf (value > 89.5) Then
                    .ForeColor = Color.LimeGreen
                    .BorderColor = Color.Green
                End If
            End With
        End Sub

        Private Sub AddButtonsHandlers()
            Dim btnClicks As New List(Of Button)

            For i As Integer = LBound(_pnGroup) To UBound(_pnGroup) Step 1
                Dim iPanel As Panel = _pnGroup(i)
                btnClicks.AddRange(From obj In iPanel.Controls.OfType(Of Button)() Let allButtons = obj Select obj)
            Next

            For c = 0 To btnClicks.Count - 1
                AddHandler btnClicks(c).Click, AddressOf Buttons_Click
            Next
        End Sub

        Private Sub FilterAssent(sender As Object, e As EventArgs) Handles btn_assenteismo.Click

            BtnDownload_pppt_click(Nothing, Nothing)
        End Sub

        Private Sub FilterTagliacuci(sender As Object, e As EventArgs) Handles tagliacuci.Click
            'TAGLIACUCI
            modEff = 1
            ColorByEfficiency()

            Dim casted_Btn = TryCast(sender, Button)


            For Each _P As Panel In _pnGroup
                For Each Obj As Object In _P.Controls
                    Dim btn = TryCast(Obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "1" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.DodgerBlue
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterRimagli(sender As Object, e As EventArgs) Handles rimagli.Click
            'RIMAGLI
            modEff = 1
            ColorByEfficiency()

            Dim casted_Btn = TryCast(sender, Button)


            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "2" Then

                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1

                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.DodgerBlue
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterOV(sender As Object, e As EventArgs) Handles ov.Click
            'TAGLIACUCI
            modEff = 1
            ColorByEfficiency()

            Dim casted_Btn = TryCast(sender, Button)


            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "3" Then

                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1

                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.DodgerBlue
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterTraveta(sender As Object, e As EventArgs) Handles traveta.Click
            'Traveta
            modEff = 1
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "4" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.DodgerBlue
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterRifinitura(sender As Object, e As EventArgs) Handles rifinitura.Click
            'rifinitura
            modEff = 1
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "5" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.DodgerBlue
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterBtnByColors(sender As Object, e As EventArgs) Handles btn_crveno.Click, btn_zuto.Click, btn_zeleno.Click
            modEff = 1

            GetMachines(MyConnection)
            'GetPPandPT()
            'Efficiency_Procedure()
            ColorByEfficiency()

            Dim casted_Btn = TryCast(sender, Button)

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn = TryCast(_obj, Button)

                    If btn IsNot Nothing Then

                        If casted_Btn.BackColor <> btn.BackColor Then
                            btn.BackColor = Color.White
                            btn.BorderColor = Color.DodgerBlue
                            btn.Text = ""
                            btn.BorderWidth = 1
                        Else
                            btn.BackColor = casted_Btn.BackColor
                            btn.BorderColor = casted_Btn.BackColor
                        End If
                    End If
                Next
            Next
        End Sub

        Public Sub Machinenumbers(sender As Object, e As EventArgs) Handles btn_get_machines.Click
            For Each pan As Panel In _pnGroup
                For Each butt As Button In pan.Controls.OfType(Of Button)
                    butt.Text = butt.TabIndex.ToString()
                Next
            Next
        End Sub

        Public Sub Logoutclick(sender As Object, e As EventArgs)
            '''LogOffUser(lblUsername.Text)
            Session("user") = Nothing
            Session.Clear()
            Session.Abandon()
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
            Response.Redirect("LogInInformator.aspx")
        End Sub

        Private Sub LogOffUser(user As String)
            'Threading.Thread.Sleep(100)
            Dim query As String = "Update user_Account Set is_webonline='False' WHERE E_mail='" & user & "'"

            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd As New SqlCommand(query, MyConnection)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        'GET

        Dim tbl_machines As New DataTable
        Public Sub GetMachines(con As SqlConnection)
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            tbl_machines.Clear()

            Dim query As String
            query = "Select * FROM Machine_Code"
            Dim cmd = New SqlDataAdapter(query, con)
            cmd.Fill(tbl_machines)
            cmd.Dispose()


            For Each pan As Panel In _pnGroup
                For Each butt As Button In pan.Controls.OfType(Of Button)
                    If butt.TabIndex = 0 Then
                        Dim buttFullTag As String = String.Empty
                        buttFullTag = butt.ID.Remove(0, 3)

                        Dim buttTag As Int32
                        buttTag = Int32.Parse(buttFullTag)
                        buttTag = buttTag Mod 20
                        If buttTag = 0 Then
                            buttTag = 20
                        End If

                        Dim panTag As String
                        panTag = pan.ID.Remove(0, 8)


                        ''BITAN BOOST start! :D
                        Dim rows() As DataRow = tbl_machines.Select("Id = '" & panTag & "," & buttTag & "'")
                        If rows.Count > 0 Then
                            butt.TabIndex = rows(0).Item("Code")
                        End If
                        cmd.Dispose()
                        ''BITAN BOOST end! :D


                    End If

                Next
            Next
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        Public Sub SetIfActive(machineCode As String, con As SqlConnection)
            ActiveDT.Clear()
            Dim machineColumn As New DataColumn
            Dim name As New DataColumn
            ActiveDT.Columns.Add(machineColumn)
            ActiveDT.Columns.Add(name)

            Dim query As String =
                    "select Name from Organizator where Name = (select Angajat from Angajati where Id = (select top 1 IdAngajat from Realizari where FirstWrite >= CAST(CURRENT_TIMESTAMP As Date) and IdMasina = (select Id from Masini where CodMasina = '" &
                    machineCode & "'))) and Active = 1 "

            Dim cmd = New SqlCommand(query, con)
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            Dim row As DataRow
            row = ActiveDT.NewRow()
            row(0) = machineCode

            While dr.Read()
                row(1) = dr.Item(0).ToString()
            End While

            ActiveDT.Rows.Add(row)

            dr.Close()
            cmd.Dispose()
        End Sub

        Public Function GetWorkerNameByMachineNo(machineCode As String) As String
            For Each row As DataRow In ActiveDT.Rows
                If row(0) = machineCode Then
                    Return row(1).ToString()
                End If
            Next
            Return ""
        End Function

        Public Sub SetActiveWorkers(con As SqlConnection)
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            For Each pan As Panel In _pnGroup
                For Each butt As Button In pan.Controls.OfType(Of Button)

                    butt.Text = ""
                    butt.BackColor = Color.White

                    butt.Text = GetWorkerNameByMachineNo(butt.TabIndex.ToString)
                Next
            Next
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        'Public Sub GetMembersOffline()

        '    'GetPPandPT()
        '    'GetAssent(_dtAssent)
        '    GetOffline()

        '    For Each pan As Panel In _pnGroup


        '        Dim rows As DataRow() = _tblassent.Select("Line='LINEA" & pan.ID.Remove(0, 8) & "'")
        '        For Each row As DataRow In rows
        '            If row(5).ToString() = "1" Then
        '                Dim butt As New Button With {
        '                        .Text = "kkk"
        '                        }


        '                Dim control_id As String
        '                Dim rnd_1 = 2
        '                Dim rnd_2 = 1
        '                Try
        '                    While butt.Text IsNot String.Empty And butt.Text <> row.Item(1).ToString()
        '                        control_id = "btn" + (rnd_1 + 20 * (Integer.Parse(pan.ID.Remove(0, 8)) - 1)).ToString()
        '                        butt = DirectCast(FindControl(control_id), Button)
        '                        rnd_1 += 1
        '                        If rnd_1 = 6 Then rnd_1 = 10
        '                    End While

        '                    butt.Text = row(1).ToString()

        '                    butt.BorderStyle = BorderStyle.Solid
        '                    butt.BorderWidth = 1
        '                    butt.BorderColor = Color.Crimson
        '                    butt.BackColor = Color.White
        '                    butt.Font.Size = 6
        '                    butt.Dispose()
        '                Catch ex As Exception
        '                    '_dtOrganizator.Dispose()

        '                    Exit Sub
        '                End Try

        '            Else

        '                Dim butt As New Button With {
        '                        .Text = "kkk"
        '                        }
        '                Dim control_id As String
        '                Dim rnd_1 = 2
        '                Dim rnd_2 = 1
        '                Try
        '                    While butt.Text IsNot String.Empty And butt.Text <> row.Item(1).ToString()
        '                        control_id = "btn" + (rnd_2 + 20 * (Integer.Parse(pan.ID.Remove(0, 8)) - 1)).ToString()
        '                        butt = DirectCast(FindControl(control_id), Button)
        '                        rnd_2 += 1
        '                        If rnd_2 = 2 Then
        '                            rnd_2 = 6
        '                        ElseIf rnd_2 = 8 Then
        '                            rnd_2 = 9
        '                        ElseIf rnd_2 = 16 Then
        '                            rnd_2 = 17

        '                        ElseIf rnd_2 = 10 Then
        '                            rnd_2 = 15
        '                        End If

        '                    End While

        '                    butt.Text = row(1).ToString()
        '                    butt.BorderStyle = BorderStyle.Solid
        '                    butt.BorderColor = Color.Red
        '                    butt.BackColor = Color.White
        '                    butt.BorderWidth = 1
        '                    butt.Font.Size = 6
        '                    butt.Dispose()

        '                Catch ex As Exception
        '                    Exit Sub
        '                End Try

        '            End If
        '        Next
        '    Next

        'End Sub

        Public Sub GetMembersOffline(con As SqlConnection)
            For Each pan As Panel In _pnGroup
                For Each buttons As Button In pan.Controls.OfType(Of Button)
                    If Not buttons.Text.Contains("%") Then
                        buttons.Text = String.Empty
                    End If
                Next
            Next
            Dim query As String = "Select Name, Line, ShortJob, Lavoro from Organizator where Active=0 And Line <> '' AND ShortJob <> 0 and Lavoro <> '' and Lavoro <> 'Capolinea' and Lavoro <> 'Manichino'"
            Dim offlineDT As New DataTable

            con.Open()
            Dim cmd As SqlCommand = New SqlCommand(query, con)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            offlineDT.Load(dr)
            con.Close()

            Dim control_id As String

            For Each pan As Panel In _pnGroup
                Dim rnd_1 As Integer = 2
                Dim rnd_2 As Integer = 1

                Dim rows As DataRow() = offlineDT.Select("Line='LINEA" & pan.ID.Remove(0, 8) & "'")
                For Each row As DataRow In rows
                    If row(2).ToString() = "1" Then
                        Dim butt As New Button With {
                                .Text = "kkk"
                                }

                        Try
                            While butt.Text IsNot String.Empty
                                control_id = "btn" + (rnd_1 + 20 * (Integer.Parse(pan.ID.Remove(0, 8)) - 1)).ToString()
                                butt = DirectCast(FindControl(control_id), Button)
                                rnd_1 += 1
                                If rnd_1 = 6 Then rnd_1 = 10
                            End While

                            butt.Text = row(0).ToString()

                            butt.BorderStyle = BorderStyle.Solid
                            butt.BorderWidth = 2
                            butt.BorderColor = Color.Red
                            butt.BackColor = Color.White
                            butt.Font.Size = 7
                            butt.Dispose()
                        Catch ex As Exception

                        End Try

                    Else
                        Dim butt As New Button With {
                                .Text = "kkk"
                                }

                        Try
                            While butt.Text IsNot String.Empty
                                control_id = "btn" + (rnd_2 + 20 * (Integer.Parse(pan.ID.Remove(0, 8)) - 1)).ToString()
                                butt = DirectCast(FindControl(control_id), Button)
                                rnd_2 += 1
                                If rnd_2 = 2 Then
                                    rnd_2 = 6
                                ElseIf rnd_2 = 8 Then
                                    rnd_2 = 9
                                ElseIf rnd_2 = 16 Then
                                    rnd_2 = 17

                                ElseIf rnd_2 = 10 Then
                                    rnd_2 = 15
                                End If

                            End While

                            butt.Text = row(0).ToString()
                            butt.BorderStyle = BorderStyle.Solid
                            butt.BorderColor = Color.Red
                            butt.BackColor = Color.White
                            butt.BorderWidth = 2
                            butt.Font.Size = 6
                            butt.Dispose()
                        Catch ex As Exception

                        End Try

                    End If
                Next
            Next

            offlineDT.Dispose()
        End Sub

        Public Sub LoadDataTable()
            mainTable.Clear()
            _dt_Start = CDate(FormatDateTime(Date.Now, DateFormat.GeneralDate))
            Dim theCommand As New SqlCommand("spDailyWorkConfBOptima", MyConnection) With {
                    .CommandType = CommandType.StoredProcedure
                    }
            theCommand.Parameters.AddWithValue("@datew", _dt_Start)
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()

            Dim dataAdapter As SqlDataAdapter = New SqlDataAdapter With {
                    .SelectCommand = theCommand
                    }
            dataAdapter.Fill(mainTable)
            Dim dr As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.SequentialAccess)
            mainTable.Load(dr)
            dr.Close()
            theCommand = Nothing

            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

        End Sub

        Sub LoadHours()
            Dim query = "SELECT * FROM Hours Where Idx='1'"

            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd As New SqlCommand(query, MyConnection)
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                While dr.Read()
                    For i = 6 To 16
                        hr(i) = CBool(dr(i))
                    Next
                End While
            End If
            dr.Close()
            cmd.Dispose()

            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        Sub LoadColumns()
            LoadHours()
            Dim colTable As DataTable = dataSet.Tables.Add("HRPROD")
            Dim str = String.Empty
            Dim i As Integer

            'dataSet.Tables.Clear()

            colTable.Columns.Add("Line", GetType(String))
            colTable.Columns.Add("Name", GetType(String))
            colTable.Columns.Add("Phase", GetType(String))
            colTable.Columns.Add("Commessa", GetType(String))
            colTable.Columns.Add("Article", GetType(String))
            For i = 6 To 16
                str = Format(i, "00") & "h"
                colTable.Columns.Add(str, GetType(Integer))
            Next
        End Sub

        Private Sub LoadInfoByName()

            Dim tKey As String = String.Empty
            Dim line As String = String.Empty
            Dim name As String = String.Empty
            Dim phase As String = String.Empty
            Dim comm As String = String.Empty
            Dim art As String = String.Empty
            Dim qty = 0
            Dim hour = 0


            LoadDataTable()

            Dim htbl As New Hashtable
            Dim index = 0

            LoadColumns()

            For Each row As DataRow In mainTable.Rows
                line = row(0).ToString()
                name = row(3).ToString()
                phase = row(7).ToString()
                comm = row(4).ToString()
                art = row(5).ToString()
                qty = CInt(row.Item(11)) * CInt(row.Item(6))
                hour = CInt(row.Item(10))

                If name = Inform(_leng).Name AndAlso (row(14)).ToString() = "1" Then
                    tKey = name & phase & comm & art 'line & 

                    If Not htbl.ContainsKey(tKey) Then
                        Dim newRow As DataRow = dataSet.Tables("HRPROD").NewRow

                        newRow.Item(0) = line
                        newRow.Item(1) = name
                        newRow.Item(2) = phase
                        newRow.Item(3) = comm
                        newRow.Item(4) = art
                        newRow.Item(hour - 1) = qty

                        dataSet.Tables("HRPROD").Rows.Add(newRow)

                        htbl.Add(tKey, index)
                        index = +1
                    Else
                        Dim secRow = CInt(htbl(tKey))
                        Dim tot As Integer

                        dataSet.Tables("HRPROD").Rows(secRow).Item(hour - 1) = tot + qty
                    End If
                End If
            Next

            dtV = New DataView(dataSet.Tables("HRPROD"))
            dgv1.DataSource = dtV
            dgv1.DataBind()
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
        End Sub

        Public Sub ShowDetailedStats_Click(sender As Object, e As EventArgs)

            GetPropertiesDetails(Inform(_leng).Masina.ToString())
            LoadInfoByName()
            ModalPanel.Visible = True
        End Sub

        Public Sub Buttons_Click(sender As Object, e As EventArgs)
            If _eff_b.Columns.Count <= 1 Then
                Efficiency_Procedure()
            End If

            If sender.Backcolor = Color.White Then
                Exit Sub
            End If

            For Each iPanel As Panel In _pnGroup
                Dim sdhg = From button In iPanel.Controls.OfType(Of Button) Where button.BorderWidth = 5 Select button

                If sdhg.Any() Then
                    sdhg.Single().BorderWidth = 1
                    Exit For
                End If
            Next
            sender.BorderWidth = 3
            GetPropertiesDetails(sender.TabIndex.ToString())

            lblName.Text = Inform(_leng).Name.ToString()
            lblCode.Text = Inform(_leng).Masina.ToString()
            lblArticole.Text = Inform(_leng).Articole.ToString()
            lblPhase.Text = Inform(_leng).Faza.ToString()
            lblTempo.Text = Inform(_leng).Time.ToString()
            lblQty.Text = Inform(_leng).Qty.ToString()
            lblNorm.Text = Inform(_leng).Norm.ToString()
            lblusrlinea.Text = " " & Inform(_leng).Linea.ToString()


            ModalPanel.Visible = True
        End Sub

        'GET
        Private Sub VeriftyFase()
            _dtVerifyLinea.Clear()
            Const q = "select Name, Line, IdSector from Organizator where active=1 and lavoro <> 'Capolinea' and idsector='1' And Line in ('LINEA1','LINEA2','LINEA3','LINEA4','LINEA5','LINEA6','LINEA7','LINEA8','LINEA9','LINEA10','LINEA11','LINEA12')"
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd = New SqlCommand(q, MyConnection)
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            _dtVerifyLinea.Load(dr)
            dr.Close()
            cmd.Dispose()
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        Public Sub Cancel_Click(sender As Object, e As EventArgs)
            Controls.Remove(ModalPanel)

            dgv1.Columns.Clear()
            dgv1.Controls.Clear()
            dgv1.Dispose()
            mainTable.Clear()
            dataSet.Clear()
            dataSet.Clear()


        End Sub
        Dim viewA1 As DataView = New DataView(_dtAssent)

        'Public Sub GetAssentGrid()
        '    _dtAssent.Clear()

        '    GetAssent(_dtAssent)
        '    '''lblTotAss.Text = CStr(viewA1.Count)
        '    viewA1.Sort = "INT"

        '    'Try
        '    '    'Ukoliko procedura za assenteismo nije lepo prikupila podatke
        '    '    if viewA1.Table.Rows(1)(3).ToString() = "True" Then GetAssentGrid()  
        '    '    If viewA1.Table.Rows.Count > 13 Then GetAssentGrid()
        '    'Catch ex As Exception
        '    '    Exit Try
        '    'End Try

        '    '''gidassent.DataSource = viewA1
        '    '''gidassent.DataBind()


        'End Sub

        'Public ReadWriteLock As New System.Threading.ReaderWriterLock()
        Shared ReadOnly _tblassent As New DataTable

        Dim assL1 As DataView
        Dim assL2 As DataView
        Dim assL3 As DataView
        Dim assL4 As DataView
        Dim assL5 As DataView
        Dim assL6 As DataView
        Dim assL7 As DataView
        Dim assL8 As DataView
        Dim assL9 As DataView
        Dim assL10 As DataView
        Dim assL11 As DataView
        Dim assL12 As DataView
        Private Sub GetOffline()
            _tblassent.Clear()
            ReadWriteLock.AcquireReaderLock(System.Threading.Timeout.Infinite)
            Try

                Const query As String = "Select Line,Name,Lavoro,Active,IdSector,ShortJob From Organizator Where IdSector='1' AND Active=0 AND Line in ('LINEA1','LINEA2','LINEA3','LINEA4','LINEA5','LINEA6','LINEA7','LINEA8','LINEA9','LINEA10','LINEA11','LINEA12')"

                If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()

                Dim cmd As New SqlDataAdapter(query, MyConnection)
                cmd.Fill(_tblassent)
                cmd.Dispose()

                If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

            Finally

                ReadWriteLock.ReleaseReaderLock() ' Release the read lock.

                assL1 = New DataView(_tblassent)
                assL1.RowFilter = "Line='LINEA1'"
                gv_l1.DataSource = assL1
                gv_l1.DataBind()
                wcline1.Text = "Assenti:" + assL1.Count.ToString()

                assL2 = New DataView(_tblassent)
                assL2.RowFilter = "Line='LINEA2'"
                gv_l2.DataSource = assL2
                gv_l2.DataBind()
                wcline2.Text = "Assenti:" + assL2.Count.ToString()


                assL3 = New DataView(_tblassent)
                assL3.RowFilter = "Line='LINEA3'"
                gv_l3.DataSource = assL3
                gv_l3.DataBind()
                wcline3.Text = "Assenti:" + assL3.Count.ToString()

                assL4 = New DataView(_tblassent)
                assL4.RowFilter = "Line='LINEA4'"
                gv_l4.DataSource = assL4
                gv_l4.DataBind()
                wcline4.Text = "Assenti:" + assL4.Count.ToString()

                assL5 = New DataView(_tblassent)
                assL5.RowFilter = "Line='LINEA5'"
                gv_l5.DataSource = assL5
                gv_l5.DataBind()
                wcline5.Text = "Assenti:" + assL5.Count.ToString()

                assL6 = New DataView(_tblassent)
                assL6.RowFilter = "Line='LINEA6'"
                gv_l6.DataSource = assL6
                gv_l6.DataBind()
                wcline6.Text = "Assenti:" + assL6.Count.ToString()

                '7-12

                assL7 = New DataView(_tblassent)
                assL7.RowFilter = "Line='LINEA7'"
                gv_l7.DataSource = assL7
                gv_l7.DataBind()
                wclinel7.Text = "Assenti:" + assL7.Count.ToString()

                assL8 = New DataView(_tblassent)
                assL8.RowFilter = "Line='LINEA8'"
                gv_l8.DataSource = assL8
                gv_l8.DataBind()
                wclinel8.Text = "Assenti:" + assL8.Count.ToString()


                assL9 = New DataView(_tblassent)
                assL9.RowFilter = "Line='LINEA9'"
                gv_l9.DataSource = assL9
                gv_l9.DataBind()
                wclinel9.Text = "Assenti:" + assL9.Count.ToString()

                assL10 = New DataView(_tblassent)
                assL10.RowFilter = "Line='LINEA10'"
                gv_l10.DataSource = assL10
                gv_l10.DataBind()
                wcline10.Text = "Assenti:" + assL10.Count.ToString()

                assL11 = New DataView(_tblassent)
                assL11.RowFilter = "Line='LINEA11'"
                gv_l11.DataSource = assL11
                gv_l11.DataBind()
                wclinel11.Text = "Assenti:" + assL11.Count.ToString()

                assL12 = New DataView(_tblassent)
                assL12.RowFilter = "Line='LINEA12'"
                gv_l12.DataSource = assL12
                gv_l12.DataBind()
                wclinel12.Text = "Assenti:" + assL12.Count.ToString()

                _tblassent.Dispose()
            End Try
        End Sub
        Protected Sub Assent_DataBound(sender As Object, e As GridViewRowEventArgs)
            e.Row.Cells(0).Visible = False
            e.Row.Cells(3).Visible = False
            e.Row.Cells(4).Visible = False
            e.Row.Cells(5).Visible = False
        End Sub
        Private Sub CreateColumns()
            MyDataSet.Reset()

            tmpTable = MyDataSet.Tables.Add("Pausa")
            With tmpTable.Columns
                .Add("Id", GetType(Integer))
                .Add("Worker", GetType(String))
                .Add("Pause type", GetType(String))
                .Add("Duration", GetType(String))
                .Add("StartPause", GetType(String))
                .Add("EndPause", GetType(String))
                .Add("Date", GetType(String))
                .Add("newDurat", GetType(Integer))
                .Add("Linea", GetType(String))
                .Add("numlinea", GetType(Integer))
            End With
        End Sub

        Private Sub LoadBreakTable()
            _tblPauza.Clear()
            Dim query As String = "SELECT tblPause.newID, tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Angajati.Angajat,Angajati.Linie,Angajati.IdSector FROM tblPause INNER Join Realizari ON tblPause.IdRealization = Realizari.Id inner join Angajati ON Realizari.IdAngajat = Angajati.Id WHERE Day(tblPause.StartTime) = '" & DateTime.Now.Day & "' AND Month(tblPause.StartTime) = '" & DateTime.Now.Month & "' AND Year(tblPause.StartTime) = '" & DateTime.Now.Year & "' AND IdSector='1' "

            MyConnection.Open()
            Dim myCommand As New SqlCommand(query, MyConnection)
            Dim myDataReader As SqlDataReader = myCommand.ExecuteReader()
            _tblPauza.Load(myDataReader)
            myDataReader.Close()
            MyConnection.Close()

            MyDataSet.Reset()
            CreateColumns()

            For Each row As DataRow In _tblPauza.Rows
                Dim id As Integer = CInt(row.Item(0))
                Dim tip As String = CStr(row.Item(1))
                Dim emp As String = CStr(row.Item(4))
                Dim line As String = CStr(row.Item(5))
                Dim duration As String = String.Empty
                Dim endP As String = String.Empty
                Dim drt As Double = 0           '//real duration

                Dim startTime As DateTime = CDate(row.Item(2))

                Dim endTime As DateTime
                If IsDBNull(row(3)) Then
                    duration = "In pausa..."
                    drt = 0
                Else
                    endTime = CDate(row.Item(3))

                    Dim ts As TimeSpan = endTime.Subtract(startTime)
                    drt = ts.Minutes
                    duration = Format(drt.ToString() & "min")
                    endP = Format(endTime, "HH:mm") ' .AddHours(2)
                End If

                Dim actDate As String = Format(startTime, "dd.MM.yyyy")
                Dim startP As String = Format(startTime, "HH:mm") '.AddHours(2)

                Dim newRow As DataRow = MyDataSet.Tables("Pausa").NewRow
                With newRow
                    .Item(0) = id           '//oreder by id
                    .Item(1) = emp          '//employee
                    .Item(2) = tip          '//pausa type
                    .Item(3) = duration     '//endTime - startime
                    .Item(4) = startP    '//pause startTime
                    .Item(5) = endP         '//pause endTime
                    .Item(6) = actDate      '//actuel date
                    .Item(7) = CInt(drt)    '//invisible column for total amount of pause
                    .Item(8) = line
                    .Item(9) = Int32.Parse(line.Remove(0, 5))

                End With

                MyDataSet.Tables("Pausa").Rows.Add(newRow)
            Next
        End Sub

        Structure Manichin
            'primary colleciton for computing
            Dim Time As String 'fase work time parameter
            Dim Qty As Single  'quantity
            Dim Norm As String 'quanity/hour
            Dim Masin As String 'masina
            Dim Eff As Single   'get eff in properties
            Dim Media As Single 'get middle value of production

            Dim Mroto As Single
            Dim Mbono As Single

            ''other info
            Dim Name As String
            Dim Comm As String
            Dim Fase As String  'DEFAULT AS MANICHINO
            Dim Art As String
        End Structure

        Public Sub ButtonsMan_Click(sender As Object, e As EventArgs)

            If _eff_b Is Nothing Then
                Efficiency_Procedure()
            End If

            _manichinoColleciton = {Man1, Man2, Man3, Man4, Man5, Man6, Man7, Man8, Man9, Man10, Man11, Man12}
            Dim sdhgg = From button In _manichinoColleciton Where button.BorderWidth = 5 Select button
            Dim buttons As IEnumerable(Of Button) = If(TryCast(sdhgg, Button()), sdhgg.ToArray())
            If buttons.Any() Then
                buttons.Single().BorderWidth = 1
            End If

            For Each iPanel As Panel In _pnGroup
                Dim sdhg = From button In iPanel.Controls.OfType(Of Button) Where button.BorderWidth = 5 Select button

                Dim enumerable As IEnumerable(Of Button) = If(TryCast(sdhg, Button()), sdhg.ToArray())
                If enumerable.Any() Then
                    enumerable.Single().BorderWidth = 1
                    Exit For
                End If
            Next

            sender.BorderWidth = 5
            GetManichinoInfo(sender.TabIndex.ToString())
            lblName.Text = Man.Name
            lblCode.Text = Man.Masin
            lblArticole.Text = Man.Art
            lblNorm.Text = Man.Norm
            lblQty.Text = "Rotto:" & " " & Man.Mroto & " " & "Buono:" & " " & Man.Mbono
            lblPhase.Text = Man.Fase
            lblTempo.Text = Man.Time
            ModalPanel.Visible = True
            '_checker = True

            '        If Page.IsPostBack = True OrElse Page.IsAsync=True then
            '             For each row As DataRow In _dtVerifyFase.Rows
            '                If lblName.Text.Equals(row.Item(0)) then
            '                    lblfasechecker.Text = "Default:" & " " & row.Item(1).ToString()
            '                End If
            '            Next
            '    end if
        End Sub

        Public Sub GetManichinoInfo(ByVal tagGrp As String) ', ByVal dt As DataTable)
            ''clear all info
            Man.Name = String.Empty
            Man.Comm = String.Empty
            Man.Fase = String.Empty

            'set zero by default
            Man.Time = String.Empty
            Man.Qty = 0
            Man.Norm = String.Empty

            Man.Eff = 0
            Man.Media = 0

            'create string parameters for gettin'values (DB)
            Dim sq As String
            Dim strQty As String = String.Empty
            Dim strNorm As String = String.Empty
            Dim mac As Integer
            Dim tmpGrp As String   'recognize group by tagging    
            Dim manactive As Boolean
            For Each row As DataRow In _eff_b.Rows
                tmpGrp = Convert.ToString(row.ItemArray(14))
                manactive = Convert.ToBoolean(row.ItemArray(16))

                If tmpGrp >= 301 And tmpGrp <= 312 Then
                    If tmpGrp = tagGrp Then
                        sq = row.Item(8).ToString()

                        If sq <> "0" Then
                            strQty = row.Item(8).ToString()
                        End If

                        strNorm = row.Item(7).ToString()
                        Man.Masin = row.Item(3).ToString()
                        Man.Name = CStr(row.Item(2))
                        Man.Comm = CStr(row.Item(4))
                        Man.Fase = CStr(row.Item(6))
                        Man.Art = CStr(row.Item(21))
                        mac = CInt(row.Item(3))

                        Dim startTime = CDate(row.Item(10))
                        Dim ts As TimeSpan = StartShift.TimeOfDay - startTime.TimeOfDay
                        If ts.Minutes > 30 Then
                            Dim tmpD As DateTime = startTime.Date
                            startTime = tmpD + StartShift.TimeOfDay
                        End If

                        Dim endTime As DateTime
                        If IsDBNull(row(13)) Then
                            If IsDBNull(row.Item(12)) Then
                                If (Now < (startTime.Date + EndShift.TimeOfDay)) Then
                                    endTime = Now
                                Else
                                    endTime = startTime.Date + EndShift.TimeOfDay
                                End If
                            Else
                                endTime = CDate(row(12))
                            End If
                        Else
                            endTime = CDate(row(13))
                        End If

                        Dim factor As Single = WorkersRunetime(startTime, endTime)
                        Dim q1 As Integer
                        Dim q2 As Integer

                        ''buono
                        If mac = 2960 OrElse mac = 2962 OrElse mac = 2964 OrElse
                           mac = 2966 OrElse mac = 2968 OrElse mac = 2970 OrElse
                           mac = 2972 OrElse mac = 2974 OrElse mac = 2976 OrElse
                           mac = 2978 OrElse mac = 2980 OrElse mac = 2982 Then
                            q1 = Integer.Parse(CStr(row.Item(8)))

                            ''roto
                        ElseIf mac = 2961 OrElse mac = 2963 OrElse mac = 2965 OrElse
                               mac = 2967 OrElse mac = 2969 OrElse mac = 2971 OrElse
                               mac = 2973 OrElse mac = 2975 OrElse mac = 2977 OrElse
                               mac = 2979 OrElse mac = 2981 OrElse mac = 2983 Then
                            q2 = Integer.Parse(CStr(row.Item(8)))
                        End If

                        Man.Qty = q1 + q2

                        Man.Mbono = q1
                        Man.Mroto = q2

                        Man.Norm = strNorm    'parse single value
                        Man.Media = CSng(Math.Round(Man.Qty / factor, 0))
                        Man.Time = CStr(factor)
                        Man.Eff = ((Man.Qty / (CSng(Man.Norm * Man.Time)) * 100))     ''efficiency
                    End If
                End If
            Next
        End Sub

        Private Sub ColorByManichino()

            _manichinoColleciton = {Man1, Man2, Man3, Man4, Man5, Man6, Man7, Man8, Man9, Man10, Man11, Man12}

            For Each mans As Button In _manichinoColleciton
                mans.BackColor = Color.White    'default color
                Man = New Manichin
                GetManichinoInfo(mans.TabIndex.ToString())
                mans.Attributes("title") = Man.Name

                'NewMethod(totEff, mac, efc, mans)
                'If Single.IsInfinity(Man.Eff) Then
                '    Man.Eff = 100
                'ElseIf Single.IsNaN(Man.Eff) Then
                '    Man.Eff = 0
                'End If
                'najveca moguca vrednost efikasnosti
                'If Man.Eff > 200 Then
                '    Man.Eff = 100
                'End If


                Man.Eff = CSng(Math.Round(Man.Eff, 0))      'racun bez decimala

                If Man.Eff = 0 Then
                    mans.BackColor = Color.White
                Else
                    If (Man.Eff > 0 AndAlso Man.Eff <= 69.5) Then
                        mans.BorderColor = Color.DarkRed
                        mans.BackColor = Color.Crimson
                        mans.ForeColor = Color.White
                    ElseIf (Man.Eff > 69.5 AndAlso Man.Eff <= 89.5) Then
                        mans.BorderColor = Color.YellowGreen
                        mans.BackColor = Color.Yellow
                        mans.ForeColor = Color.FromArgb(64, 64, 64)
                    ElseIf (Man.Eff > 89.5) Then
                        mans.BorderColor = Color.Green
                        mans.BackColor = Color.LimeGreen
                        mans.ForeColor = Color.White
                    End If

                    If Man.Eff > 0 Then
                        mans.Text = Man.Eff.ToString() & "%"
                    Else
                        mans.Text = String.Empty
                    End If

                    If Man.Eff < 20 Then
                        mans.Text = ""
                        mans.BackColor = Color.White
                        mans.BorderColor = Color.DodgerBlue
                    End If

                End If
            Next

            'If _modEff = 3 Then ' BTN CAPI
            '    For Each mans As Button In _manichinoColleciton
            '        GetManichinoInfo(mans.TabIndex.ToString()) 
            '        'GET CAPI FOR MANICHINO Each butt
            '        mans.Text = Man.Qty.ToString()
            '    Next

            '    Dim btn1IntCapi As Single
            '    Dim btn2IntCapi As Single
            '    Dim btn3IntCapi As Single
            '    btn1IntCapi = cap1 + cap2 + cap3
            '    btn2IntCapi = cap4 + cap5 + cap6
            '    btn3IntCapi = cap7 + cap8 + cap9

            '    lblMan1.Text = "MANICHINO L1" & " " & "Σ=" & btn1IntCapi
            '    lblMan2.Text = "MANICHINO L2" & " " & "Σ=" & btn2IntCapi
            '    lblMan3.Text = "MANICHINO L3" & " " & "Σ=" & btn3IntCapi

            'End If
        End Sub

    End Class
End Namespace