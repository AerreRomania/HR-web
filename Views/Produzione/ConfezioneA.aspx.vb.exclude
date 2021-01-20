Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing

Namespace Views.Produzione

    Partial Class ConfezioneA
        Inherits System.Web.UI.Page
        Dim _eff_a As New DataTable
        Dim _dtStart, _dtStop As DateTime
        Public CtX As Integer = 1

        Const StrConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
        Public MyConnection As New SqlConnection(StrConnection)
        Public MyDataSet As New DataSet

        Public Shared StartShift As DateTime
        Public Shared EndShift As DateTime

        Dim _pnGroup As Panel()
        Dim _pnTitGroup As Panel()

        Structure WorkerDetails
            Dim Name As String
            Dim Linea As String
            Dim Efficiency As Integer
            Dim Commesse As String
            Dim Masina As String
            Dim Article As String
            Dim Faza As String
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
        End Structure

        Public Shared Inform() As WorkerDetails
        Dim datatable1 As New DataTable
        Dim tblPerson As New DataTable
        Dim dt As New DataTable
        Structure Liber
            Dim StartPauza As Date
            Dim EndPauza As Date
        End Structure

        Shared _arrPauze() As Liber

        Shared modEff As Integer
        Dim dtActivity As New DataTable()

        Dim _dt_Start As Date
        Dim hr(24) As Boolean
        Dim dataSet As New DataSet
        Dim dtV As DataView
        ReadOnly mainTable As New DataTable
        Dim _mainName As String
        Private Property Obj As Object
        Dim bordz As Graphics
        Shared ReadOnly _dtOrganizator As New DataTable
        'ReadOnly _dtAssent As New DataTable

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

        Dim WithEvents btn_confa As ImageButton
        Dim WithEvents btn_confb As ImageButton
        Dim WithEvents btn_stiro As ImageButton

        Dim WithEvents confa_visible As Label
        Dim WithEvents confb_visible As Label
        Dim WithEvents stiro_visible As Label

        Dim lbl_total_eff_text_confA As Label
        Dim lbl_total_eff_value_confA As Label
        Dim lbl_total_ass_text_confA As Label
        Dim lbl_total_ass_value_confA As Label
        Dim lbl_ultimo_agiornato_text As Label

        Dim pnlll As Panel

        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

            'If Not Me.Page.User.Identity.IsAuthenticated Then
            '    FormsAuthentication.RedirectToLoginPage()
            'End If

            Response.BufferOutput = True
            Response.Buffer = True
            refreshtext.Text = ""

            CType(Master.FindControl("pnl_sort_by_phase"), Panel).Controls.Add(pnl_sort_by_phase_confa)
            CType(Master.FindControl("pnl_sort_by_line"), Panel).Controls.Add(pnl_sort_by_line_confa)

            btn_get_efficiency = CType(Master.FindControl("cmdDownload"), ImageButton)
            btn_get_cappi = CType(Master.FindControl("capiDownload"), ImageButton)
            btn_get_assenteismo = CType(Master.FindControl("ppptDownload"), ImageButton)
            btn_get_machines = CType(Master.FindControl("testdugme"), ImageButton)

            btn_report = CType(Master.FindControl("btn_report"), ImageButton)
            btn_org = CType(Master.FindControl("btn_org"), ImageButton)
            btn_pause = CType(Master.FindControl("btn_pause"), ImageButton)
            'btn_print = CType(Master.FindControl("btn_print"),ImageButton)
            'btn_pdf = CType(Master.FindControl("btn_pdf"),ImageButton)

            'FILTER BUTTONS
            btn_crveno = CType(Master.FindControl("crveno"), Button)
            btn_zuto = CType(Master.FindControl("zuto"), Button)
            btn_zeleno = CType(Master.FindControl("zeleno"), Button)
            btn_default = CType(Master.FindControl("btndefault"), Button)
            btn_assenteismo = CType(Master.FindControl("filterassenteismo"), ImageButton)

            lbl_total_eff_text_confA = CType(Master.FindControl("lbl_total_eff_text"), Label)
            lbl_total_eff_value_confA = CType(Master.FindControl("lbl_total_eff_value"), Label)

            lbl_total_ass_text_confA = CType(Master.FindControl("lbl_total_ass_text"), Label)
            lbl_total_ass_value_confA = CType(Master.FindControl("lbl_total_ass_value"), Label)

            lbl_ultimo_agiornato_text = CType(Master.FindControl("lbl_ultimo_agiornato"), Label)

            _pnGroup = New Panel() {contLine13, contLine14, contLine15, contLine16, contLine17, contLine18}

            StartTimeEndTimePauses()
            'TopLeftTimer()

            Controls.Remove(ModalPanel)
            ModalPanel.Visible = False

            btn_crveno.BackColor = Color.Crimson
            btn_zuto.BackColor = Color.Yellow
            btn_zeleno.BackColor = Color.FromArgb(42, 171, 42)

            _dtAssent.Clear()

            If (Page.IsPostBack = False) Then
                GetMachines(MyConnection)
                BtnDownload_click(sender, e)
            End If

            lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")

            modalintervali.Visible = False

            ScriptManager.RegisterStartupScript(upd_confa, upd_confa.GetType(), "a_key", "<script type='text/javascript' src='./js/confa-js.js'></script>", False)
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)

        End Sub


        Protected Sub Timer_db_update_Tick(sender As Object, e As EventArgs)
            _dtAssent.Clear()

            lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")

            BtnDownload_click(Nothing, Nothing)

            If modEff = 2 Then
                BtnDownload_pppt_click(Nothing, Nothing)
            ElseIf modEff = 3 Then
                BtnDownload_capi_click(Nothing, Nothing)
            End If

            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
            ScriptManager.RegisterStartupScript(upd_confa, upd_confa.GetType(), "a_key", "<script type='text/javascript' src='./js/confa-js.js'></script>", False)

        End Sub

        Protected Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error

            Dim ex = Server.GetLastError

            If ex.Message.Contains("Specific string from controls' error") Then
                Server.ClearError()
                Response.Redirect("loknitting.olimpias.it/ConfezioneA.aspx")
            End If
            Response.Redirect("loknitting.olimpias.it/ConfezioneB.aspx")

        End Sub


        'Public ReadWriteLock As New System.Threading.ReaderWriterLock()
        Sub ReadData()
            ' This procedure reads information from some source.
            ' The read lock prevents data from being written until the thread 
            ' is done reading, while allowing other threads to call ReadData.
            ReadWriteLock.AcquireReaderLock(System.Threading.Timeout.Infinite)
            Try
                ' Perform read operation here.
                refreshtext.Text = "Adding buttons handlers - Started"
                AddButtonsHandlers()
                refreshtext.Text = "Adding buttons handlers - Done"

                refreshtext.Text = "Getting Persons - Started"
                GetOffline()
                GetPPandPT()
                refreshtext.Text = "Getting Persons - Done"

                refreshtext.Text = "Efficiency Stored Procedure - Started"
                Efficiency_Procedure()
                refreshtext.Text = "Efficiency Stored Procedure - Done"


                refreshtext.Text = "Verify persons by phase - Started"
                FaseVerify()
                refreshtext.Text = "Verify persons by phase - Done"

                refreshtext.Text = ""
            Finally
                ReadWriteLock.ReleaseReaderLock() ' Release the read lock.
            End Try
        End Sub

        ReadOnly _dtBreak As New DataTable

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
            'tbl_machines.Clear()

            'continue after another operation when it's done
            'If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()

            'Dim q As String = "SELECT tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Masini.CodMasina "
            'q += "FROM tblPause INNER JOIN Realizari ON tblPause.IdRealization = Realizari.Id "
            'q += "INNER JOIN Masini ON Realizari.IdMasina = Masini.Id WHERE "
            'q += "tblPause.StartTime > CAST(CURRENT_TIMESTAMP As Date)"

            'Dim adap As New SqlDataAdapter(q, MyConnection)
            'adap.Fill(tbl_machines)
            'adap.Dispose()
            'If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

            For Each o As Object In p.Controls
                Dim lbl As Button = TryCast(o, Button)

                If lbl IsNot Nothing Then
                    'Dim hb As New HatchBrush(HatchStyle.DarkVertical, Color.Gray, Color.DimGray)
                    For Each row As DataRow In tbl_machines.Rows
                        Dim breakType As String = row.ItemArray(0).ToString()
                        If Not breakType = "WC" Then Continue For
                        Dim breakCode As String = row.ItemArray(3).ToString()
                        If breakCode = lbl.TabIndex.ToString() AndAlso IsDBNull(row.ItemArray(2)) Then
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

        Public Sub ShowAssents()
            Dim li As New List(Of Object)
            For Each obj As Object In contLine13.Controls
                Dim btn = TryCast(obj, Button)
                If btn IsNot Nothing Then
                    GetPropertiesDetails(btn.TabIndex.ToString())
                End If
                li.Add(btn)
            Next
        End Sub


        Public Sub btn_org_click(sender As Object, e As EventArgs) Handles btn_org.Click
            Page.Response.Redirect("./Report_Light.aspx")
        End Sub

        Public Sub btn_pause_click(sender As Object, e As EventArgs) Handles btn_pause.Click
            Page.Response.Redirect("./Pauses.aspx")
        End Sub

        Public Sub Buttons_Hover(ByVal dt1 As DataTable, ByVal dt2 As DataTable)

            If dt1 Is Nothing OrElse dt2 Is Nothing Then
                If _dtVerifyLinea Is Nothing Then
                    FaseVerify()
                End If

                Buttons_Hover(_dtVerifyLinea, _eff_a)
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

            _dtVerifyLinea.Dispose()
        End Sub

        Public Sub Test()
            For Each p As Panel In _pnGroup
                For Each obj As Object In p.Controls
                    Dim btn = TryCast(obj, Button)
                    If btn IsNot Nothing Then
                        GetPropertiesDetails(btn.TabIndex.ToString())
                    End If
                Next
            Next

        End Sub

        Public Sub TopLeftTimer()
            Dim sat As Integer = DateTime.Now.Hour
            Dim diorefatte As String = DateTime.Now.AddHours(-7).ToString("hh:mm:ss")
            Dim diorefatte1 As String = DateTime.Now.AddHours(-15).ToString("hh:mm:ss")

            If sat < 15 Then
                'lblTime1.Text = "Numero di ore fatte: " & diorefatte
            End If

            If sat > 15 Then
                'lblTime1.Text = "Numero di ore fatte: " & diorefatte1
            End If
        End Sub

        Public Sub btndefault_Click() Handles btn_default.Click
            Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
        End Sub

        Public Sub CmdChart_click(sender As Object, e As EventArgs)
        End Sub

        Public Sub BtnExport_Click(sender As Object, e As EventArgs)
        End Sub

        Protected Sub BtnInvoke_Click(ByVal sender As Object, ByVal e As EventArgs)
            'lblText.Text = "Processing completed"
        End Sub

        Public Sub BtnDownload_click(sender As Object, e As EventArgs) Handles btn_get_efficiency.Click
            modEff = 1
            ReadData()

            ColorByEfficiency()

            GetBreakTable(MyConnection)
            For Each p As Panel In _pnGroup
                DrawBreakRectangles(p)
            Next

            'ShowAssents()
            'pnlassentlist.Visible = True

            lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")
        End Sub

        Public Sub BtnDownload_pppt_click(sender As Object, e As EventArgs) Handles btn_get_assenteismo.Click
            modEff = 2
            'GetPPandPT()
            ColorByEfficiency()
            'GetMembersOffline()
            'GetAssentGrid()
            'pnlassentlist.Visible = True

            'Dim casted_Btn As Button = TryCast(sender, Button)
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
                            btn.BorderColor = Color.Silver
                        End If
                    End If
                Next
            Next
        End Sub

        Dim cappitot As Integer = 0

        Public Sub BtnDownload_capi_click(sender As Object, e As EventArgs) Handles btn_get_cappi.Click
            'capiDownload.Click
            modEff = 3
            If _eff_a Is Nothing Then
                Efficiency_Procedure()
            End If

            'pnlassentlist.Visible = False

            Dim str As String = String.Empty
            For Each pan As Panel In _pnGroup
                cappitot = 0

                For Each butt As Button In pan.Controls.OfType(Of Button)
                    butt.Text = String.Empty

                    Dim results = From myRow In _eff_a.Rows Where myRow(3) = butt.TabIndex Select myRow

                    For Each row In results
                        If IsDBNull(row(12)) Then
                            butt.Text = (CSng(row.Item(8)) * CInt(row.Item(9))).ToString()
                            cappitot += Convert.ToInt32(butt.Text)

                        End If
                    Next
                Next

                'For Each pnPan As Panel In pan.Controls.OfType(Of Panel)
                '    For Each lbl As Label In pnPan.Controls.OfType(Of Label)
                '        lbl.Text = lbl.Text & " " & "Σ=" & cappitot.ToString()
                '    Next
                'Next
            Next
        End Sub

        Dim _ds As New DataSet()

        Public Sub Efficiency_Procedure()
            _eff_a.Clear()
            Dim dtStart As String

            dtStart = FormatDateTime(DateTime.Today)

            Dim cmd As New SqlCommand("spEfficiencyConfA", MyConnection)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@startTime", SqlDbType.DateTime).Value = dtStart
            cmd.Parameters.Add("@stopTime", SqlDbType.DateTime).Value = dtStart


            If MyConnection.State = ConnectionState.Closed Then
                MyConnection.Open()
            End If

            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

            _eff_a.Load(dr)

            dr.Close()

            cmd.Dispose()

            If MyConnection.State = ConnectionState.Open Then
                MyConnection.Close()
            End If
        End Sub

        Private Function GetEficiencyDetails(ByVal masina As String) As Single
            Dim efficiency As Single
            Dim temp As String  'machine
            Dim isActive As Boolean = False 'act activation
            Dim tempOra As String = ""
            Dim tempCantitate As String = ""
            Dim tempBucati As String = ""
            Dim temp1 As String

            Dim workTime As Single

            If _eff_a Is Nothing Then
                Efficiency_Procedure()
            End If

            For Each row As DataRow In _eff_a.Rows
                temp = row.Item(3).ToString()

                If temp = masina Then
                    temp1 = row.Item(8).ToString()
                    tempOra = row.Item(7).ToString()
                    tempBucati = row.Item(9).ToString()

                    isActive = CBool(row.Item(16))

                    If temp1 <> "0" Then
                        tempCantitate = row.Item(8).ToString()
                    End If

                    Dim startTime As DateTime = CDate(row.Item(10))
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

                If tempOra <> "" OrElse tempOra <> Nothing Then
                    norm = Single.Parse(tempOra)
                End If

                If tempCantitate <> "" OrElse tempCantitate <> Nothing Then
                    cantitate = Single.Parse(tempCantitate)
                End If

                If tempBucati <> "" OrElse tempBucati <> Nothing Then
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

        Public Shared Function WorkersRunetime(ByVal startInterval As DateTime, ByVal endInterval As DateTime) As Single
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

        Shared _leng As Integer
        Public Sub GetPropertiesDetails(idMasina As String)
            'testgrid.DataSource = _eff
            'testgrid.DataBind()

            If IsNothing(Inform) Then
                _leng = 0
            Else
                _leng = Inform.Length
            End If

            ReDim Preserve Inform(_leng)

            If _eff_a.Columns.Count <= 1 Then
                Efficiency_Procedure()
            End If

            With Inform(_leng)
                .Commesse = String.Empty
                .Faza = String.Empty
                .Masina = String.Empty
                .Name = String.Empty
                .Article = String.Empty
                .Linea = String.Empty
                .Efficiency = 0

                Dim temp As String

                For Each row As DataRow In _eff_a.Rows
                    temp = row.Item(3).ToString()
                    If temp = idMasina Then
                        ' .efficenzapersona = CSng(Math.Round(efc, 0))

                        .Masina = temp.ToString()
                        .Linea = row.Item(18).ToString()
                        .Name = row.Item(2).ToString()
                        .Article = row.Item(21).ToString()
                        .Faza = row.Item(6).ToString()
                        .Norm = CSng(row.Item(7))
                        .Qty = CSng(row.Item(8)) * CInt(row.Item(9))
                        .ComQty = CInt(row.Item(15))
                        .ValClick = CSng(row.Item(9))
                        .SingleQty = CSng(row.Item(8))
                        '.Efficiency = CSng(.Qty / (.Norm * factor) * 100)

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

        ReadOnly _dtVerifyLinea As New DataTable

        Private Sub VeriftyFase()
            _dtVerifyLinea.Clear()
            Const q = "select Name, Line, IdSector from Organizator where active='true' and lavoro <> 'Capolinea' and idsector='1' And Line in ('LINEA13','LINEA14','LINEA15','LINEA16','LINEA17')"
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd = New SqlCommand(q, MyConnection)
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            _dtVerifyLinea.Load(dr)
            dr.Close()
            cmd.Dispose()
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        Public Sub FaseVerify()
            VeriftyFase()
            Buttons_Hover(_dtVerifyLinea, _eff_a)
        End Sub

        Private Sub ColorByEfficiency()
            Dim totEff As Single
            Dim mac As Integer = 0
            Dim newMac As Integer = 0
            Dim newSim As New Button
            Dim efc As Single = 0

            'GetOffline()

            SummTotalEffByLine(contLine13, LINEA13, lbltitle1, lblLine1, lblshort1, newSim, newMac, efc)
            SummTotalEffByLine(contLine14, LINEA14, lbltitle2, lblLine2, lblshort2, newSim, newMac, efc)
            SummTotalEffByLine(contLine15, LINEA15, lbltitle3, lblLine3, lblshort3, newSim, newMac, efc)
            SummTotalEffByLine(contLine16, LINEA16, lbltitle4, lblLine4, lblshort4, newSim, newMac, efc)
            SummTotalEffByLine(contLine17, LINEA17, lbltitle5, lblLine5, lblshort5, newSim, newMac, efc)
            SummTotalEffByLine(contLine18, LINEA18, lbltitle6, lblLine6, lblshort6, newSim, newMac, efc)

            For Each iPanel As Panel In _pnGroup
                For Each o As Object In iPanel.Controls
                    Dim simulator As Button = TryCast(o, Button)

                    If simulator IsNot Nothing Then
                        NewMethod(totEff, mac, efc, simulator)
                    End If
                    'li.Add(efc)
                Next
            Next

            'Odsutne(assL13, contLine13)
            'Odsutne(assL14, contLine14)
            'Odsutne(assL15, contLine15)
            'Odsutne(assL16, contLine16)
            'Odsutne(assL17, contLine17)
            'Odsutne(assL18, contLine18)
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

            odsutne.Distinct()

            For index = 0 To listaOdsutnih.Count
                Dim idx As Integer = rand.Next(0, emptyButtons.Count - 1)

                odsutne.Distinct()

                Dim btn As New Button
                btn = panel.Controls.OfType(Of Button).ToList(emptyButtons(idx))

                If index = 4 Then
                    btn = panel.Controls.OfType(Of Button).ToList(emptyButtons(index + 1))
                End If

                If index < odsutne.Count Then
                    btn.Text = odsutne.ToList(index)
                    btn.ForeColor = Color.Red
                End If
            Next
        End Sub

        Private lblPresentEff As Label
        Private pnTit As Panel
        Private sender As Object

        Public Sub GetPPandPT()
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

        Public Sub GetAssent(dtass As DataTable)
            dtass.Clear()

            Dim cmd As New SqlCommand("AssenteismoOrganizator", MyConnection)

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@Sector", SqlDbType.Int).Value = 1
            cmd.Parameters.Add("@Active", SqlDbType.Bit).Value = 0
            cmd.Parameters.Add("@bool", SqlDbType.Bit).Value = 0

            If MyConnection.State = ConnectionState.Closed Then
                MyConnection.Open()
            End If

            Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)
            dtass.Load(dr)

            dr.Close()
            cmd.Dispose()

            If MyConnection.State = ConnectionState.Open Then
                MyConnection.Close()
            End If

        End Sub

        Dim datatableActive As New DataTable

        Private Sub NewMethod(ByRef totEff As Single, ByRef mac As Integer, ByRef efc As Single, ByRef simulator As Button)
            With simulator
                If .TabIndex > 0 Then
                    efc = GetEficiencyDetails(simulator.TabIndex.ToString())
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
                    End If
                    totEff = totEff + efc
                    SummTotalEfficiency(totEff, mac, lblTotEfficiency)
                Else
                End If
            End With

        End Sub
        Private Sub ColorizeSystem(r1 As Integer, r2 As Integer, r3 As Integer, y1 As Integer, y2 As Integer, y3 As Integer, g1 As Integer, g2 As Integer, g3 As Integer, ByRef btn As Button, ByRef int As Integer, ByRef efc As Single)

            Dim rColor As Color = Color.FromArgb(r1, r2, r3)
            Dim yColor As Color = Color.FromArgb(y1, y2, y3)
            Dim gColor As Color = Color.FromArgb(g1, g2, g3)
            With btn
                If (efc <= 0) Then
                    .BackColor = Color.White
                    .Text = String.Empty
                    .Font.Size = 9
                    .BorderColor = Color.Silver
                    .BorderStyle = BorderStyle.Solid
                Else
                    .BorderStyle = BorderStyle.Solid
                    If (efc >= 0 AndAlso efc <= 69.5) Then
                        int = int + 1
                        .Font.Size = 9
                        .BackColor = rColor
                        .BorderColor = Color.FromArgb(255, 210, 15, 52)
                        .ForeColor = Color.White
                    ElseIf (efc > 69.5 AndAlso efc <= 89.5) Then
                        int = int + 1
                        .Font.Size = 9
                        .BackColor = yColor
                        .BorderColor = Color.Gold
                    ElseIf (efc > 89.5) Then
                        int = int + 1
                        .Font.Size = 9
                        .BackColor = gColor
                        .BorderColor = Color.Green
                        .ForeColor = Color.White
                    End If
                End If
            End With

        End Sub
        Private Sub SummTotalEfficiency(sngEff As Single, machines As Integer, lbl As Label)
            Dim totalEfficiency As Single = 0
            Dim pinactivee As Single = 0
            Dim strBuild As New StringBuilder
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

            Page.Title = "Confezione A = " + lbl_total_eff_value_confA.Text
        End Sub

        Dim pInactiv As String

        Private Sub SummTotalEffByLine(p As Panel, pnTit As Panel, lbltitle As Label, lblPresentEff As Label, lblshortstat As Label, btn As Button, n As Integer, efc As Single)
            Dim e As Single
            Dim totEff As Single = 0
            Dim pp As String
            Dim pt As String
            Dim ass As Single
            Dim ppp As String

            For Each obj As Object In p.Controls
                btn = TryCast(obj, Button)
                If btn IsNot Nothing Then
                    If btn.TabIndex > 0 Then

                        efc = GetEficiencyDetails(btn.TabIndex.ToString())
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

                pInactiv = String.Empty
                pp = String.Empty
                ppp = String.Empty
                pt = String.Empty
                ass = 0

                Dim pInactivEff As Single

                Dim pInactiveView As DataView = New DataView(_tblassent)
                pInactiveView.RowFilter = "Line='" & pnTit.ID.ToString & "'"
                pInactiv = pInactiveView.Count.ToString()
                pInactiveView.Dispose()

                'eff reparto for each line
                pInactivEff = e / (n + CSng(pInactiv))
                pInactivEff = CSng(Math.Round(pInactivEff, 0))

                pp = _dtOrganizator.Select("Line='" & pnTit.ID.ToString & "'").Count.ToString()
                pt = _dtOrganizator.Select("Line='" & pnTit.ID.ToString & "'").Count.ToString()
                ass = CSng(pt) - CSng(pp)
                _dtOrganizator.Dispose()

                If modEff = 1 Then ' BTN EFF
                    lbltitle.Text = pnTit.ID.ToString()
                    lblPresentEff.Text = totEff.ToString() & "%" & "/" & pInactivEff.ToString() & "% "
                    lblshortstat.Text = n.ToString() & "/" & pInactiv
                End If

                If modEff = 2 Then
                    lblPresentEff.Text = pnTit.ID.ToString() & " " & totEff.ToString() & "%" & " PT: " & pt & " / PP: " & pp & " / AS: " & ass
                End If

                If modEff = 3 Then ' BTN CAPI
                    lblPresentEff.Text = pnTit.ID.ToString() & " "
                End If

                If Double.IsInfinity(totEff) Then
                    totEff = 100
                End If
                If Double.IsNaN(totEff) Then
                    totEff = 0
                End If
            Next
            'PROVERITI
            'lbleffass.text = e / (n + pInactiv)
            ' lbleffass.Text = CSng(Math.Round(CSng(lbleffass.text), 0))

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
                pnTit.CssClass = "silver-title"
                lblPresentEff.ForeColor = Color.Black
            End If
        End Sub

        Public Sub SummTotalCAPIByLine(lblPresentEff As Label)
            Dim totEff As Single = 0
            Dim str As String = ""
            For Each pan As Panel In _pnGroup
                For Each butt As Button In pan.Controls.OfType(Of Button)
                    butt.Text = ""
                    Dim results = From myRow In _eff_a.Rows Where myRow(3) = butt.TabIndex Select myRow
                    For Each row In results
                        If IsDBNull(row(12)) Then
                            butt.Text = (CSng(row.Item(8)) * CInt(row.Item(9))).ToString()
                        End If
                    Next
                    lblPresentEff.Text = results.ToString()
                Next
            Next
        End Sub

        Private Shared Sub ColorTotalEffLabel(ByVal value As Single, lbl As Label)
            With lbl
                If value > 0 AndAlso value < 69.5 Then
                    .ForeColor = Color.Crimson
                ElseIf (value > 69.5 AndAlso value <= 89.5) Then
                    .ForeColor = Color.Gold
                ElseIf (value > 89.5) Then
                    .ForeColor = Color.LimeGreen
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

            Dim casted_Btn As Button = TryCast(sender, Button)
            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn As Button = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "1" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.Silver
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterRimagli(sender As Object, e As EventArgs) Handles rimagli.Click
            modEff = 1
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn As Button = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "2" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.Silver
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterOV(sender As Object, e As EventArgs) Handles ov.Click
            modEff = 1
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn As Button = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "3" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.Silver
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterTraveta(sender As Object, e As EventArgs) Handles traveta.Click
            modEff = 1
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn As Button = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "4" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.Silver
                        End If
                    End If
                Next
            Next

        End Sub

        Private Sub FilterRifinitura(sender As Object, e As EventArgs) Handles rifinitura.Click
            modEff = 1
            ColorByEfficiency()

            For Each _P As Panel In _pnGroup
                For Each _obj As Object In _P.Controls
                    Dim btn As Button = TryCast(_obj, Button)
                    If btn IsNot Nothing Then
                        If btn.AccessKey = "5" Then
                            btn.BorderWidth = 2
                        Else
                            btn.BorderWidth = 1
                            btn.BackColor = Color.White
                            btn.Text = ""
                            btn.BorderColor = Color.Silver
                        End If
                    End If
                Next
            Next
        End Sub

        Private Sub FilterBtnByColors(sender As Object, e As EventArgs) Handles btn_crveno.Click, btn_zuto.Click, btn_zeleno.Click
            modEff = 1

            ColorByEfficiency()

            Dim castedBtn = TryCast(sender, Button)

            For Each p As Panel In _pnGroup
                For Each obj As Object In p.Controls
                    Dim btn = TryCast(obj, Button)

                    If btn IsNot Nothing Then
                        If castedBtn.BackColor <> btn.BackColor Then
                            btn.BackColor = Color.White
                            btn.BorderColor = Color.Silver
                            btn.Text = ""
                        Else
                            btn.BackColor = castedBtn.BackColor
                            btn.BorderColor = castedBtn.BackColor
                        End If
                    End If
                Next
            Next

        End Sub

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


        Dim offlineDT As New DataTable
        Public ReadWriteLock As New System.Threading.ReaderWriterLock()
        Shared ReadOnly _tblassent As New DataTable


        'Dim assL18 As DataView = New DataView(_tblassent)


        Private Sub GetOffline()
            _tblassent.Clear()
            ReadWriteLock.AcquireReaderLock(System.Threading.Timeout.Infinite)
            Try

                Const query As String = "Select Line,Name,Lavoro,Active,IdSector From Organizator Where IdSector='1' AND Active='False' AND Line in ('LINEA13','LINEA14','LINEA15','LINEA16','LINEA17')"

                If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()

                Dim cmd As New SqlDataAdapter(query, MyConnection)
                cmd.Fill(_tblassent)
                cmd.Dispose()

                If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

            Finally
                ReadWriteLock.ReleaseReaderLock() ' Release the read lock.

                assL13.RowFilter = "Line='LINEA13'"
                gv_l13.DataSource = assL13
                gv_l13.DataBind()
                wcline13.Text = "Assenti:" + assL13.Count.ToString()

                'For Each btn As Button In contLine13.Controls.OfType(Of Button)
                '    If btn.BackColor <> Color.White
                '        btn.Text += assL13.Item(0).ToString()
                '    End If
                'Next

                assL14.RowFilter = "Line='LINEA14'"
                gv_l14.DataSource = assL14
                gv_l14.DataBind()
                wcline14.Text = "Assenti:" + assL14.Count.ToString()


                assL15.RowFilter = "Line='LINEA15'"
                gv_l15.DataSource = assL15
                gv_l15.DataBind()
                wcline15.Text = "Assenti:" + assL15.Count.ToString()


                assL16.RowFilter = "Line='LINEA16'"
                gv_l16.DataSource = assL16
                gv_l16.DataBind()
                wcline16.Text = "Assenti:" + assL16.Count.ToString()

                assL17.RowFilter = "Line='LINEA17'"
                gv_l17.DataSource = assL17
                gv_l17.DataBind()
                wcline17.Text = "Assenti:" + assL17.Count.ToString()

                _tblassent.Dispose()
            End Try
        End Sub

        Dim assL13 As DataView = New DataView(_tblassent)
        Dim assL14 As DataView = New DataView(_tblassent)
        Dim assL15 As DataView = New DataView(_tblassent)
        Dim assL16 As DataView = New DataView(_tblassent)
        Dim assL17 As DataView = New DataView(_tblassent)

        Protected Sub Assent_DataBound(sender As Object, e As GridViewRowEventArgs)
            e.Row.Cells(0).Visible = False
            e.Row.Cells(3).Visible = False
            e.Row.Cells(4).Visible = False
        End Sub


        Public Sub GetMembersOffline()
            For Each pan As Panel In _pnGroup
                For Each buttons As Button In pan.Controls.OfType(Of Button)
                    If Not buttons.Text.Contains("%") Then
                        buttons.Text = String.Empty
                    End If
                Next
            Next

            For Each pan As Panel In _pnGroup
                Dim rnd_1 As Integer = 2
                Dim rnd_2 As Integer = 1


                Dim rows As DataRow() = _tblassent.Select("Line ='LINEA" & pan.ID.Remove(0, 8) & "'")
                For Each row As DataRow In rows
                    If row(2).ToString() = "1" Then

                        Dim butt As New Button With {
                                .Text = "kkk"
                                }

                        Try
                            While butt.BackColor <> Color.White
                                Dim control_id As String = "btn" + (rnd_1 + 20 * (Integer.Parse(pan.ID.Remove(0, 8)) - 13)).ToString()
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
                                Dim control_id As String = "btn" + (rnd_2 + 20 * (Integer.Parse(pan.ID.Remove(0, 8)) - 13)).ToString()
                                butt = DirectCast(FindControl(control_id), Button)
                                rnd_2 += 1
                                If rnd_2 = 2 Then
                                    rnd_2 = 6
                                ElseIf rnd_2 = 10 Then
                                    rnd_2 = 15
                                End If
                            End While

                            butt.Text = row(0).ToString()

                            butt.BorderStyle = BorderStyle.Solid
                            butt.BorderColor = Color.Red
                            butt.BackColor = Color.White
                            butt.BorderWidth = 2
                            butt.Font.Size = 7
                            butt.Dispose()

                        Catch ex As Exception

                        End Try


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

        Public Sub LinkLogOut_Click(sender As Object, e As EventArgs)
            'LogOffUser(lblUsername.Text)
            Session("user") = Nothing
            Session.Clear()
            Session.Abandon()
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
            Response.Redirect("LogInInformator.aspx")
        End Sub

        Private Sub LogOffUser(ByVal user As String)
            Dim query As String = "Update user_Account Set is_webonline='False' WHERE E_mail='" & user & "'"

            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd As New SqlCommand(query, MyConnection)
            cmd.ExecuteNonQuery()
            cmd.Dispose()
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        Public Function GetRandom(ByVal Min As Integer, ByVal Max As Integer) As Integer
            Static Generator As System.Random = New System.Random()
            Return Generator.Next(Min, Max)
        End Function

        Public Sub LoadDataTable(ByVal dt As DataTable)

            dt.Clear()
            _dt_Start = CDate(FormatDateTime(Date.Now, DateFormat.GeneralDate))
            Dim theCommand As New SqlClient.SqlCommand("spDailyWorkConfAOptima", MyConnection) With {
                    .CommandType = CommandType.StoredProcedure
                    }
            theCommand.Parameters.AddWithValue("@datew", _dt_Start)
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim sqlDataAdapter As SqlDataAdapter
            sqlDataAdapter = New SqlDataAdapter With {
                .SelectCommand = theCommand
                }
            sqlDataAdapter.Fill(dt)
            If MyConnection.State = ConnectionState.Open Then
                MyConnection.Close()
            End If

            'dt.Dispose()
        End Sub

        Public Sub ShowDetailedStats_Click(sender As Object, e As EventArgs)

            GetPropertiesDetails(Inform(_leng).Masina.ToString())
            LoadInfoByName()
            ModalPanel.Visible = True

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

        Public Sub Buttons_Click(sender As Object, e As EventArgs)

            If _eff_a.Columns.Count <= 1 Then
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
            lblArticle.Text = Inform(_leng).Article.ToString()
            lblPhase.Text = Inform(_leng).Faza.ToString()
            lblTempo.Text = Inform(_leng).Time.ToString()
            lblQty.Text = Inform(_leng).Qty.ToString()
            lblNorm.Text = Inform(_leng).Norm.ToString()
            lblusrlinea.Text = " " & Inform(_leng).Linea.ToString()

            'lblEfficiency.Text = Inform(_leng).Efficiency.ToString()

            ModalPanel.Visible = True
        End Sub
        Shared ReadOnly _dtAssent As New DataTable
        Dim viewA1 As DataView = New DataView(_dtAssent)

        'Public Sub GetAssentGrid()
        '    GetAssent(_dtAssent)

        '    'lblTotAss.Text = CStr(viewA1.Count)
        '    viewA1.Sort = "INT"

        '    'Try
        '    '    'Ukoliko procedura za assenteismo nije lepo prikupila podatke
        '    '    if viewA1.Table.Rows(1)(3).ToString() = "True" Then GetAssentGrid()  
        '    '    If viewA1.Table.Rows.Count > 13 Then GetAssentGrid()
        '    'Catch ex As Exception
        '    '    Exit Try
        '    'End Try

        '    gidassent.DataSource = viewA1
        '    gidassent.DataBind()
        'End Sub



        Dim tmpTable As DataTable
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
        Dim tblPauza As New DataTable

        Private Sub LoadBreakTable()

            Dim query As String = "SELECT tblPause.newID, tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Angajati.Angajat,Angajati.Linie,Angajati.IdSector FROM tblPause INNER Join Realizari ON tblPause.IdRealization = Realizari.Id inner join Angajati ON Realizari.IdAngajat = Angajati.Id WHERE Day(tblPause.StartTime) = '" & DateTime.Now.Day & "' AND Month(tblPause.StartTime) = '" & DateTime.Now.Month & "' AND Year(tblPause.StartTime) = '" & DateTime.Now.Year & "' AND IdSector='1' "

            MyConnection.Open()
            Dim myCommand As New SqlCommand(query, MyConnection)
            Dim myDataReader As SqlDataReader = myCommand.ExecuteReader()
            tblPauza.Load(myDataReader)
            myDataReader.Close()
            'myCommand = Nothing
            MyConnection.Close()

            MyDataSet.Reset()


            CreateColumns()

            For Each row As DataRow In tblPauza.Rows
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


        Dim _manichinoColleciton() As Button  'group manichino 
        Public Shared Man As Manichin

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

            'If _eff Is Nothing Then
            '    Efficiency_Procedure()
            'End If

            _manichinoColleciton = {Man13, Man14, Man15, Man16, Man17, Man18}
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
            lblArticle.Text = Man.Art
            lblNorm.Text = Man.Norm
            lblQty.Text = "Rotto:" & " " & Man.Mroto & " " & "Buono:" & " " & Man.Mbono
            lblPhase.Text = Man.Fase
            lblTempo.Text = Man.Time
            ModalPanel.Visible = True

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

            For Each row As DataRow In _eff_a.Rows
                tmpGrp = Convert.ToString(row.ItemArray(14))
                manactive = Convert.ToBoolean(row.ItemArray(16))
                If tmpGrp >= 313 And tmpGrp <= 318 Then
                    If tmpGrp = tagGrp Then
                        sq = row.Item(8).ToString()

                        If sq <> "0" Then
                            strQty = row.Item(8).ToString()
                        End If

                        strNorm = row.Item(7).ToString()
                        Man.Masin = (row.Item(3).ToString())
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

                        If mac = 2984 OrElse mac = 2986 OrElse mac = 2988 OrElse mac = 2990 OrElse mac = 2992 OrElse mac = 2994 Then
                            q1 = Integer.Parse(CStr(row.Item(8)))

                            ''roto
                        ElseIf mac = 2985 OrElse mac = 2987 OrElse mac = 2989 OrElse mac = 2991 OrElse mac = 2993 OrElse mac = 2995 Then
                            q2 = Integer.Parse(CStr(row.Item(8)))
                        End If

                        Man.Qty = q1 + q2

                        Man.Mbono = q1
                        Man.Mroto = q2

                        Man.Norm = strNorm    'parse single value
                        Man.Media = CSng(Math.Round(Man.Qty / factor, 0))
                        Man.Time = factor.ToString()
                        Man.Eff = ((Man.Qty / CSng(Man.Norm * Man.Time) * 100))     ''efficiency
                    End If
                End If
            Next

        End Sub

        Private Sub ColorByManichino()



            _manichinoColleciton = {Man13, Man14, Man15, Man16, Man17, Man18}

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
                        mans.BorderColor = Color.ForestGreen
                        mans.BackColor = Color.Green
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
                        mans.BorderColor = Color.Silver
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

        Private Sub Timer_db_update_DataBinding(sender As Object, e As EventArgs) Handles Timer_db_update.DataBinding

        End Sub

        Public Sub Cancel1_click(sender As Object, e As EventArgs)
            btn_close_intervali.Enabled = True
            modalintervali.Visible = False
        End Sub

        ReadOnly _hr(24) As Boolean
        ReadOnly _dataSet As New DataSet
        Dim _mainTable As New DataTable
        Dim _dtV As DataView

        Public Sub LoadHours()
            Const query = "SELECT * FROM Hours Where Idx='6'"

            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd As New SqlCommand(query, MyConnection)
            Dim dr As SqlDataReader = cmd.ExecuteReader

            While dr.Read()
                For i = 0 To 23
                    _hr(i) = CBool(dr(i))
                Next
            End While
            cmd.Dispose()
            dr.Close()
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()
        End Sub

        Public Sub LoadColumns()
            LoadHours()
            Dim colTable As DataTable = _dataSet.Tables.Add("HRPROD")
            Dim str = ""
            Dim i As Integer


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
        'GV_INTERVAL

        'LOAD PER HOUR EACH PERSONA - NORMAL
        Private Sub LoadInfoByName()
            Dim tKey As String = String.Empty
            Dim line As String = String.Empty
            Dim name As String = String.Empty
            Dim phase As String = String.Empty
            Dim comm As String = String.Empty
            Dim art As String = String.Empty
            Dim qty As Integer = 0
            Dim hour As Integer = 0

            LoadDataTable(mainTable)

            Dim htbl As New Hashtable
            Dim index As Integer = 0

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
                        Dim secRow As Integer = CInt(htbl(tKey))
                        Dim tot As Integer
                        dataSet.Tables("HRPROD").Rows(secRow).Item(hour - 1) = tot + qty
                    End If
                End If
            Next

            dtV = New DataView(dataSet.Tables("HRPROD"))
            dgv1.DataSource = dtV
            dgv1.DataBind()
            'System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)

        End Sub

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
        Structure Break
            Dim StartPause, EndPause As Date
        End Structure

        Public Shared JPauze() As Break
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


        'PONDERATION
        Private Function JobPonderation(vals As String) As Single
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

            For Each jRow As DataRow In _eff_a.Rows
                'GETTING DATA FOR CALCULATION
                Dim dbName As String = jRow.Item(0).ToString()

                Dim idSector As String = jRow.Item(17).ToString() 'ID SECTOR
                Dim name As String = jRow.Item(0).ToString 'ID REALIZATION
                Dim startTimeJ = CDate(jRow.Item(10)) 'CREAT

                Dim ts As TimeSpan = StartShift.TimeOfDay - startTimeJ.TimeOfDay
                If ts.Minutes > 30 Then
                    Dim tmpD As Date = startTimeJ.Date
                    startTimeJ = tmpD + StartShift.TimeOfDay
                End If

                Dim endTimeJ As Date
                If IsDBNull(jRow(13)) Then 'FIRST WRITE
                    If IsDBNull(jRow.Item(12)) Then 'CLOSED
                        If (Now < (startTimeJ.Date + EndShift.TimeOfDay)) Then
                            endTimeJ = Now
                        Else
                            endTimeJ = startTimeJ.Date + EndShift.TimeOfDay
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
                    _tmpJobs(lng).BphJ = CSng(jRow.Item(7)) 'BUCATI ORA

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

            For Each jRow As DataRow In _eff_a.Rows
                'GETTING DATA FOR CALCULATION
                Dim dbName As String = jRow.Item(0).ToString()

                Dim idSector As String = jRow.Item(17).ToString()
                Dim name As String = jRow.Item(0).ToString
                Dim startTimeJ = CDate(jRow.Item(10))

                Dim ts As TimeSpan = StartShift.TimeOfDay - startTimeJ.TimeOfDay
                If ts.Minutes > 30 Then
                    Dim tmpD As Date = startTimeJ.Date
                    startTimeJ = tmpD + StartShift.TimeOfDay
                End If

                Dim endTimeJ As Date
                If IsDBNull(jRow(13)) Then
                    If IsDBNull(jRow.Item(12)) Then
                        If (Now < (startTimeJ.Date + EndShift.TimeOfDay)) Then
                            endTimeJ = Now
                        Else
                            endTimeJ = startTimeJ.Date + EndShift.TimeOfDay
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

            For Each jRow As DataRow In _eff_a.Rows
                'GETTING DATA FOR CALCULATION
                Dim dbName As String = jRow.Item(0).ToString()

                Dim idSector As String = jRow.Item(17).ToString()
                Dim name As String = jRow.Item(0).ToString
                Dim startTimeJ = CDate(jRow.Item(10))

                Dim ts As TimeSpan = StartShift.TimeOfDay - startTimeJ.TimeOfDay
                If ts.Minutes > 30 Then
                    Dim tmpD As Date = startTimeJ.Date
                    startTimeJ = tmpD + StartShift.TimeOfDay
                End If

                Dim endTimeJ As Date
                If IsDBNull(jRow(13)) Then
                    If IsDBNull(jRow.Item(12)) Then
                        If (Now < (startTimeJ.Date + EndShift.TimeOfDay)) Then
                            endTimeJ = Now
                        Else
                            endTimeJ = startTimeJ.Date + EndShift.TimeOfDay
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

        'OVO JE ZA SVE INTERVALE
        Public Sub Strasnafunkcijaintervali(sender As Object, e As GridViewRowEventArgs)

            e.Row.Cells(1).Attributes.Add("style", "padding-left:5px;")
            e.Row.Cells(2).Attributes.Add("style", "padding-left:5px;")
            e.Row.Cells(3).Attributes.Add("style", "padding-left:5px;")
            e.Row.Cells(4).Attributes.Add("style", "padding-left:5px;")

            'ETICHETE COPP
            e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
            If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzEt" Then
                e.Row.Cells(1).Text = "LINEA13 Totale:"
                e.Row.Attributes.Add("style",
                                     "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")

                'lbl_et_copp_tot.Text = e.Row.Cells(1).Text

            End If

            'ETICHETE COMP
            e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
            If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzEtcomp" Then
                e.Row.Cells(1).Text = e.Row.Cells(2).Text
                e.Row.Attributes.Add("style",
                                     "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
                'lbl_et_comp_tot.Text = e.Row.Cells(1).Text
            End If

            'MANICHINO 
            e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
            If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzMan" Then
                e.Row.Cells(1).Text = "LINEA15 Totale:"
                e.Row.Attributes.Add("style",
                                     "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
                'lbl_et_manichino_tot.Text = e.Row.Cells(1).Text
            End If

            'RAMMENDO 
            e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
            If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzRam" Then
                e.Row.Cells(1).Text = "LINEA16 Totale:"
                e.Row.Attributes.Add("style",
                                     "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
                'lbl_et_rammendo_tot.Text = e.Row.Cells(1).Text
            End If

            'PRESSA 
            e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
            If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzPre" Then
                e.Row.Cells(1).Text = "LINEA17 Totale:"
                e.Row.Attributes.Add("style",
                                     "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
                'lbl_et_pressa_tot.Text = e.Row.Cells(1).Text
            End If

            'PIEGO 
            e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
            If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzPie" Then
                e.Row.Cells(1).Text = "LINEA18 Totale:"
                e.Row.Attributes.Add("style",
                                     "background-color: #333333;border-color: #0d0d0d;font-size: medium; color:white;")
                'lbl_et_piego_tot.Text = e.Row.Cells(1).Text
            End If

            For i = 5 To e.Row.Cells.Count - 1
                e.Row.Cells(i).Attributes.Add("style", "text-align:center;")
            Next

            Dim sat As Int32
            sat = DateTime.Now.Hour

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


        Public Sub PrimaTurno_Click(sender As Object, e As EventArgs) Handles btn_report.Click
            modalintervali.Visible = True
            Dim tKey As String = String.Empty
            Dim line As String = String.Empty
            Dim name As String = String.Empty
            Dim phase As String = String.Empty
            Dim comm As String = String.Empty
            Dim art As String = String.Empty
            Dim norm As String = String.Empty
            Dim qty = 0
            Dim hour = 0
            Dim sort = 0
            Dim qtyMan As Single = 0
            Dim idrealizar As String = 0
            Dim time As Single = 0

            '_mainTable.Clear()
            _mainTable.Clear()
            LoadDataTable(_mainTable)

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
            '_dataSet.Tables("HRPROD").Columns.Add("Media", Type.GetType("System.Int32"))
            '_dataSet.Tables("HRPROD").Columns.Add("Tempo", Type.GetType("System.String"))
            _dataSet.Tables("HRPROD").Columns.Add("Sorting", Type.GetType("System.Int32"))


            Dim l13 As DataRow = _dataSet.Tables("HRPROD").NewRow
            Dim l14 As DataRow = _dataSet.Tables("HRPROD").NewRow
            Dim l15 As DataRow = _dataSet.Tables("HRPROD").NewRow
            Dim l16 As DataRow = _dataSet.Tables("HRPROD").NewRow
            Dim l17 As DataRow = _dataSet.Tables("HRPROD").NewRow
            Dim l18 As DataRow = _dataSet.Tables("HRPROD").NewRow
            'dtlista1.text = _dataSet.Tables("HRPROD").NewRow


            For Each row As DataRow In _mainTable.Rows

                '                line = CType(Int32.Parse(CType(row(0).Remove(0, 5), String)), String)

                line = row(0).ToString()
                name = row(3).ToString()
                phase = row(7).ToString()
                comm = row(4).ToString()
                art = row(5).ToString()
                norm = row.Item(8).ToString()
                qty = CInt(row.Item(11)) * CInt(row.Item(6))
                qtyMan = CSng(row.Item(8)) * CInt(row.Item(9))
                idrealizar = CInt(row(12))

                hour = CInt(row.Item(10))

                'If phase.Contains("Travetta 5") Then
                '    sort = 1
                'ElseIf phase.Contains("T-fili") Then
                '    sort = 2
                'ElseIf phase.Contains("T/C spalle davanti") Then
                '    sort = 3
                'ElseIf phase.Contains("T/C sco. davanti") Then
                '    sort = 4
                'ElseIf phase.Contains("T/C maniche") Then
                '    sort = 5
                'ElseIf phase.Contains("sfillaciatura colli") Then
                '    sort = 6
                'ElseIf phase.Contains("Rimaglio Spalla 2 + fianco collo") Then
                '    sort = 7
                'ElseIf phase.Contains("Rimaglio spalla 1 + etichete") Then
                '    sort = 8
                'ElseIf phase.Contains("rimaglio maniche") Then
                '    sort = 9
                'ElseIf phase.Contains("Rimaglio collo tubolare") Then
                '    sort = 10
                'ElseIf phase.Contains("puntatura") Then
                '    sort = 11
                'ElseIf phase.Contains("o/v fianchi") Then
                '    sort = 12
                'ElseIf phase.Contains("t/c spalle 2") Then
                '    sort = 13
                'Else
                '    sort = 14
                'End If

                If line.Contains("LINEA13") Then
                    sort = 1
                ElseIf line.Contains("LINEA14") Then
                    sort = 2
                ElseIf line.Contains("LINEA15") Then
                    sort = 3
                ElseIf line.Contains("LINEA16") Then
                    sort = 4
                ElseIf line.Contains("LINEA17") Then
                    sort = 5
                ElseIf line.Contains("LINEA18") Then
                    sort = 6
                End If



                tKey = idrealizar & name & line ' & comm & art
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
                    'newRow.Item("Media") = JobPonderationMedia(idrealizar).ToString()
                    'newRow.Item("Efficiency") = JobPonderation(idrealizar).ToString() & "%"
                    'newRow.Item("Tempo") = ReturnHourJ(JobPonderationTempo(idrealizar))

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
                    If l13.Item(hour + 5) Is DBNull.Value Then
                        l13.Item(hour + 5) = qty
                    Else
                        l13.Item(hour + 5) += qty
                    End If

                ElseIf sort = 2 Then
                    sumEttcomp += qty
                    If l14.Item(hour + 5) Is DBNull.Value Then
                        l14.Item(hour + 5) = qty
                    Else
                        l14.Item(hour + 5) += qty
                    End If

                ElseIf sort = 3 Then
                    sumMan += qty
                    If l15.Item(hour + 5) Is DBNull.Value Then
                        l15.Item(hour + 5) = qty
                    Else
                        l15.Item(hour + 5) += qty
                    End If

                ElseIf sort = 4 Then
                    sumRam += qty
                    If l16.Item(hour + 5) Is DBNull.Value Then
                        l16.Item(hour + 5) = qty
                    Else
                        l16.Item(hour + 5) += qty
                    End If

                ElseIf sort = 5 Then
                    sumPre += qty
                    If l17.Item(hour + 5) Is DBNull.Value Then
                        l17.Item(hour + 5) = qty
                    Else
                        l17.Item(hour + 5) += qty
                    End If

                ElseIf sort = 6 Then
                    sumPie += qty
                    If l18.Item(hour + 5) Is DBNull.Value Then
                        l18.Item(hour + 5) = qty
                    Else
                        l18.Item(hour + 5) += qty
                    End If
                End If

            Next

            'Etichete Totale - Row add
            l13.Item(1) = "zzEt"
            l13.Item("EachTotale") = sumEtt
            'lbl_et_copp_tot.Text =  sumEtt.ToString()
            l13.Item("Sorting") = 1
            _dataSet.Tables("HRPROD").Rows.Add(l13)


            'Etichete Totale - Row add
            l14.Item(1) = "zzEtcomp"
            l14.Item("EachTotale") = sumEttcomp
            'lbl_et_comp_tot.Text =  sumEttcomp.ToString()
            l14.Item("Sorting") = 2
            _dataSet.Tables("HRPROD").Rows.Add(l14)

            'Manichino Totale - Row add
            l15.Item(1) = "zzMan"
            l15.Item("EachTotale") = sumMan
            'lbl_et_manichino_tot.Text =  sumMan.ToString()
            l15.Item("Sorting") = 3
            _dataSet.Tables("HRPROD").Rows.Add(l15)

            'Rammendo Totale - Row add
            l16.Item(1) = "zzRam"
            l16.Item("EachTotale") = sumRam
            'lbl_et_rammendo_tot.Text =  sumRam.ToString()
            l16.Item("Sorting") = 4
            _dataSet.Tables("HRPROD").Rows.Add(l16)

            'Pressa Totale - Row add
            l17.Item(1) = "zzPre"
            l17.Item("EachTotale") = sumPre
            'lbl_et_pressa_tot.Text = sumPre.ToString()
            l17.Item("Sorting") = 5
            _dataSet.Tables("HRPROD").Rows.Add(l17)

            'Piego Totale - Row add
            l18.Item(1) = "zzPie"
            l18.Item("EachTotale") = sumPie
            'lbl_et_piego_tot.Text =  sumPie.ToString()
            l18.Item("Sorting") = 6
            _dataSet.Tables("HRPROD").Rows.Add(l18)


            _dtV = New DataView(_dataSet.Tables("HRPROD"))
            _dtV.Sort = "Sorting Asc, Phase Desc, name Asc, line Asc"
            _dataSet.Tables("HRPROD").Columns.Remove("Sorting")
            gv_intervali.DataSource = _dtV
            gv_intervali.DataBind()

            modalintervali.Visible = True

            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showintervali();", True)

        End Sub



    End Class
End Namespace