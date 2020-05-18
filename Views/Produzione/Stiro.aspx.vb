Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf

Partial Class Stiro
    Inherits System.Web.UI.Page
    
    Public CtX As Integer = 1
    Dim _totalEfficiency As Single = 0
    Dim _totalMac As Integer = 0
    Dim _strConnection As String
    Public MyDataSet As New DataSet

    Public Shared StartShift As DateTime
    Public Shared EndShift As DateTime
    Dim _pnGroup As Panel()
    Shared _pnFullGroup As Panel()
    Dim _pnPiegoTOt As Panel()
    Dim _pnPressaTOt As Panel()
    Dim _pnRammendoTOt As Panel()
    Dim _pnManichinotTOt As Panel()
    Dim _pnEticheteTOt As Panel()

    Structure WorkerDetails
        Dim Name As String
        Dim Commesse As String
        Dim Masina As String
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
        Dim StrTime As String
        Dim Articole As String
    End Structure

    Structure WorkerDetailsCheck
        Dim Name As String
        Dim Faza As String
        Dim Line As String
    End Structure

    Public Shared Inform() As WorkerDetails
    Public Shared InformCheck() As WorkerDetailsCheck

    Structure Liber
        Dim StartPauza As Date
        Dim EndPauza As Date
    End Structure

    Shared _arrPauze() As Liber
    Dim _dt_Start As DateTime = DateTime.now
    ReadOnly _hr(24) As Boolean
    ReadOnly _dataSet As New DataSet
    Dim _dtV As DataView
    Dim _mainTable As New DataTable
    Dim _mainName As String

    Shared ReadOnly _myConnection As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")

    Structure Manichin
        'primary colleciton for computing
        Dim Time As Single 'fase work time parameter
        Dim Qty As Single  'quantity
        Dim Norm As Single 'quanity/hour
        Dim Masin As String 'masina
        Dim Eff As Single   'get eff in properties
        Dim Media As Single 'get middle value of production

        Dim mroto As Single
        Dim mbono As Single

        ''other info
        Dim Name As String
        Dim Comm As String
        Dim Fase As String  'DEFAULT AS MANICHINO
        Dim Art As String
        Dim Act As Integer
    End Structure

    Shared _modEff As Integer

    Public Shared Man As Manichin
    Dim WithEvents _lblUsers As New Label
    Dim _pb As ImageButton
    Dim _eff As New DataTable

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

    Dim lbl_total_eff_text_Stiro As Label
    Dim lbl_total_eff_value_Stiro As Label
    Dim lbl_total_ass_text_Stiro As Label
    Dim lbl_total_ass_value_Stiro As Label
    Dim lbl_ultimo_agiornato_text As Label
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'If Not Me.Page.User.Identity.IsAuthenticated Then
        '    FormsAuthentication.RedirectToLoginPage()
        'End If

        Response.BufferOutput = True
        Response.Buffer = True

        'LEFT SIDE BUTTONS
        btn_get_efficiency = CType(Master.FindControl("cmdDownload"), ImageButton)
        btn_get_cappi = CType(Master.FindControl("capiDownload"), ImageButton)
        btn_get_assenteismo = CType(Master.FindControl("ppptDownload"), ImageButton)
        btn_get_machines = CType(Master.FindControl("testdugme"), ImageButton)

        'FILTER BUTTONS
        btn_crveno = CType(Master.FindControl("crveno"), Button)
        btn_zuto = CType(Master.FindControl("zuto"), Button)
        btn_zeleno = CType(Master.FindControl("zeleno"), Button)
        btn_default = CType(Master.FindControl("btndefault"),Button)
        btn_assenteismo = CType(Master.FindControl("filterassenteismo"),ImageButton)

        'TOP MENU BUTTONS
        btn_report = CType(Master.FindControl("btn_report"),ImageButton)
        btn_org = CType(Master.FindControl("btn_org"),ImageButton)
        btn_pause = CType(Master.FindControl("btn_pause"),ImageButton)
        btn_print = CType(Master.FindControl("btn_print"),ImageButton)
        btn_pdf = CType(Master.FindControl("btn_pdf"),ImageButton)

        'EFFICIENCY LABELS
        lbl_total_eff_text_Stiro = CType(Master.FindControl("lbl_total_eff_text"), Label)
        lbl_total_eff_value_Stiro = CType(Master.FindControl("lbl_total_eff_value"), Label)
        'ASSENTEISMO LABELS - EFFICIENCY
        lbl_total_ass_text_Stiro = CType(Master.FindControl("lbl_total_ass_text"), Label)
        lbl_total_ass_value_Stiro = CType(Master.FindControl("lbl_total_ass_value"), Label)
        'TIME WHEN REFRESH FINISH
        lbl_ultimo_agiornato_text = CType(Master.FindControl("lbl_ultimo_agiornato"), Label)

        'Sorting Panels
        CType(Master.FindControl("pnl_sort_by_line"),Panel).Controls.Add(pnl_sort_by_line_stiro)
        
        'PANEL GROUPS OF LINE PANELS
        _pnGroup = New Panel() {l4, l9, l14}
        _pnFullGroup = New Panel() {l1, l2, l3, l5, l6, l7, l8, l10, l11, l12, l13, l15, l4, l9, l14}
        _pnPiegoTOt = New Panel() {l1, l6, l11}
        _pnPressaTOt = New Panel() {l2, l7, l12}
        _pnRammendoTOt = New Panel() {l3, l8, l13}
        _pnManichinotTOt = New Panel() {MANICHINO_LINEA1, MANICHINO_LINEA2, MANICHINO_LINEA3}
        _pnEticheteTOt = New Panel() {l5, l10, l15}
        
        StartTimeEndTimePauses()
        'TopLeftTimer()

        If (Page.IsPostBack = False) Then

            ReadData()
            GetMembersOffline()

                ScriptManager.RegisterStartupScript(upd_stiro, upd_stiro.GetType(), "a_key", "<script type='text/javascript' src='./js/conf-stiro.js'></script>", false)
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "bindEvents();", True)
        End If

        lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")
        pnlReparto.Visible = False
        pnlglavni.Visible = True
        ModalPanel.Visible = False
        modalintervali.Visible = False

        btn_crveno.BackColor = Color.Crimson
        btn_zuto.BackColor = Color.Yellow
        btn_zeleno.BackColor = Color.LimeGreen


        'ModalPanel.Visible = True

    End Sub

    Protected Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error

    'Dim ex = Server.GetLastError

    'If ex.Message.Contains("Specific string from controls' error") Then 
    '    Server.ClearError()
    '    Response.Redirect("loknitting.olimpias.it/Stiro.aspx")
    'End If
        
End Sub

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

    Protected sub NonWeekend()
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
    End sub

    Protected sub Weekend()
                    Dim strPause As String
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
    End sub

     Public ReadWriteLock As New System.Threading.ReaderWriterLock()
    Sub ReadData()
        ReadWriteLock.AcquireReaderLock(System.Threading.Timeout.Infinite)
        Try
            AddButtonsHandlers()

            'GetMembersOfflineDB(_myConnection)
            CmdDownload_Click(nothing, Nothing)
            FaseVerify()
        Finally
            ReadWriteLock.ReleaseReaderLock() ' Release the read lock.
        End Try
    End Sub

       Public Sub btn_org_click(sender As Object,e As eventargs) Handles btn_org.Click
            Page.Response.Redirect("./ReportStiro_Light.aspx")
       End Sub

       Public Sub btn_pause_click(sender As Object,e As eventargs) Handles btn_pause.Click
            Page.Response.Redirect("./Pauses.aspx")
       End Sub

      Public Sub btn_print_click(sender As Object,e As eventargs) Handles btn_print.Click

      End Sub


       Protected Sub Timer_db_update_Tick1(sender As Object, e As EventArgs)
                lbl_ultimo_agiornato_text = CType(Master.FindControl("lbl_ultimo_agiornato"), Label)

                lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")

        ReadData()
        'GetMembersOfflineDB(_myConnection)
        '    CmdDownload_Click(nothing, Nothing)
        '    FaseVerify()

            ScriptManager.RegisterStartupScript(upd_stiro, upd_stiro.GetType(), "a_key", "<script type='text/javascript' src='./js/conf-stiro.js'></script>", false)

        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "bindEvents();", True)



        If _modEff = 2 Then
            BtnDownload_pppt_click(Nothing, Nothing)
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "titlebarupdate();", True)
            'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "titlebarupdate();", True)
            pnlglavni.Visible = True

        ElseIf _modEff = 3 Then
            BtnDownload_capi_click(Nothing, Nothing)
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "titlebarupdate();", True)
            'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "titlebarupdate();", True)
            pnlglavni.Visible = True

        ElseIf _modEff = 4 Then
            pnlglavni.Visible = False
            pnlReparto.Visible = True

            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "titlebarupdate();", True)
            'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "titlebarupdate();", True)
        End If

        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "titlebarupdate();", True)
        'ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "titlebarupdate();", True)
    End Sub

    Protected Sub BtnInvoke_Click(sender As Object, e As EventArgs)
        'lblText.Text = "Processing completed"
    End Sub

    Public Sub btndefault_Click() Handles btn_default.Click
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub
    ReadOnly _dtBreak As New DataTable


    Dim tbl_machines As New DataTable
    Private Sub GetBreakTable(con As SqlConnection)
         If _MyConnection.State = ConnectionState.Closed Then _MyConnection.Open()
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
        If _MyConnection.State = ConnectionState.Open Then _MyConnection.Close()
    End Sub

    Private Sub DrawBreakRectangles(p As Panel)
        '_dtBreak.Clear()
        'If _myConnection.State = ConnectionState.Closed Then _myconnection.Open()

        'Dim q = "SELECT tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Masini.CodMasina "
        'q += "FROM tblPause INNER JOIN Realizari ON tblPause.IdRealization = Realizari.Id "
        'q += "INNER JOIN Masini ON Realizari.IdMasina = Masini.Id WHERE "
        'q += "tblPause.StartTime > CAST(CURRENT_TIMESTAMP As Date)"

        'Dim cmd As New SqlCommand(q,_myConnection)
        'Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)
        '_dtBreak.Load(dr)
        'dr.Close()
        'cmd = Nothing

        'If _myConnection.State = ConnectionState.Open Then _myconnection.Close()
        For Each o As Object In p.Controls
            Dim lbl = TryCast(o, Button)
            If lbl IsNot Nothing Then
                Dim hb As New HatchBrush(HatchStyle.DarkVertical, Color.Gray, Color.DimGray)
                For Each row As DataRow In tbl_machines.Rows
                    Dim breakType As String = row(0).ToString()
                    If Not breakType = "WC" Then Continue For
                    Dim breakCode As String = Convert.ToString(row(3))
                    If breakCode = lbl.TabIndex.ToString() AndAlso IsDBNull(row(2)) Then
                        If Not lbl.Text = "" AndAlso Not lbl.BackColor = Color.White Then
                            lbl.BorderColor = Color.DarkGray
                            lbl.BackColor = Color.LightGray
                            lbl.Text = "WC"
                            lbl.Attributes.Add("value","WC")
                            lbl.ForeColor = Color.Black
                            lbl.CssClass += " example"
                        End If

                    End If
                Next
            End If
        Next
    End Sub

    Public Sub TopLeftTimer()
        Dim sat As Integer

        Dim diorefatte As String
        Dim diorefatte1 As String

        sat = DateTime.Now.Hour

        diorefatte = DateTime.Now.AddHours(-7).ToString("hh:mm:ss")
        diorefatte1 = DateTime.Now.AddHours(-15).ToString("hh:mm:ss")

        ''If sat < 15 Then
        ''    lblTime1.Text = "Numero di ore fatte: " & diorefatte
        ''End If

        ''If sat > 15 Then
        ''    lblTime1.Text = "Numero di ore fatte: " & diorefatte1
        ''End If
    End Sub

    Public Sub CmdLogOut_Click(sender As Object, e As EventArgs)
        Session("user") = Nothing
        Session.Clear()
        Session.Abandon()
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetNoStore()
        Response.Redirect("LogInInformator.aspx")
    End Sub

    Private Shared Sub LogOffUser(user As String)
        Dim query As String = "Update user_Account Set is_webonline='False' WHERE E_mail='" & user & "'"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub
     Public Shared Function Efficiency_Procedure_Stiro As DataTable
        Dim _effs As new DataTable
        Dim dtStart As String = FormatDateTime(DateTime.Today)
        Dim cmd As New SqlCommand("spEfficiencyStiro", _myConnection)
        
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@startTime", SqlDbType.DateTime).Value = dtStart
        cmd.Parameters.Add("@stopTime", SqlDbType.DateTime).Value = dtStart

        If _myConnection.State = ConnectionState.Closed Then
            _myConnection.Open()
        End If

        Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

        _effs.Load(dr)
        dr.Close()
        cmd.Dispose()

        If _myConnection.State = ConnectionState.Open Then
            _myConnection.Close()
        End If

        Return _effs
    End Function
    Protected Sub CmdDownload_Click(sender As Object, e As EventArgs) Handles btn_get_efficiency.Click
        If Page.IsAsync = True Then
            _modEff = 1
            Else
            _modEff = 1
        End If
        Try
            Efficiency_Procedure()
        Catch ex As Exception
            Efficiency_Procedure()
        End Try
        
        ColorByEfficiency()
        ColorByManichino()
        Buttons_Hover()

         GetBreakTable(_MyConnection)
         For Each p As Panel In _pnFullGroup
            DrawBreakRectangles(p)
         Next

        lblPiegoTotale.Text = String.Empty
        lblPressaTotale.Text = String.Empty
        lblManichinototale.Text = String.Empty
        lblEticheteTOtale.Text = String.Empty
        lblRammendoTotale.Text = String.Empty

        lbl_ultimo_agiornato_text.Text = "Ultimo aggiornamento: " & DateTime.Now.ToString("hh:mm:ss")
        pnlglavni.Visible = True
    End Sub

    ReadOnly _datatable As New DataTable
    Dim _persons As String = String.Empty

    Public Sub BtnDownload_pppt_click(sender As Object, e As EventArgs) Handles btn_get_assenteismo.Click
        _modEff = 2
        ColorByEfficiency()
        ColorByManichino()
        GetMembersOffline()
        For Each p As Panel In _pnFullGroup
            For Each obj As Object In p.Controls
                Dim btn = TryCast(obj, Button)
                If btn IsNot Nothing Then
                    If btn.BorderColor = Color.Red Then
                        btn.BorderWidth = 1
                    Else
                        btn.BorderWidth = 1
                        btn.BackColor = Color.White
                        btn.Text = ""
                        btn.BorderColor = Color.DodgerBlue
                    End If

                    If btn.BackColor <> Color.White Then
                        btn.BackColor = Color.White
                    End If
                End If
            Next
        Next


        For Each mans As Button In _manichinoColleciton
            If mans IsNot Nothing Then
                If mans.BorderColor = Color.Red Then
                    mans.BorderWidth = 1
                Else
                    mans.BorderWidth = 1
                    mans.BackColor = Color.White
                    mans.Text = ""
                    mans.BorderColor = Color.DodgerBlue
                End If

                If mans.BackColor <> Color.White Then
                    mans.BackColor = Color.White
                    mans.BorderColor = Color.DodgerBlue
                End If
            End If
        Next

        lblPiegoTotale.Text = String.Empty
        lblPressaTotale.Text = String.Empty
        lblManichinototale.Text = String.Empty
        lblEticheteTOtale.Text = String.Empty
        lblRammendoTotale.Text = String.Empty
        pnlglavni.Visible = True
    End Sub

    Dim _cappitot As Integer = 0
    Dim _pires1 As Integer = 0
    
      Public Sub BtnDownload_capi_click(sender As Object, e As EventArgs) Handles btn_get_cappi.Click
        If Page.IsAsync = True Then
            _modEff = 3
        End If

        _modEff = 3
          Dim worktime As New Double   
          Dim dt_capi As New DataTable
          LoadDataTable(dt_capi)

        ColorByEfficiency()

        For Each pan As Panel In _pnFullGroup
            _cappitot = 0
            For Each butt As Button In pan.Controls.OfType(Of Button)
                butt.Text = String.Empty
                Dim results = From myRow In dt_capi.Rows Where myRow("CodMasina") = butt.TabIndex Select myRow

                For Each row In results
                        Dim broj_komada As Single = CSng((row.Item("BucatiButon")) * row.Item("Qty"))
                        butt.Text = CStr(broj_komada & "/" & (row.Item("BucatiOra") ))
                        _cappitot += Convert.ToInt32(broj_komada)
                Next
            Next

            For Each pnPan As Panel In pan.Controls.OfType(Of Panel)
                For Each lbl As Label In pnPan.Controls.OfType(Of Label)
                    lbl.Text = lbl.Text & " " & "Σ=" & _cappitot.ToString()
                Next
            Next
            _pires1 += _cappitot
        Next
        ColorByManichino()
        
        lblPiegoTotale.Text = "PIEGO TOTALE:" & " " &
                              Integer.Parse(lblPg1.Text.Split(CType("=", Char))(1)) +
                              Integer.Parse(lblPg2.Text.Split(CType("=", Char))(1)) +
                              Integer.Parse(lblPg3.Text.Split(CType("=", Char))(1))
        lblPressaTotale.Text = "PRESSA TOTALE:" & " " &
                               Integer.Parse(lblPress1.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblPress2.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblPress3.Text.Split(CType("=", Char))(1))
        lblRammendoTotale.Text = "RAMMENDO TOTALE:" & " " &
                               Integer.Parse(lblRam1.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblRam2.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblRam3.Text.Split(CType("=", Char))(1))
        
        lblManichinototale.Text = "MANICHINO TOTALE:" & " " &
                               Integer.Parse(lblMan1.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblMan2.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblMan3.Text.Split(CType("=", Char))(1))

        lblEticheteTOtale.Text = "ETICHETE TOTALE:" & " " &
                               Integer.Parse(lblEt1.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblEt2.Text.Split(CType("=", Char))(1)) +
                               Integer.Parse(lblEt3.Text.Split(CType("=", Char))(1))
        pnlglavni.Visible = True
      End Sub

    Public Sub BtnMachine_click(sender As Object, e As EventArgs) Handles btn_get_machines.Click
        For Each pan As Panel In _pnFullGroup
            For Each butt As Button In pan.Controls.OfType(Of Button)
                butt.Text = CType(butt.TabIndex, String)
            Next
        Next

        For Each r As Panel In _pnGroup
            For Each butt As Button In r.Controls.OfType(Of Button)
                butt.Text = CType(butt.TabIndex, String)
            Next
        Next
    End Sub

    Private Sub CompareDataTables(ByVal dt1 As DataTable, ByVal dt2 As DataTable)
        Try
        Dim Results =
                (
                From table1 In dt1
                Join table2 In dt2 On table1.Field(Of String)("Name") Equals table2.Field(Of String)("Angajat")
                Where table1.Field(Of String)("Name") = table2.Field(Of String)("Angajat") And
                      table1.Field(Of String)("Lavoro") <> table2.Field(Of String)("Operatie")
                Select table1)
         'Try
        For Each p As Panel In _pnFullGroup
            For Each obj As Object In p.Controls
                Dim btn = TryCast(obj, Button)

                For Each row As DataRow In Results
                If btn IsNot Nothing Then

                            If btn.BackColor <> Color.White Then
                                    GetPropertiesDetails(btn.TabIndex.ToString())
                                    GetManichinoInfo(btn.TabIndex.ToString())
                                 If Inform(Leng).Name = row.ItemArray(0)


                                      If Inform(leng).Faza <> row.ItemArray(1)

                                             lblfasechecker.Text = "Default:" & " " & row.Item(1).ToString()

                                            If Inform(leng).Faza = "PIEGO"
                                                btn.Attributes.add("style","border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")
                           
                                            elseIf Inform(Leng).Faza = "PRESSA"
                                                btn.Attributes.add("style","border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")
                                    
                                            elseIf Inform(Leng).Faza = "RAMMENDO"
                                                btn.Attributes.add("style","border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")

                                            elseIf Inform(Leng).Faza = "ET. COMP" 
                                                btn.Attributes.add("style"," border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")

                                           elseIf Inform(leng).Faza = "ET. COPP"
                                               btn.Attributes.add("style","border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")

                                             elseIf Inform(leng).Faza = "MANICHINO"
                                               btn.Attributes.add("style","border-bottom-style:solid; border-bottom-width: 5px;border-top-style: solid;border-top-width: 5px;")
                                            End If                               
                                      End If
                                 End If
                             End If
                End If
                        Next
                    Next
                Next
                    Catch ex As Exception
            Exit sub
        End Try

    End Sub

    Public Sub FaseVerify()
        VeriftyFase()
        CompareDataTables(_dtVerifyFase, _eff)
    End Sub

    ReadOnly _ds As New DataSet()
    Public Function GetEficiencyDetails(masina As String, dt As DataTable) As Single
        Dim efficiency As Single
        Dim worktime As Single
        Dim temp As String  'machine
        Dim isActive = False 'act activation

        Dim tempOra As String = String.Empty
        Dim tempCantitate As String = String.Empty
        Dim tempBucati As String = String.Empty
        Dim temp1 As String
        Try
            For Each row As DataRow In _eff.Rows
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
        Catch ex As Exception
            Exit Try
        End Try
        Return (efficiency * 100)
    End Function

    Public sat As Integer = DateTime.Now.Hour
     Dim today As DateTime = DateTime.Today
    ReadOnly _offlineDt As New DataTable


    Public Sub GetMembersOfflineDB(con As SqlConnection)
        _offlineDt.Clear()

        If _myConnection.State = ConnectionState.Open Then
            Exit Sub
        End If

       
        If DateTime.Now.Hour <= 14 Then
            Dim query As String
            query = "Select * from tblTurno where turno=1 and date='"+ today +"' and Fase <> 'CAPOLINEA'"
            If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
            Dim cmd = New SqlCommand(query, con)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            _offlineDt.Load(dr)
            dr.Close()
            If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
        End If

        If DateTime.Now.Hour >= 15 Then
            Dim query As String
             query = "Select * from tblTurno where turno=2 and date='"+ today +"' and Fase <> 'CAPOLINEA'"
            If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
            Dim cmd = New SqlCommand(query, con)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            _offlineDt.Load(dr)
            dr.Close()
            cmd.Dispose()
            If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
        End If
    End Sub
    Public Sub GetMembersOffline()
        '_offlineDt.Clear()

        For Each pan As Panel In _pnFullGroup
            For Each buttons As Button In pan.Controls.OfType(Of Button)
                If Not buttons.Text.Contains("%") Then
                    buttons.Text = String.Empty
                End If
            Next
        Next

        pInactiv = 0
        pInactiv = _offlineDt.Rows.count

        Dim lstButtons As New List(Of Object)
        Dim lstInactive As New List(Of Object)
        Dim listNames As New List(Of Object)
        Dim listPiego As New List(Of Object)
        Dim listPressa As New List(Of Object)
        Dim listRammendo As New List(Of Object)
        Dim listManichino As New List(Of Object)
        Dim listEtichete As New List(Of Object)
        Dim piegoCounter As Integer = 0
        Dim pressaCounter As Integer = 0
        Dim rammendoCounter As Integer = 0
        Dim manichinoCounter As Integer = 0
        Dim ettCounter As Integer = 0

        For Each row As DataRow In _offlineDt.Rows

            If row(3).ToString = "PIEGO" Then
                If Not listPiego.Contains(row(2).ToString) Then listPiego.Add(row(2).ToString)
            End If

            If row(3).ToString = "PRESSA" Then
                If Not listPressa.Contains(row(2).ToString) Then listPressa.Add(row(2).ToString)
            End If

            If row(3).ToString = "RAMMENDO" Then
                If Not listRammendo.Contains(row(2).ToString) Then listRammendo.Add(row(2).ToString)
            End If

            If row(3).ToString = "MANICHINO" Then
                If Not listManichino.Contains(row(2).ToString) Then listManichino.Add(row(2).ToString)
            End If

            If row(3).ToString = "ET. COPP" Or row(3).ToString = "ET. COMP" Then
                If Not listEtichete.Contains(row(2).ToString) Then listEtichete.Add(row(2).ToString)
            End If
        Next

        'PIEGO
        gv_piego.DataSource = listPiego
        gv_piego.DataBind()

        'PRESSA
        gv_pressa.DataSource = listPressa
        gv_pressa.DataBind()
        'RAMMENDO
        gv_rammendo.DataSource = listRammendo
        gv_rammendo.DataBind()
        'MANICHINO
        gv_manichino.DataSource = listManichino
        gv_manichino.DataBind()
        'ETTICHETA
        gv_ettichete.DataSource = listEtichete
        gv_ettichete.DataBind()

        For Each pan As Panel In _pnFullGroup
            For Each row As DataRow In _offlineDt.Rows
                For Each buttons As Button In pan.Controls.OfType(Of Button)

                    If buttons IsNot Nothing AndAlso buttons.BackColor = Color.White Then
                        lstButtons.Add(buttons.ID & "," & buttons.TabIndex.ToString())
                        buttons.TabIndex = CShort(pan.ID.Remove(0, 1))
                        Try

                                If buttons.Parent.Equals(l1) Or buttons.Parent.Equals(l6) Or buttons.Parent.Equals(l11) Then

                                    If piegoCounter <= 0  Then
                                        piegoCounter = 0
                                    End If
                                    buttons.Text = Cstr(listPiego(piegoCounter))
                                    piegoCounter = piegoCounter + 1
                                End If

                                 If listPiego Is Nothing And listPiego.Count = 0
                                          wcline1.Text="0"
                                        Else
                                         wcline1.Text=  listPiego.Count.ToString()
                                 End If
                                
                                If buttons.Parent.Equals(l2) Or buttons.Parent.Equals(l7) Or buttons.Parent.Equals(l12) Then
                                    If pressaCounter <= 0 Then
                                        pressaCounter = 0
                                    End If

                                    buttons.Text = Cstr(listPressa(pressaCounter))
                                    pressaCounter = pressaCounter + 1
                                    End If

                                    If listPressa Is Nothing And listPressa.Count = 0
                                          wcline2.Text="0"
                                        Else
                                          wcline2.Text= listPressa.Count.ToString()
                                   End If
                                
                                    If buttons.Parent.Equals(l3) Or buttons.Parent.Equals(l8) Or buttons.Parent.Equals(l13) Then
                                        If rammendocounter <= 0 Then
                                            rammendocounter = 0
                                        End If

                                        buttons.Text = CStr(listRammendo(rammendocounter))
                                        rammendocounter = rammendocounter + 1
                                    End If

                                   If listRammendo Is Nothing And listRammendo.Count = 0
                                          wcline3.Text="0"
                                        Else
                                           wcline3.Text = listRammendo.Count.ToString()
                                   End If
                                
                                If buttons.Parent.Equals(l4) Or buttons.Parent.Equals(l9) Or buttons.Parent.Equals(l14) Then
                                    If manichinoCounter <= 0  Then
                                        manichinoCounter = 0
                                    End If

                                    buttons.Text = listManichino(manichinoCounter)
                                    manichinoCounter = manichinoCounter + 1
                                    End if

                                    If listManichino Is Nothing And listManichino.Count = 0
                                              wcline4.Text="0"
                                            Else
                                        wcline4.Text=CStr(listManichino.Count)

                                    End If

                                If buttons.Parent.Equals(l5) Or buttons.Parent.Equals(l10) Or buttons.Parent.Equals(l15) Then
                                    If ettCounter <= 0 Then
                                        ettCounter = 0
                                    End If

                                    buttons.Text = Cstr(listEtichete(ettCounter))
                                    ettCounter = ettCounter + 1
                                 End If

                                      If listEtichete Is Nothing And listEtichete.Count = 0
                                              wcline5.Text="0"
                                            Else
                                           wcline5.Text = listEtichete.Count.ToString()
                                       End If

                            
                            
                        Catch ex As Exception
                            'OBRATITI PAZNJU
                            'Exit sub
                            Continue For
                         
                        End Try
                        buttons.BorderColor = Color.Red
                        buttons.BorderWidth = 1
                    End If

                    For Each str As String In lstButtons
                        Dim strName As String = str.Split(CType(",", Char))(0)
                        If buttons.ID = strName Then _
                            buttons.TabIndex = CType(Convert.ToInt32(str.Split(CType(",", Char))(1)), Short)
                    Next
                Next
            Next
        Next
    End Sub

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

    Public Shared Leng As Integer

    Public Sub GetPropertiesDetails(idMasina As String)
        If IsNothing(Inform) Then
            Leng = 0
        Else
            Leng = Inform.Length
        End If

        ReDim Preserve Inform(Leng)
        Try
         With Inform(Leng)
            .Commesse = String.Empty
            .Faza = String.Empty
            .Masina = String.Empty
            .Name = String.Empty
            .Articole = String.Empty

            Dim temp As String

            For Each row As DataRow In _eff.Rows
                temp = row.Item("CodMasina").ToString()
                If temp = idMasina Then
                    .Masina = temp.ToString()
                    .Name = row.Item("Angajat").ToString()
                    .Articole = row.Item("Articol").ToString()
                    .Faza = row.Item("Operatie").ToString()
                    .Norm = CSng(row.Item("BucatiOra"))
                    .Qty = CSng(row.Item(8)) * CInt(row.Item("BucatiButon"))
                    .ComQty = CInt(row.Item(15))
                    .ValClick = CSng(row.Item("BucatiButon"))
                    .SingleQty = CSng(row.Item(8))

                    Dim startTime = CDate(row.Item("Creat"))
                    Dim ts As TimeSpan = StartShift.TimeOfDay - startTime.TimeOfDay
                    If ts.Minutes > 30 Then
                        Dim tmpD As DateTime = startTime.Date
                        startTime = tmpD + StartShift.TimeOfDay
                    End If

                    Dim endTime As DateTime
                    If IsDBNull(row("LastWrite")) Then
                        If IsDBNull(row.Item("Closed")) Then
                            If (Now < (startTime.Date + EndShift.TimeOfDay)) Then
                                endTime = Now
                            Else
                                endTime = startTime.Date + EndShift.TimeOfDay
                            End If
                        Else
                            endTime = CDate(row("Closed"))
                        End If
                    Else
                        endTime = CDate(row("LastWrite"))
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

        Catch ex As Exception
            Exit Sub
        End Try
    End Sub

    Public Function GetTime(time As Integer) As String
        Dim hrs As Double  'number of hours   '
        Dim min As Integer  'number of Minutes '
        'Seconds'
        min = time Mod 60
        'Minutes'
        hrs = ((time - min) / 60) Mod 60
        'Hours'
        hrs = ((time - (hrs + (min * 60))) / 3600) Mod 60
        Return Format(hrs, "00") & ":" & Format(min, "00")
    End Function

    Public Sub GetManichinoInfo(ByVal tagGrp As String) ', ByVal dt As DataTable)
        ''clear all info
        Man.Name = String.Empty
        Man.Comm = String.Empty
        Man.Fase = String.Empty
        'set zero by default
        Man.Time = 0
        Man.Qty = 0
        Man.Norm = 0
        Man.Eff = 0
        Man.Media = 0
        'create string parameters for gettin'values (DB)
        Dim sq As String
        Dim strQty As String = String.Empty
        Dim strNorm As String = String.Empty
        Dim mac As Integer
        Dim tmpGrp As String   'recognize group by tagging    
        For Each row As DataRow In _eff.Rows
            tmpGrp = Convert.ToString(row.ItemArray(14))
            Dim manactive As Boolean = Convert.ToBoolean(row.ItemArray(16))

            If tmpGrp IsNot Nothing Then
                If tmpGrp.Equals(tagGrp) Then
                    sq = row.Item(8).ToString()

                    If sq IsNot Nothing Then
                        strQty = row.Item(8).ToString()
                    End If

                    strNorm = row.Item(7).ToString()
                    Man.Masin = row.Item(3).ToString()
                    Man.Name = CStr(row.Item(2))
                    Man.Comm = CStr(row.Item(4))
                    Man.Fase = CStr(row.Item(6))
                    Man.Art = CStr(row.Item(21))
                    Man.Act = CInt(row.Item(16))
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
                    If mac = 2022 OrElse mac = 2106 OrElse mac = 2024 OrElse
                       mac = 2042 OrElse mac = 2046 OrElse mac = 2044 OrElse mac = 2049 OrElse mac = 2062 OrElse
                       mac = 2064 Then
                        q1 = Integer.Parse(CStr(row.Item(8)))
                    ''roto
                    ElseIf mac = 2023 OrElse mac = 2027 OrElse mac = 2025 OrElse
                           mac = 2041 OrElse mac = 2043 OrElse mac = 2045 OrElse mac = 2060 OrElse mac = 2061 OrElse
                           mac = 2063 Then
                        q2 = Integer.Parse(CStr(row.Item(8)))
                    End If

                    Man.Qty = (q1 + q2)
                    Man.mbono = q1
                    Man.mroto = q2
                    Man.Norm = Int32.Parse(strNorm)    'parse single value
                    Man.Media = CSng(Math.Round(Man.Qty / factor, 0))
                    Man.Time = factor
                    Man.Eff = ((Man.Qty / (Man.Norm * Man.Time) * 100))     ''efficiency
                End If
            End If
        Next
    End Sub

    Dim _manichinoColleciton() As Button  'group manichino 

    Dim m1 As Single
    Dim m2 As Single
    Dim m3 As Single
    Private Sub ColorByManichino()
                        m1 = 0
                        m2 = 0
                        m3 = 0
                               'MANICHINO L1
                        Dim liman1 As new List(Of String)
                        Dim man1eff As Single = 0
                        Dim man2eff As Single = 0
                        Dim man3eff As Single = 0
                        'MANICHINO L2
                        Dim liman2 As new List(Of String)
                        Dim man4eff As Single = 0
                        Dim man5eff As Single = 0
                        Dim man6eff As Single = 0
                        'MANICHINO L3
                        Dim liman3 As new List(Of String)
                        Dim man7eff As Single = 0
                        Dim man8eff As Single = 0
                        Dim man9eff As Single = 0

                        Dim cap1 As Single
                        Dim cap2 As Single
                        Dim cap3 As Single

                        Dim cap4 As Single
                        Dim cap5 As Single
                        Dim cap6 As Single
                    
                        Dim cap7 As Single
                        Dim cap8 As Single
                        Dim cap9 As Single

        _manichinoColleciton = {btn4, btn5, btn6, btn20, btn21, btn22, btn36, btn37, btn38}

        For Each mans As Button In _manichinoColleciton
            mans.BackColor = Color.White    'default color
            Man = New Manichin
            GetManichinoInfo(mans.TabIndex.ToString()) 
            mans.Attributes("title") = Man.Name

            'NewMethod(totEff, mac, efc, mans)
            If Single.IsInfinity(Man.Eff) Then
                Man.Eff = 100
            ElseIf Single.IsNaN(Man.Eff) Then
                Man.Eff = 0
            End If
            ''najveca moguca vrednost efikasnosti
            If Man.Eff > 200 Then
                Man.Eff = 100
            End If
            
                  'MANICHINO L1 START
                    If btn4.TabIndex = mans.TabIndex
                                man1eff = CShort(Man.Eff)
                                cap1 = Man.mroto + Man.mbono
                            If man1eff <> 0 then
                                liman1.Add(man1eff.ToString())
                            End If
                    End If

                    If btn5.TabIndex =  mans.TabIndex
                                man2eff = Man.Eff
                                cap2 = Man.mroto + Man.mbono
                             If man2eff <> 0 then
                                liman1.Add(man2eff.ToString())
                            End If
                    End If

                    If btn6.TabIndex =  mans.TabIndex
                        
                                man3eff = Man.Eff
                                cap3 = Man.mroto + Man.mbono
                         If man3eff <> 0 then
                                liman1.Add(man3eff.ToString())
                            End If
                    End If
            'MANICHINO L1 END


            'MANICHINO L2 START
            If btn20.TabIndex = mans.TabIndex
                man4eff = Man.Eff
                 cap4 = Man.mroto + Man.mbono
                If man4eff <> 0 then
                    liman2.Add(man4eff.ToString())
                End If
            End If

            If btn21.TabIndex = mans.TabIndex
                man5eff = Man.Eff
                cap5 = Man.mroto + Man.mbono
                If man5eff <> 0 then
                    liman2.Add(man5eff.ToString())
                End If
            End If

            If btn22.TabIndex = mans.TabIndex
                man6eff = Man.Eff
                cap6 = Man.mroto + Man.mbono
                If man6eff <> 0 then
                    liman2.Add(man6eff.ToString())
                End If
            End If

            'MANICHINO L2 END

            'MANICHINO L3 START
            If btn36.TabIndex = mans.TabIndex
                man7eff = Man.Eff
                cap7 = Man.mroto + Man.mbono
                If man7eff <> 0 then
                    liman3.Add(man7eff.ToString())
                End If
            End If

            If btn37.TabIndex = mans.TabIndex
                man8eff = Man.Eff
               cap8 = Man.mroto + Man.mbono
                If man8eff <> 0 then
                    liman3.Add(man8eff.ToString())
                End If
            End If

            If btn38.TabIndex = mans.TabIndex
                man9eff = Man.Eff
                cap9 = Man.mroto + Man.mbono
                If man9eff <> 0 then
                    liman3.Add(man9eff.ToString())
                End If
            End If

            'MANICHINO L3 END

                     m1 = CSng(Math.Round(((man1eff + man2eff + man3eff) / CSng(liman1.Count)), 0))
                     m2 = CSng(Math.Round(((man4eff + man5eff + man6eff) / CSng(liman2.Count)), 0))
                     m3 = CSng(Math.Round(((man7eff + man8eff + man9eff) / CSng(liman3.Count)), 0))

                      lblMan1.Text = "MANICHINO L1" & " " & m1 & "%"
                      lblMan2.Text = "MANICHINO L2" & " " & m2 & "%"
                      lblMan3.Text = "MANICHINO L3" & " " & m3 & "%"
            
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
                    mans.BorderColor = Color.green
                    mans.BackColor = Color.LimeGreen
                    mans.ForeColor = Color.White
                End If
                If Man.Eff > 0 Then
                    mans.Text = Man.Eff.ToString() & "%"
                Else
                    mans.Text = String.Empty
                End If
            End If
        Next
                                If (m1 > 0 AndAlso m1 <= 69.5) Then
                                        MANICHINO_LINEA1.CssClass = "red-title"
                                        lblMan1.ForeColor = Color.white
                                ElseIf (m1 > 69.5 AndAlso m1 <= 89.5) Then
                                    MANICHINO_LINEA1.CssClass = "yellow-title"
                                    lblMan1.ForeColor = Color.black
                                ElseIf (m1 > 89.5) Then
                                    MANICHINO_LINEA1.CssClass = "green-title"
                                    lblMan1.ForeColor = Color.white
                                ElseIf m1 <= 0 Then
                                    MANICHINO_LINEA1.BackColor = Color.Silver
                                    lblMan1.ForeColor = Color.white
                                End If

                                If (m2 > 0 AndAlso m2 <= 69.5) Then
                                        MANICHINO_LINEA2.CssClass = "red-title"
                                        lblMan2.ForeColor = Color.white
                                ElseIf (m2 > 69.5 AndAlso m2 <= 89.5) Then
                                    MANICHINO_LINEA2.CssClass = "yellow-title"
                                    lblMan2.ForeColor = Color.black
                                ElseIf (m2 > 89.5) Then
                                    MANICHINO_LINEA2.CssClass = "green-title"
                                    lblMan2.ForeColor = Color.white
                                ElseIf m2 <= 0 Then
                                    MANICHINO_LINEA2.BackColor = Color.Silver
                                    lblMan2.ForeColor = Color.white
                                End If

                                If (m3 > 0 AndAlso m3 <= 69.5) Then
                                        MANICHINO_LINEA3.CssClass = "red-title"
                                        lblMan3.ForeColor = Color.white
                                ElseIf (m3 > 69.5 AndAlso m3 <= 89.5) Then
                                    MANICHINO_LINEA3.CssClass = "yellow-title"
                                    lblMan3.ForeColor = Color.black
                                ElseIf (m3 > 89.5) Then
                                    MANICHINO_LINEA3.CssClass = "green-title"
                                    lblMan3.ForeColor = Color.white
                                ElseIf m3 <= 0 Then
                                    MANICHINO_LINEA3.BackColor = Color.Silver
                                    lblMan3.ForeColor = Color.white
                                End If

        If _modEff = 3 Then ' BTN CAPI
            For Each mans As Button In _manichinoColleciton
                GetManichinoInfo(mans.TabIndex.ToString()) 
                'GET CAPI FOR MANICHINO Each butt
                mans.Text = Man.Qty.ToString() & "/" & Man.Norm.ToString()
            Next

            Dim btn1IntCapi As Single
            Dim btn2IntCapi As Single
            Dim btn3IntCapi As Single
            btn1IntCapi = cap1 + cap2 + cap3
            btn2IntCapi = cap4 + cap5 + cap6
            btn3IntCapi = cap7 + cap8 + cap9

            lblMan1.Text = "MANICHINO L1" & " " & "Σ=" & btn1IntCapi
            lblMan2.Text = "MANICHINO L2" & " " & "Σ=" & btn2IntCapi
            lblMan3.Text = "MANICHINO L3" & " " & "Σ=" & btn3IntCapi

        End If

     
    End Sub

    Private Sub ColorByEfficiency()
        Dim newMac = 0
        Dim newSim As New Button

        Dim efc As Single = 0
        Dim cappi As Single = 0

        SummTotalEffByLine(l1, PIEGO_LINEA1, lblPg1, newSim, newMac, efc)
        SummTotalEffByLine(l2, PRESSA_LINEA1, lblPress1, newSim, newMac, efc)
        SummTotalEffByLine(l3, RAMMENDO_LINEA1, lblRam1, newSim, newMac, efc)
        SummTotalEffByLine(l5, ETICHETTE_LINEA1, lblEt1, newSim, newMac, efc)

        SummTotalEffByLine(l6, PIEGO_LINEA2, lblPg2, newSim, newMac, efc)
        SummTotalEffByLine(l7, PRESSA_LINEA2, lblPress2, newSim, newMac, efc)
        SummTotalEffByLine(l8, RAMMENDO_LINEA2, lblRam2, newSim, newMac, efc)
        SummTotalEffByLine(l10, ETICHETTE_LINEA2, lblEt2, newSim, newMac, efc)

        SummTotalEffByLine(l11, PIEGO_LINEA3, lblPg3, newSim, newMac, efc)
        SummTotalEffByLine(l12, PRESSA_LINEA3, lblPress3, newSim, newMac, efc)
        SummTotalEffByLine(l13, RAMMENDO_LINEA3, lblRam3, newSim, newMac, efc)
        SummTotalEffByLine(l15, ETICHETTE_LINEA3, lblEt3, newSim, newMac, efc)

        For Each iPanel As Panel In _pnFullGroup
            For Each o As Object In iPanel.Controls

                Dim simulator = TryCast(o, Button)
                If simulator IsNot Nothing Then
                    NewMethod(_totalEfficiency, _totalMac, efc, simulator)
                End If
            Next
        Next
    End Sub

    Private Sub NewMethod(ByRef totEff As Single, ByRef mac As Integer, ByRef efc As Single, ByRef simulator As Button)
        If simulator.TabIndex > 0 Then
            efc = GetEficiencyDetails(simulator.TabIndex.ToString(), _eff)
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
                        .BorderColor = Color.YellowGreen
                    ElseIf (efc > 89.5) Then
                        mac = mac + 1
                        .BackColor = Color.LimeGreen
                        .ForeColor = Color.White
                        .BorderColor = Color.green
                    End If
                End If
            End With

            Dim strLine As String = String.Empty
            If efc > 0 Then
                simulator.Text = efc.ToString() & "%"
            Else
                simulator.Text = String.Empty
            End If
            totEff = totEff + efc
            SummTotalEfficiency(totEff, mac, lblTotEfficiency)
        End If
    End Sub

    Shared _checker As Boolean

    Public Sub Buttons_Click(sender As Object, e As EventArgs)
          If _eff.Columns.Count <= 1
            _eff = Efficiency_Procedure_Stiro
        End If
                ModalPanel.Visible = True

        If sender.Backcolor = Color.White Then
            Exit Sub
        End If

      

        _manichinoColleciton = {btn4, btn5, btn6, btn20, btn21, btn22, btn36, btn37, btn38}
        Dim sdhgg = From button In _manichinoColleciton Where button.BorderWidth = 5 Select button
        If sdhgg.Any() Then
            sdhgg.Single().BorderWidth = 1
        End If

        For Each iPanel As Panel In _pnFullGroup
            Dim sdhg = From button In iPanel.Controls.OfType(Of Button) Where button.BorderWidth = 5 Select button

            If sdhg.Any() Then
                sdhg.Single().BorderWidth = 1
                Exit For
            End If
        Next

        sender.BorderWidth = 3

        GetPropertiesDetails(sender.TabIndex.ToString())


            lblName.Text = Inform(Leng).Name.ToString()
            lblCode.Text = Inform(Leng).Masina.ToString()
            lblArticole.Text = Inform(Leng).Articole.ToString()
            lblPhase.Text = Inform(Leng).Faza.ToString()
            lblTempo.Text =  Inform(Leng).Time.ToString()
            lblQty.Text =  Inform(Leng).Qty.ToString()
            lblNorm.Text =  Inform(Leng).Norm.ToString()

        _checker = False
    End Sub

    Public Sub Buttons_Hover()
        Try
        For Each p As Panel In _pnFullGroup

            For Each obj As Object In p.Controls
                Dim btn = TryCast(obj, Button)

                If btn IsNot Nothing Then
                    GetPropertiesDetails(btn.TabIndex.ToString())
                    With Inform(Leng)
                        btn.Attributes("title") = .Name
                    End With
                End If
            Next

            For Each mans As Button In _manichinoColleciton
                GetManichinoInfo(mans.TabIndex.ToString())
                mans.Attributes("title") = Man.Name
            Next
        Next
        Catch ex As Exception
            Exit Sub
        End Try
    End Sub

    Private Property Obj As Object

    Private Sub FilterBtnByColors(sender As Object, e As EventArgs) Handles btn_zuto.Click, btn_zeleno.Click, btn_crveno.Click
        _modEff = 1
        ColorByManichino()
        ColorByEfficiency()

        Dim castedBtn = TryCast(sender, Button)

        For Each p As Panel In _pnFullGroup
            For Each obj As Object In p.Controls
                Dim btn = TryCast(obj, Button)

                If btn IsNot Nothing Then
                    If castedBtn.BackColor <> btn.BackColor Then
                        btn.BackColor = Color.White
                        btn.BorderColor = Color.DodgerBlue
                        btn.Text = ""
                    Else
                        btn.BackColor = castedBtn.BackColor
                        btn.BorderColor = castedBtn.BackColor
                    End If
                End If
            Next
        Next

        For Each r As Panel In _pnGroup
            For Each obj As Object In r.Controls
                Dim btn = TryCast(obj, Button)
                If btn IsNot Nothing Then
                    If castedBtn.BackColor <> btn.BackColor Then
                        btn.BackColor = Color.White
                        btn.BorderColor = Color.DodgerBlue
                        btn.Text = ""
                    Else
                        btn.BackColor = castedBtn.BackColor
                        btn.BorderColor = castedBtn.BackColor
                    End If
                End If
            Next
        Next
    End Sub

    Private Sub FilterAssent(sender As Object, e As EventArgs) Handles btn_assenteismo.Click
        _modEff = 1
        ColorByEfficiency()
        ColorByManichino()
        GetMembersOffline()

        For Each p As Panel In _pnFullGroup
            For Each obj As Object In p.Controls
                Dim btn = TryCast(obj, Button)
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

        For Each r As Panel In _pnGroup
            For Each obj As Object In r.Controls
                Dim btn = TryCast(obj, Button)
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

    Public Sub Cancel_Click(sender As Object, e As EventArgs)
        lblfasechecker.Text = String.Empty
        Controls.Remove(ModalPanel)
        dgv1.Columns.Clear()
        dgv1.Controls.Clear()
        dgv1.Dispose()
    End Sub

    Public Sub Cancel1_click(sender As Object, e As EventArgs)
       btn_close_intervali.Enabled=True
       lblfasechecker.Text = String.Empty
       modalintervali.Visible = False
        _eff.Clear()
        _eff = Efficiency_Procedure_Stiro()
    End Sub


    Public Sub ButtonsMan_Click(sender As Object, e As EventArgs)

        _manichinoColleciton = {btn4, btn5, btn6, btn20, btn21, btn22, btn36, btn37, btn38}
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
        lblNorm.Text = Man.Norm.ToString()
        lblQty.Text = "Rotto:" & " " & Man.mroto & " " & "Buono:" & " " & Man.mbono
        lblPhase.Text = Man.Fase
        lblTempo.Text = Man.Time.ToString()
        ModalPanel.Visible = True
        _checker = True

                If Page.IsPostBack = True OrElse Page.IsAsync=True then
         For each row As DataRow In _dtVerifyFase.Rows
            If lblName.Text.Equals(row.Item(0)) then
                lblfasechecker.Text = "Default:" & " " & row.Item(1).ToString()
            End If
        Next
            end if
    End Sub
    Dim pInactiv As Single

    Private Sub SummTotalEfficiency(sngEff As Single, machines As Integer, lbl As Label)
        Dim totalEfficiency As Single = 0

        'arithmetical value
        Dim totEffFirst As Single = (sngEff / machines)
        totalEfficiency = CSng(Math.Round(totEffFirst, 0)) '%
        lbltoteffstiro.Text = totalEfficiency.ToString()
        Dim strBuild As New StringBuilder
        strBuild.AppendLine("Stiro eff = " & totalEfficiency.ToString())
        ColorTotalEffLabel(totalEfficiency, lbl)

    
            'GetMembersOffline()
      
        

        Dim totalEfficiencyAss As Single = 0
        Dim totEffFirstAss As Single = (sngEff / (machines +  pInactiv))
        totalEfficiencyAss = CSng(Math.Round(totEffFirstAss,0))

        'Dim lbl1 As New Label
        lbl.Text = strBuild.ToString() & "%"
        lbl1.Text = "Current Efficiency: " & totalEfficiency & "%"

        If totalEfficiency < 69
            lbl_total_eff_text_Stiro.ForeColor = Color.Red
            lbl_total_eff_value_Stiro.ForeColor = Color.Red
        ElseIf totalEfficiency > 69 And totalEfficiency < 89
            lbl_total_eff_text_Stiro.ForeColor = Color.Yellow
            lbl_total_eff_value_Stiro.ForeColor = Color.Yellow
        ElseIf totalEfficiency > 89
            lbl_total_eff_text_Stiro.ForeColor = Color.YellowGreen
            lbl_total_eff_value_Stiro.ForeColor = Color.YellowGreen
        End If

        If totalEfficiencyAss < 69
            lbl_total_ass_text_Stiro.ForeColor = Color.Red
            lbl_total_ass_value_Stiro.ForeColor = Color.Red
        ElseIf totalEfficiencyAss > 69 And totalEfficiency < 89
            lbl_total_ass_text_Stiro.ForeColor = Color.Yellow
            lbl_total_ass_value_Stiro.ForeColor = Color.Yellow
        ElseIf totalEfficiencyAss > 89
            lbl_total_ass_text_Stiro.ForeColor = Color.YellowGreen
            lbl_total_ass_value_Stiro.ForeColor = Color.YellowGreen
        End If
        lbl_total_eff_text_Stiro.Text =  "Efficienza prezenti:" & " " & totalEfficiency.ToString() & "%"
        lbl_total_ass_text_Stiro.Text =  "Efficienza assenti:" & " "  & totalEfficiencyAss.ToString() & "%"

        Page.Title = "Stiro = " + totalEfficiency.ToString() & "%"
    End Sub

    Private Sub SummTotalEffByLine(p As Panel, pnTit As Panel, lblPresentEff As Label, btn As Button, n As Integer, efc As Single)
        Dim e As Single
        Dim totEff As Single = 0
        Dim totCappi As Single = 0

        For Each obj As Object In p.Controls
            btn = TryCast(obj, Button)
            If btn IsNot Nothing Then
                efc = GetEficiencyDetails(btn.TabIndex.ToString(), _eff)
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
                e = e + efc
            End If

            totEff = e / n
            totEff = CSng(Math.Round(totEff, 0))

            If Double.IsInfinity(totEff) Then
                totEff = 100
            End If

            If Double.IsNaN(totEff) Then
                totEff = 0
            End If

            If totEff > 200 Then
                totEff = 100
            End If

            If pnTit.ID.ToString() = "PIEGO_LINEA1" Then
                pnTit.ID = "PIEGO L1"
            End If

            If pnTit.ID.ToString() = "PIEGO_LINEA2" Then
                pnTit.ID = "PIEGO L2"
            End If

            If pnTit.ID.ToString() = "PIEGO_LINEA3" Then
                pnTit.ID = "PIEGO L3"
            End If

            If pnTit.ID.ToString() = "PRESSA_LINEA1" Then
                pnTit.ID = "PRESSA L1"
            End If

            If pnTit.ID.ToString() = "PRESSA_LINEA2" Then
                pnTit.ID = "PRESSA L2"
            End If

            If pnTit.ID.ToString() = "PRESSA_LINEA3" Then
                pnTit.ID = "PRESSA L3"
            End If

            If pnTit.ID.ToString() = "RAMMENDO_LINEA1" Then
                pnTit.ID = "RAMMENDO L1"
            End If

            If pnTit.ID.ToString() = "RAMMENDO_LINEA2" Then
                pnTit.ID = "RAMMENDO L2"
            End If

            If pnTit.ID.ToString() = "RAMMENDO_LINEA3" Then
                pnTit.ID = "RAMMENDO L3"
            End If

            If pnTit.ID.ToString() = "ETICHETTE_LINEA1" Then
                pnTit.ID = "ETICHETTE L1"
            End If

            If pnTit.ID.ToString() = "ETICHETTE_LINEA2" Then
                pnTit.ID = "ETICHETTE L2"
            End If

            If pnTit.ID.ToString() = "ETICHETTE_LINEA3" Then
                pnTit.ID = "ETICHETTE L3"
            End If

            Dim pp = ""
            Dim pt = ""
            Dim ass = ""
            Dim sat As Integer
            sat = DateTime.Now.Hour

            If _modEff = 1 Then ' BTN EFF
                lblPresentEff.Text = pnTit.ID.ToString() & " " & totEff.ToString() & "%"
                If totEff > 200 Then
                    totEff = 100
                End If
            End If

            If _modEff = 2 Then
                lblPresentEff.Text = pnTit.ID.ToString() & " " & totEff.ToString() & "%"
            End If

            If _modEff = 3 Then
                lblPresentEff.Text = pnTit.ID.ToString() & " " '& cappitot
            End If
        Next

        If (totEff > 0 AndAlso totEff <= 69.5) Then
            pnTit.CssClass = "red-title"
            lblPresentEff.ForeColor = Color.white

        ElseIf (totEff > 69.5 AndAlso totEff <= 89.5) Then
            pnTit.CssClass = "yellow-title"
            lblPresentEff.ForeColor = Color.black
        ElseIf (totEff > 89.5) Then
            pnTit.CssClass = "green-title"
            lblPresentEff.ForeColor = Color.white
        ElseIf totEff <= 0 Then
            pnTit.BackColor = Color.Silver
            lblPresentEff.ForeColor = Color.white

        End If
    End Sub

    Private Sub ColorTotalEffLabel(value As Single, lbl As Label)
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

    Public Sub LoadDataTable(dt As DataTable)
        dt.Clear()
        Dim theCommand As New SqlCommand("spDailyWorkStiroTest", _myConnection)
        theCommand.CommandType = CommandType.StoredProcedure
        theCommand.Parameters.AddWithValue("@datew", _dt_Start)

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

        Dim dr As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.SequentialAccess)
        dt.Load(dr)
        dr.Close()
        theCommand = Nothing

        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        dt.Dispose()
    End Sub

    Public Sub Efficiency_Procedure()
        
        _eff.Clear()
        Dim dtStart As String

        dtStart = FormatDateTime(DateTime.Today)

        Dim cmd As New SqlCommand("spEfficiencyStiro", _myConnection)

        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@startTime", SqlDbType.DateTime).Value = dtStart
        cmd.Parameters.Add("@stopTime", SqlDbType.DateTime).Value = dtStart

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


    End Sub

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
        Dim colTable As DataTable = _dataSet.Tables.Add("HRPROD")
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

    'Dim sat As Int32 = DateTime.Now.Hour
    'OVO JE PO OSOBAMA
    Public Sub Strasnafunkcija(sender As Object, e As GridViewRowEventArgs)

        If DateTime.Now.Hour < 15 Then
            For i = 5 To 10
                e.Row.Cells(i).Visible = False
            Next

            For i = 22 To 28
                e.Row.Cells(i).Visible = False
            Next
        End If

        If DateTime.Now.Hour >= 15 Then
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
            e.Row.Attributes.Add("style", "background-color: gray;border-color: silver;font-size: medium; color:white;")            
        End If
        'ETICHETE COMP
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzEtcomp" Then
            e.Row.Cells(1).Text = "ET.Comp Totale:"
            e.Row.Attributes.Add("style","background-color: gray;border-color: silver;font-size: medium; color:white;")
        End If
        'MANICHINO 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzMan" Then
            e.Row.Cells(1).Text = "Manichino Totale:"
            e.Row.Attributes.Add("style","background-color: gray;border-color: silver;font-size: medium; color:white;")
        End If
        'RAMMENDO 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzRam" Then
            e.Row.Cells(1).Text = "Rammendo Totale:"
            e.Row.Attributes.Add("style","background-color: gray;border-color: silver;font-size: medium; color:white;")
        End If

        'PRESSA 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzPre" Then
            e.Row.Cells(1).Text = "Pressa Totale:"
            e.Row.Attributes.Add("style","background-color: gray;border-color: silver;font-size: medium; color:white;")
        End If

        'PIEGO 
        e.Row.Cells(0).Attributes.Add("style", "text-align:center;")
        If e.Row.RowIndex > -1 And e.Row.Cells(1).Text = "zzPie" Then
            e.Row.Cells(1).Text = "Piego Totale:"
            e.Row.Attributes.Add("style","background-color: gray;border-color: silver;font-size: medium; color:white;")
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
    
     Public sub Intervali_choser() Handles cal_button.Click
        Dim turno As Integer = Convert.ToInt32(cal_turno1.SelectedValue)
        intervali_current_turno.Text = "Turno: " & turno.ToString()

        If cal_intervali.Text <> String.Empty
            _dt_Start = Convert.ToDateTime(cal_intervali.Text)
            Else
            _dt_Start = DateTime.now
        End If
        
        intervali_current_date.Text = "Date: " & _dt_Start.ToShortDateString()
        If turno = 1
            sat = 8
        End If

        If turno = 2
            sat = 16
        End If

        PrimaTurno_Click(Nothing,Nothing)

     End sub

      Public Function Daily_Work_Stiro As DataTable


        Dim dt As New DataTable

        If sat < 15 Then
                Dim theCommand As New SqlCommand("spDailyWorkStiroTurnoOne", _myConnection)
                theCommand.CommandType = CommandType.StoredProcedure
                theCommand.Parameters.AddWithValue("@datew", _dt_Start)

                If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

                Dim dr As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.SequentialAccess)
                dt.Load(dr)
                dr.Close()
                theCommand = Nothing

                If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

            End if

        If sat >= 15 Then
            
            Dim theCommand As New SqlCommand("spDailyWorkStiroTurnoTwo", _myConnection)
            theCommand.CommandType = CommandType.StoredProcedure
            theCommand.Parameters.AddWithValue("@datew", _dt_Start)

            If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

            Dim dr As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.SequentialAccess)
            dt.Load(dr)
            dr.Close()
            theCommand = Nothing

            If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        End If
        
        Return dt
    End Function
    Public Maineff As New DataTable


    'LOAD PER HOUR EACH PERSONA - NORMAL
    Private Sub LoadInfoByName()

        Dim tKey As String = String.Empty
        Dim line As String = String.Empty
        Dim name As String = String.Empty
        Dim phase As String = String.Empty
        Dim comm As String = String.Empty
        Dim art As String = String.Empty
        Dim qty = 0
        Dim hour = 0

        _mainTable.Clear()
        _mainTable = Daily_Work_Stiro

        Dim htbl As New Hashtable
        Dim index = 0

        LoadColumns()

        For Each row As DataRow In _mainTable.Rows

            line = row(0).ToString()
            name = row(3).ToString()
            phase = row(7).ToString()
            comm = row(4).ToString()
            art = row(5).ToString()
            qty = CInt(row.Item(11)) * CInt(row.Item(6))
            hour = CInt(row.Item(10))

            If name = Inform(Leng).Name Then
                tKey = name & phase & comm & art 'line & 

                If Not htbl.ContainsKey(tKey) Then
                    Dim newRow As DataRow = _dataSet.Tables("HRPROD").NewRow
                    newRow.Item(0) = line
                    newRow.Item(1) = name
                    newRow.Item(2) = phase
                    newRow.Item(3) = comm
                    newRow.Item(4) = art
                    newRow.Item(hour + 5) = qty
                    _dataSet.Tables("HRPROD").Rows.Add(newRow)
                    htbl.Add(tKey, index)
                    index = +1
                Else
                    Dim secRow = CInt(htbl(tKey))
                    Dim tot As Integer
                    _dataSet.Tables("HRPROD").Rows(secRow).Item(hour + 5) = tot + qty
                  
                End If
            End If
        Next

        _dtV = New DataView(_dataSet.Tables("HRPROD"))
        dgv1.DataSource = _dtV
        dgv1.DataBind()
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
    End Sub
    'LOAD PER HOUR MANICHINO
    Private Sub LoadInfoByNameMan()
        _mainTable.Clear()
        _mainTable = Daily_Work_Stiro

        Dim htbl As New Hashtable
        Dim index = 0
        LoadColumns()

        Dim tKey As String = String.Empty

        For Each row As DataRow In _mainTable.Rows
            Dim line As String = row(0).ToString()
            Dim name As String = row(3).ToString()
            Dim phase As String = row(7).ToString()
            Dim comm As String = row(4).ToString()
            Dim art As String = row(5).ToString()
            Dim qty As Integer = CInt(row.Item(11)) * CInt(row.Item(6))
            Dim hour = CInt(row.Item(10))

            Dim lng As Integer
            ReDim _tmpJobs(lng)
            _tmpJobs(lng).TimpJ = NullJ()
            _tmpJobs(lng).QtyJ = NullJ()
            _tmpJobs(lng).BphJ = NullJ()

            Dim bphxTl As Single = NullJ()
            Dim qtyxTl As Single = NullJ()
            Dim effGlobalJ As Single = NullJ()
            Dim medGlobalJ As Single = NullJ()

            If name = Man.Name AndAlso (row(14)) = "2" Then
                tKey = name ' & phase '& comm & art 'line & 

                If Not htbl.ContainsKey(tKey) Then
                    Dim newRow As DataRow = _dataSet.Tables("HRPROD").NewRow
                    newRow.Item(0) = line
                    newRow.Item(1) = name
                    newRow.Item(2) = phase
                    newRow.Item(3) = comm
                    newRow.Item(4) = art
                    newRow.Item(hour - 1) = qty
                    _dataSet.Tables("HRPROD").Rows.Add(newRow)
                    htbl.Add(tKey, index)
                    index = +1
                Else
                    Dim secRow = CInt(htbl(tKey))
                    Dim tot As Integer

                    _dataSet.Tables("HRPROD").Rows(secRow).Item(hour + 5) = tot + qty
                End If
            End If
        Next

        _dtV = New DataView(_dataSet.Tables("HRPROD"))
        dgv1.DataSource = _dtV
        dgv1.DataBind()
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showsecondpage();", True)
    End Sub

    Public Sub ShowDetailedStats_Click(sender As Object, e As EventArgs)
        ModalPanel.Visible = True

        If _checker = False Then
            GetPropertiesDetails(Inform(Leng).Masina.ToString())
            LoadInfoByName()
        End If

        If _checker = True Then
            LoadInfoByNameMan()
        End If
    End Sub

    'ASSENTEISMO GRID DATA BOUND
    Protected Sub Assent_DataBound(sender As Object, e As GridViewRowEventArgs)

        e.Row.Cells(0).Visible = false
        e.Row.Cells(1).Visible = False

        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(2).Text = "Name"
            e.Row.Cells(3).Text = "Phase"
            e.Row.Cells(4).Text = "Turno"

         End If
    End Sub

        Dim satStart  As Int32
        Dim satEnd As Int32

    Public Sub PrimaTurno_Click(sender As Object, e As EventArgs) Handles btn_report.Click
       
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
        Dim idrealizar As String = String.Empty
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
                qtyMan = CSng(row.Item(8)) * CInt(row.Item(9))
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
                    If  totRowEt.Item(hour + 5) Is DBNull.Value Then
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
        lbl_et_copp_tot.Text =  sumEtt.ToString()
        totRowEt.Item("Sorting") = 1
        _dataSet.Tables("HRPROD").Rows.Add(totRowEt)


        'Etichete Totale - Row add
        totRowEtcomp.Item(1) = "zzEtcomp"
        totRowEtcomp.Item("EachTotale") = sumEttcomp
        lbl_et_comp_tot.Text =  sumEttcomp.ToString()
        totRowEtcomp.Item("Sorting") = 2
        _dataSet.Tables("HRPROD").Rows.Add(totRowEtcomp)

        'Manichino Totale - Row add
        totRowMan.Item(1) = "zzMan"
        totRowMan.Item("EachTotale") = sumMan
        lbl_et_manichino_tot.Text =  sumMan.ToString()
        totRowMan.Item("Sorting") = 3
        _dataSet.Tables("HRPROD").Rows.Add(totRowMan)

        'Rammendo Totale - Row add
        totRowRam.Item(1) = "zzRam"
        totRowRam.Item("EachTotale") = sumRam
        lbl_et_rammendo_tot.Text =  sumRam.ToString()
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
        lbl_et_piego_tot.Text =  sumPie.ToString()
        totRowPie.Item("Sorting") = 6
        _dataSet.Tables("HRPROD").Rows.Add(totRowPie)


        _dtV = New DataView(_dataSet.Tables("HRPROD"))
        _dtV.Sort = "Sorting Asc, Phase Desc, name Asc, line Asc"
        _dataSet.Tables("HRPROD").Columns.Remove("Sorting")
        gv_intervali.DataSource = _dtV
        gv_intervali.DataBind()

        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "showintervali();", True)
        modalintervali.Visible = True

    End Sub



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
        Dim idrealizar As String = String.Empty
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
                qtyMan = CSng(row.Item(8)) * CInt(row.Item(9))
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

                Dim jobQty As Single = CSng(IIf(IsDBNull(jRow.Item(8)), 0, CSng(jRow.Item(8))))
                Dim jobClick As Single = CSng(IIf(IsDBNull(jRow.Item(9)), 0, CSng(jRow.Item(9))))

                _tmpJobs(lng).QtyJ = jobQty * jobClick
                _tmpJobs(lng).BphJ = CSng(jRow.Item(7))

                bphxTl += Csng(_tmpJobs(lng).QtyJ / _tmpJobs(lng).BphJ)
                qtyxTl += CSng(_tmpJobs(lng).QtyJ)

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
                minJ = CInt(NullJ())
            End If
        Else
            minJ = CInt(decimalJ * 60)
        End If
        ReturnHourJ = Format(hourJ, "0") & ":" & Format(minJ, "00")  'decimal to string converter 
    End Function
    'EXPORT PDF
    Protected Sub ExportToPdf(sender As Object,e As EventArgs)
        Using sw As New StringWriter()
            Using hw As New HtmlTextWriter(sw)

                If Page.IsPostBack = False Then
                 btnintervali_Click(sender, e)
                End If

                gv_intervali.RenderControl(hw)
                Dim sr As New StringReader(sw.ToString())
                Dim pdfDoc As New Document(PageSize.A1, 2.0F, 2.0F, 2.0F, 0.0F)
                Dim htmlparser As New HTMLWorker(pdfDoc)
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
                pdfDoc.Open()
                pdfDoc.NewPage()
                htmlparser.Parse(sr)
                pdfDoc.Close()

                Dim day As String = DateTime.Now.Day.ToString()
                Dim mounth As String = DateTime.Now.Month.ToString()
                Dim year As String = DateTime.Now.Year.ToString()

                Dim satt As String = DateTime.Now.Hour.ToString()
                Dim min As String = DateTime.Now.Minute.ToString()


                Dim s As String = "Stiro Intervals" + " " + day + "." + mounth + "." + year + " " + " " + satt + "h" +
                                  min + "min"

                Response.ContentType = "application/pdf"
                Response.AddHeader("content-disposition", "attachment;filename=" & " " & s & ".pdf")
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Write(pdfDoc)
                Response.End()
            End Using
        End Using
    End Sub
    'EXPORT EXCEL
    Protected Sub ExportToExcel(sender As Object,e As EventArgs)
        Response.Clear()
        Response.Buffer = True

        Dim day As String = DateTime.Now.Day.ToString()
        Dim mounth As String = DateTime.Now.Month.ToString()
        Dim year As String = DateTime.Now.Year.ToString()

        Dim sat As String = DateTime.Now.Hour.ToString()
        Dim min As String = DateTime.Now.Minute.ToString()


        Dim s As String = "Stiro Intervals" + " " + day + "." + mounth + "." + year + " " + " " + sat + "h" + min + "min"

        Response.AddHeader("content-disposition", "attachment;filename=" & " " & s & ".xls")
        Response.AddHeader("Content-Type", "application/vnd.ms-excel")
        Response.Charset = "UTF-8"
        Response.ContentType = "application/vnd.ms-excel"

        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            'GridView1.AllowPaging = False
            If Page.IsPostBack = False Then
                btnintervali_Click(sender, e)
                PrimaTurno_Click(sender,e)
            End If

            gv_intervali.HeaderRow.BackColor = Color.CadetBlue
            For Each cell As TableCell In gv_intervali.HeaderRow.Cells
                cell.BackColor = gv_intervali.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In gv_intervali.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = gv_intervali.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = gv_intervali.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            gv_intervali.RenderControl(hw)
            'style to format numbers to string
            Dim style = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()
        End Using
    End Sub

    Public Sub BtnReparto_click(sender As Object, e As EventArgs)
        _modEff = 4

        Dim dtL1 As New DataTable
        Dim dtL2 As New DataTable
        Dim dtL3 As New DataTable
        Dim dtL4 As New DataTable
        Dim dtL5 As New DataTable
        Dim dtL6 As New DataTable

        Const query = "Select Line, LastName, FirstName, Fase from RepartoStiro where Line='L1'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd = New SqlCommand(query, _myConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        dtL1.Load(dr)
        cmd.Dispose()
        dr.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()


        Const query1 = "Select Line, LastName, FirstName, Fase from RepartoStiro where Line='L2'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd1 = New SqlCommand(query1, _myConnection)
        Dim dr1 As SqlDataReader = cmd1.ExecuteReader()
        dtL2.Load(dr1)
        cmd1.Dispose()
        dr1.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Const query2 = "Select Line, LastName, FirstName, Fase from RepartoStiro where Line='L3'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd2 = New SqlCommand(query2, _myConnection)
        Dim dr2 As SqlDataReader = cmd2.ExecuteReader()
        dtL3.Load(dr2)
        cmd2.Dispose()
        dr2.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Const query3 = "Select Line, LastName, FirstName, Fase from RepartoStiro where Line='L4'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd3 = New SqlCommand(query3, _myConnection)
        Dim dr3 As SqlDataReader = cmd3.ExecuteReader()
        dtL4.Load(dr3)
        cmd3.Dispose()
        dr3.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Const query4 = "Select Line, LastName, FirstName, Fase from RepartoStiro where Line='L5'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd4 = New SqlCommand(query4, _myConnection)
        Dim dr4 As SqlDataReader = cmd4.ExecuteReader()
        dtL5.Load(dr4)
        cmd4.Dispose()
        dr4.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Const query5 = "Select Line, LastName, FirstName, Fase from RepartoStiro where Line='L6'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd5 = New SqlCommand(query5, _myConnection)
        Dim dr5 As SqlDataReader = cmd5.ExecuteReader()
        dtL6.Load(dr5)
        cmd5.Dispose()
        dr5.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()


        For Each row As DataRow In dtL1.Rows
            If row(0).ToString().Equals("L1") Then
                _dtV = New DataView(dtL1)
                dgv_l1.DataSource = _dtV
                dgv_l1.DataBind()
            End If
        Next

        For Each row As DataRow In dtL2.Rows
            If row(0).ToString() = "L2" Then
                Dim _dtV1 As DataView = New DataView(dtL2)
                dgv_l2.DataSource = _dtV1
                dgv_l2.DataBind()
            End If
        Next

        For Each row As DataRow In dtL3.Rows
            If row(0).ToString() = "L3" Then
                Dim _dtV2 As DataView = New DataView(dtL3)
                dgv_l3.DataSource = _dtV2
                dgv_l3.DataBind()
            End If
        Next

        For Each row As DataRow In dtL4.Rows

            If row(0).ToString() = "L4" Then
                Dim _dtV3 As DataView = New DataView(dtL4)
                dgv_l4.DataSource = _dtV3
                dgv_l4.DataBind()
            End If
        Next

        For Each row As DataRow In dtL5.Rows

            If row(0).ToString() = "L5" Then
                Dim _dtV4 As DataView = New DataView(dtL5)
                dgv_l5.DataSource = _dtV4
                dgv_l5.DataBind()
            End If
        Next

        For Each row As DataRow In dtL6.Rows
            If row(0).ToString() = "L6" Then
                Dim _dtV5 As DataView = New DataView(dtL6)
                dgv_l6.DataSource = _dtV5
                dgv_l6.DataBind()
            End If
        Next

        'lblTime.Visible = False
        pnlglavni.Visible = False
        pnlReparto.Visible = True
    End Sub

    Public Sub Reparto_Bound_gv1(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Linea"
            e.Row.Cells(1).Text = "Cognome"
            e.Row.Cells(2).Text = "Nome"
            e.Row.Cells(3).Text = "Fase"
        End If

        If e.Row.RowIndex = 0 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 6 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 7 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 10 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If
    End Sub

    Public Sub Reparto_Bound_gv2(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Linea"
            e.Row.Cells(1).Text = "Cognome"
            e.Row.Cells(2).Text = "Nome"
            e.Row.Cells(3).Text = "Fase"
        End If

        If e.Row.RowIndex = 0 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 5 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 7 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 10 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If
    End Sub

    Public Sub Reparto_Bound_gv3(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Linea"
            e.Row.Cells(1).Text = "Cognome"
            e.Row.Cells(2).Text = "Nome"
            e.Row.Cells(3).Text = "Fase"
        End If

        If e.Row.RowIndex = 0 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 5 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 7 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 10 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If
    End Sub

    Public Sub Reparto_Bound_gv4(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Linea"
            e.Row.Cells(1).Text = "Cognome"
            e.Row.Cells(2).Text = "Nome"
            e.Row.Cells(3).Text = "Fase"
        End If

        If e.Row.RowIndex = 0 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 6 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 8 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 11 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If
    End Sub

    Public Sub Reparto_Bound_gv5(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Linea"
            e.Row.Cells(1).Text = "Cognome"
            e.Row.Cells(2).Text = "Nome"
            e.Row.Cells(3).Text = "Fase"
        End If

        If e.Row.RowIndex = 0 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 4 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 6 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 9 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If
    End Sub

    Public Sub Reparto_Bound_gv6(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.Cells(0).Text = "Linea"
            e.Row.Cells(1).Text = "Cognome"
            e.Row.Cells(2).Text = "Nome"
            e.Row.Cells(3).Text = "Fase"
        End If

        If e.Row.RowIndex = 0 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 6 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 8 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If

        If e.Row.RowIndex = 11 Then
            e.Row.Attributes.Add("style", "border-bottom:#1a65a5; border-bottom-width:2px")
        End If
    End Sub

    Shared ReadOnly _dtVerifyFase As New DataTable

    Private Sub VeriftyFase()
        _dtVerifyFase.Clear()

        Const q = "select Name, Lavoro, IdSector from Organizator where active='true' and lavoro <> 'Capolinea' and idsector='2'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd = New SqlCommand(q, _myConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        _dtVerifyFase.Load(dr)
        dr.Close()
        cmd.Dispose()

        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub


    'VERIFY
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub

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
    Dim tblPauza As new DataTable

    'Private Sub LoadBreakTable()
    '    tblPauza.Clear()
    '    _MyConnection.Close()

    '    Dim query As String = "SELECT tblPause.newID, tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Angajati.Angajat,Angajati.Linie,Angajati.IdSector FROM tblPause INNER Join Realizari ON tblPause.IdRealization = Realizari.Id inner join Angajati ON Realizari.IdAngajat = Angajati.Id WHERE Day(tblPause.StartTime) = '" & DateTime.Now.Day & "' AND Month(tblPause.StartTime) = '" & DateTime.Now.Month & "' AND Year(tblPause.StartTime) = '" & DateTime.Now.Year & "' AND IdSector='2' "

    '    _MyConnection.Open()
    '    Dim myCommand As New SqlCommand(query, _MyConnection)
    '    Dim myDataReader As SqlDataReader = myCommand.ExecuteReader()
    '    tblPauza.Load(myDataReader)
    '    myDataReader.Close()
       
    '    'myCommand = Nothing
    '    _MyConnection.Close()

    '    MyDataSet.Reset()
 

    '    CreateColumns()

    '    For Each row As DataRow In tblPauza.Rows
    '        Dim id As Integer = CInt(row.Item(0))
    '        Dim tip As String = CStr(row.Item(1))
    '        Dim emp As String = CStr(row.Item(4))
    '        Dim line As String = CStr(row.Item(5))
    '        Dim duration As String = String.Empty
    '        Dim endP As String = String.Empty
    '        Dim drt As Double = 0           '//real duration

    '        Dim startTime As DateTime = CDate(row.Item(2))

    '        Dim endTime As DateTime
    '        If IsDBNull(row(3)) Then
    '            duration = "In pausa..."
    '            drt = 0
    '        Else
    '            endTime = CDate(row.Item(3))

    '            Dim ts As TimeSpan = endTime.Subtract(startTime)
    '            drt = ts.Minutes
    '            duration = Format(drt.ToString() & "min")
    '            endP = Format(endTime, "HH:mm") ' .AddHours(2)
    '        End If

    '        Dim actDate As String = Format(startTime, "dd.MM.yyyy")
    '        Dim startP As String = Format(startTime, "HH:mm") '.AddHours(2)

    '        Dim newRow As DataRow = MyDataSet.Tables("Pausa").NewRow
    '        With newRow
    '            .Item(0) = id           '//oreder by id
    '            .Item(1) = emp          '//employee
    '            .Item(2) = tip          '//pausa type
    '            .Item(3) = duration     '//endTime - startime
    '            .Item(4) = startP    '//pause startTime
    '            .Item(5) = endP         '//pause endTime
    '            .Item(6) = actDate      '//actuel date
    '            .Item(7) = CInt(drt)    '//invisible column for total amount of pause
    '            .Item(8) = line
    '            .Item(9) = Int32.Parse(line.Remove(0, 5))

    '        End With

    '        MyDataSet.Tables("Pausa").Rows.Add(newRow)
    '    Next

    '    'CONF B
    '    Dim linea1max As Int32 = 0
    '    Dim linea2max As Int32 = 0
    '    Dim linea3max As Int32 = 0


    '    ''LINEA 1
    '    'For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
    '    '    If row(9) = 1 And row(2) = "WC" Then
    '    '        linea1max = linea1max + 1
    '    '    End If
    '    'Next
    '    'wcline1.Text = "Linea 1" + " " + "=" + " " + linea1max.ToString()

    '    ''LINEA 2
    '    'For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
    '    '    If row(9) = 2 And row(2) = "WC" Then
    '    '        linea2max = linea2max + 1
    '    '    End If
    '    'Next
    '    'wcline2.Text = "Linea 2" + " " + "=" + " " +  linea2max.ToString()

    '    ''LINEA 3
    '    'For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
    '    '    If row(9) = 3 And row(2) = "WC" Then
    '    '        linea3max = linea3max + 1
    '    '    End If
    '    'Next
    '    'wcline3.Text = "Linea 3" + " " + "=" + " " + linea3max.ToString()
        
    'End Sub

    'Sub Main()
    '    ' Create a Task with AddressOf.
    '    Dim task = New Task(AddressOf ProcessDataAsync)
    '    ' Start and wait for task to end.
    '    task.Start()
    '    task.Wait()
    '    Console.ReadLine()
    'End Sub

    'Async Sub ProcessDataAsync()
    '    ' Create a task Of Integer.
    '    ' ... Use HandleFileAsync method with a large file.
    '    Dim task As Task(Of Integer) = HandleFileAsync("C:\enable1.txt")
    '    ' This statement runs while HandleFileAsync executes.
    '    Console.WriteLine("Please wait, processing")
    '    ' Use await to wait for task to complete.
    '    Dim result As Integer = Await task
    '    Console.WriteLine("Count: " + result.ToString())
    'End Sub

    'Async Function HandleFileAsync(ByVal file As String) As Task(Of Integer)
    '    Console.WriteLine("HandleFile enter")

    '    ' Open the file.
    '    Dim count As Integer = 0
    '    Using reader As StreamReader = New StreamReader(file)
    '        Dim value As String = Await reader.ReadToEndAsync()
    '        count += value.Length

    '        ' Do a slow computation on the file.
    '        For i = 0 To 10000 Step 1
    '            Dim x = value.GetHashCode()
    '            If x = 0 Then
    '                count -= 1
    '            End If

    '        Next
    '    End Using

    '    Console.WriteLine("HandleFile exit")
    '    Return count
    'End Function
End Class
