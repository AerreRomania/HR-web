Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Dashboard
    Inherits System.Web.UI.Page
    Dim _tblUsrFav As New DataTable
    ReadOnly _constr As String = ConfigurationManager.ConnectionStrings("NOYConnectionString").ConnectionString
    ReadOnly _myConnection2 As SqlConnection = New SqlConnection(_constr)
    Dim _tblAuth As New DataTable
    Dim _tblAuthActivated As New DataTable
    Dim _dtAllSoftModules As New DataTable
    ReadOnly _dtAllSoftParrents As New DataTable
    Dim _reqDt As New DataTable
    ReadOnly _fullListOfCheckboxes As New List(Of CheckBox)
    ReadOnly _fullListOfCheckboxesAccepted As New List(Of CheckBox)
    Dim _usrGuid As Integer
    Dim _usrID As Integer
    Dim clientService As ServiceReference1.WebServiceSoapClient = New ServiceReference1.WebServiceSoapClient
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        not_activated.Visible=False

        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        Else
            profil_username.Text = Page.User.Identity.Name

            GetPerrmissions()
            GetAllSoftModules()
            'Ucitava i poruke i online/offline usere - staviti u tajmer
            If Page.IsPostBack = False
                LoadUserProfile()
            End If

            GetNonActivatedUsers()
            'GetOnlineUsers()

            GenerateGroupOfCheckboxes()
            GenerateGroupOfControls()
            GenerateBookmars()
            'RECIVE MSG
            'GetReciveMessages()
        End If
        FileUpload1.Attributes("onchange") = "UploadFile(this)"

        'IF ACCOUNT DOES NOT HAVE ROLES FOR ALL MAIN APPS
        If riso.Attributes("class") = " disabled" And prod.Attributes("class") = " disabled" And cont.Attributes("class") = " disabled" And smart.Attributes("class") = " disabled" Then
            not_activated.Visible = True
            dbdpmenu.Visible = False
            reg_notification_control.Visible = False
            left_navi.Visible = False
            fav_list.Visible = False
        End If




    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        req_all.InnerText = req_userAll_drop_down.Items.Count
    End Sub

    Dim  Count As Int32 = 0
    'GENERATE - GROUP OF CHECKBOXES
    Public Sub GenerateGroupOfCheckboxes()

        With _fullListOfCheckboxes
            .Add(check_cont)
            .Add(check_prod)
            .Add(check_riso)
            .Add(check_smart)
            .Add(check_prod_tess)
            .Add(check_prod_conf)
            .Add(check_prod_lava)
            .Add(check_cont_prod)
            .Add(check_prod_sart)
            .Add(check_prod_stiro)
            .Add(check_cont_costi)
            .Add(check_cont_finanza)
            .Add(check_cont_personale)
            .Add(check_cont_prod)
            .Add(check_cont_situazione)
            .Add(check_cont_varie)
            .Add(check_cont_vendite)
            .Add(check_riso_chat)
            .Add(check_riso_database)
            .Add(check_riso_org)
            .Add(check_riso_scheda)
            .Add(check_riso_stat)
            .Add(check_riso_timb)
            .Add(check_smart_allarmi)
            .Add(check_smart_luci)
            .Add(check_smart_machine)
            .Add(check_smart_musica)
            .Add(check_smart_porte)
            .Add(check_smart_temp)

        End With

        
        With _fullListOfCheckboxesAccepted
            .Add(cbx_cont)
            .Add(cbx_prod)
            .Add(cbx_riso)
            .Add(cbx_smart)
            .Add(cbx_tess)
            .Add(cbx_conf)
            .Add(cbx_lava)
            .Add(cbx_prod_riso)
            .Add(cbx_sart)
            .Add(cbx_stiro)
            .Add(cbx_costi)
            .Add(cbx_finanza)
            .Add(cbx_personale)
            .Add(cbx_prod)
            .Add(cbx_sit_ech)
            .Add(cbx_varie)
            .Add(cbx_vend)
            .Add(cbx_chat_int)
            .Add(cbx_db)
            .Add(cbx_organigrami)
            .Add(cbx_scheda_dip)
            .Add(cbx_stat)
            .Add(cbx_timb)
            .Add(cbx_alarm)
            .Add(cbx_luci)
            .Add(cbx_machine)
            .Add(cbx_musica)
            .Add(cbx_porte)
            .Add(cbx_temp)
        End With

    End Sub

    Public Sub BindCheckControles()

        With _fullListOfCheckboxesAccepted
            .Add(cbx_cont)
            .Add(cbx_prod)
            .Add(cbx_riso)
            .Add(cbx_smart)
            .Add(cbx_tess)
            .Add(cbx_conf)
            .Add(cbx_lava)
            .Add(cbx_prod_riso)
            .Add(cbx_sart)
            .Add(cbx_stiro)
            .Add(cbx_costi)
            .Add(cbx_finanza)
            .Add(cbx_personale)
            .Add(cbx_prod)
            .Add(cbx_sit_ech)
            .Add(cbx_varie)
            .Add(cbx_vend)
            .Add(cbx_chat_int)
            .Add(cbx_db)
            .Add(cbx_organigrami)
            .Add(cbx_scheda_dip)
            .Add(cbx_stat)
            .Add(cbx_timb)
            .Add(cbx_alarm)
            .Add(cbx_luci)
            .Add(cbx_machine)
            .Add(cbx_musica)
            .Add(cbx_porte)
            .Add(cbx_temp)

        End With
    End Sub
    Dim fullListOfControls As New List(Of HtmlControl)

    'GENERATE - GROUP OF CONTROLS
    Public Sub GenerateGroupOfControls()

        

        With fullListOfControls
            '.Add(conf_eff)
            '.Add(conf_stat_di_prod)
            '.Add(conf_b_layout)
            '.Add(stiro_tablets)

            '.Add(stiro_clienti)
            '.Add(stiro_intervals)
            '.Add(stiro_commesse)
            '.Add(stiro_machines)
            '.Add(stiro_faze)
            '.Add(stiro_article)
            '.Add(stiro_eff)

            '.Add(conf_persons)
            '.Add(conf_eff_mens)
            '.Add(stiro_organigramma)
            '.Add(conf_clienti)
            '.Add(stiro_layout)
            '.Add(stiro_stat_di_prod)

            '.Add(conf_machines)
            '.Add(stiro_persons)
            '.Add(conf_a_layout)
            '.Add(conf_article)
            '.Add(conf_commesse)
            '.Add(conf_faze)

            '.Add(conf_tablets)
            '.Add(conf_intervali)
            '.Add(conf_organigramma)
            '.Add(stiro_eff_mens)

            '.Add(tess_clienti)
            '.Add(tess_articoli)
            '.Add(tess_commesse)
            '.Add(tess_fasi)
            '.Add(tess_dipendenti)
            '.Add(tess_machine)
            '.Add(tess_programma_programatori)
            '.Add(tess_programma_tessitura)
            '.Add(tess_sinotico)
            .Add(cont)

            .Add(prod)
            .Add(tess)
            .Add(conf)
            .Add(lava)
            .Add(sart)
            .Add(stiro)

            .Add(riso)
            .Add(riso_chat)
            .Add(riso_database)
            '.Add(riso_frame)
            .Add(riso_organigrammi)
            .Add(riso_scheda)
            .Add(riso_stat)
            .Add(riso_timb)

            .Add(smart)
            .Add(smart_porte)
            .Add(smart_luci)
            .Add(smart_temp)
            .Add(smart_allarmi)
            .Add(smart_machine)
            .Add(smart_musica)


        End With

        'DODATI GUIDEVE MODULIMA PRVO - DONE - TBL_ALL_SOFT_MODULES
        For Each conts As HtmlControl In fullListOfControls
            For Each row As DataRow In _dtAllSoftModules.Rows
                If conts.ID = row.Item(1) Then
                    conts.Attributes.Add("data-guid", row.Item(0).ToString())
                End If
            Next
        Next
        
        For Each row As DataRow In _dtAllSoftModules.Rows
            For Each conts As CheckBox In _fullListOfCheckboxes
                If conts.Attributes("data-name") = row.Item(1).ToString Then
                    conts.Attributes.Add("data-guid", row.Item(0).ToString())
                End If
            Next
             For Each conts As CheckBox In _fullListOfCheckboxesAccepted
                If conts.Attributes("data-name") = row.Item(1).ToString Then
                    conts.Attributes.Add("data-guid", row.Item(0).ToString())
                    'conts.Checked = True
                End If
            Next
        Next


        'UZETI I PROVERITI SVE DODATE PERMISIJE ZA TOG USERA - TBL_AUTH // ENABLE - DISABLE
        For Each conts As HtmlControl In fullListOfControls
            If _tblAuth.Rows.Count <> 0 Then

                For Each row As DataRow In _tblAuth.Rows
                    If conts.Attributes("data-guid") = row.Item(0).ToString Then
                        If conts.Attributes("data-link") Is Nothing Then
                            conts.Attributes.Add("class", "enabled")
                        Else
                            conts.Attributes.Add("class", "nekaKlasa enabled")
                            'conts.Attributes.Add("data-img", row.Item(6))
                        End If
                        Exit For
                    Else
                        conts.Attributes.Add("class", " disabled")
                        conts.Attributes.Add("class", conts.Attributes("class").Replace("nekaKlasa", ""))
                    End If
                Next
            Else
                conts.Attributes.Add("class", " disabled")
                conts.Attributes.Add("class", conts.Attributes("class").Replace("nekaKlasa", ""))
            End If
        Next
    End Sub
    'GENERATE - GROUP OF BOOKMARK CONTROLS
    Public Sub GenerateBookmars()
        LoadUserFavorites()

        Dim bmfullListOfControls As New List(Of HtmlControl)
        Dim bm_myControl1 As HtmlControl = CType(FindControl("bm_conf_eff"), HtmlControl)
        Dim bm_myControl2 As HtmlControl = CType(FindControl("bm_conf_stat_di_prod"), HtmlControl)
        Dim bm_myControl3 As HtmlControl = CType(FindControl("bm_conf_b_layout"), HtmlControl)
        Dim bm_myControl4 As HtmlControl = CType(FindControl("bm_stiro_tablets"), HtmlControl)
        'Dim bm_myControl5 As HtmlControl = CType(FindControl("bm_riso"), HtmlControl)
        Dim bm_myControl6 As HtmlControl = CType(FindControl("bm_stiro_clienti"), HtmlControl)
        Dim bm_myControl7 As HtmlControl = CType(FindControl("bm_stiro_intervals"), HtmlControl)
        Dim bm_myControl8 As HtmlControl = CType(FindControl("bm_stiro_commesse"), HtmlControl)
        Dim bm_myControl9 As HtmlControl = CType(FindControl("bm_stiro_machines"), HtmlControl)
        Dim bm_myControl10 As HtmlControl = CType(FindControl("bm_stiro_faze"), HtmlControl)
        Dim bm_myControl11 As HtmlControl = CType(FindControl("bm_stiro_article"), HtmlControl)
        Dim bm_myControl12 As HtmlControl = CType(FindControl("bm_stiro_eff"), HtmlControl)
        'Dim bm_myControl13 As HtmlControl = CType(FindControl("bm_stiro"), HtmlControl)
        'Dim bm_myControl14 As HtmlControl = CType(FindControl("bm_conf"), HtmlControl)
        'Dim bm_myControl15 As HtmlControl = CType(FindControl("bm_cont"), HtmlControl)
        Dim bm_myControl16 As HtmlControl = CType(FindControl("bm_conf_persons"), HtmlControl)
        'Dim bm_myControl17 As HtmlControl = CType(FindControl("bm_lava"), HtmlControl)
        Dim bm_myControl18 As HtmlControl = CType(FindControl("bm_conf_eff_mens"), HtmlControl)
        Dim bm_myControl19 As HtmlControl = CType(FindControl("bm_stiro_organigramma"), HtmlControl)
        'Dim bm_myControl20 As HtmlControl = CType(FindControl("bm_tess"), HtmlControl)
        Dim bm_myControl21 As HtmlControl = CType(FindControl("bm_conf_clienti"), HtmlControl)
        Dim bm_myControl22 As HtmlControl = CType(FindControl("bm_stiro_layout"), HtmlControl)
        Dim bm_myControl23 As HtmlControl = CType(FindControl("bm_stiro_stat_di_prod"), HtmlControl)
        'Dim bm_myControl24 As HtmlControl = CType(FindControl("bm_prod"), HtmlControl)
        'Dim bm_myControl25 As HtmlControl = CType(FindControl("bm_sart"), HtmlControl)
        Dim bm_myControl26 As HtmlControl = CType(FindControl("bm_conf_machines"), HtmlControl)
        Dim bm_myControl27 As HtmlControl = CType(FindControl("bm_stiro_persons"), HtmlControl)
        Dim bm_myControl28 As HtmlControl = CType(FindControl("bm_conf_a_layout"), HtmlControl)
        Dim bm_myControl29 As HtmlControl = CType(FindControl("bm_conf_article"), HtmlControl)
        Dim bm_myControl30 As HtmlControl = CType(FindControl("bm_conf_commesse"), HtmlControl)
        Dim bm_myControl31 As HtmlControl = CType(FindControl("bm_conf_faze"), HtmlControl)
        'Dim bm_myControl32 As HtmlControl = CType(FindControl("bm_smart"), HtmlControl)
        Dim bm_myControl33 As HtmlControl = CType(FindControl("bm_conf_tablets"), HtmlControl)
        Dim bm_myControl34 As HtmlControl = CType(FindControl("bm_conf_intervali"), HtmlControl)
        Dim bm_myControl35 As HtmlControl = CType(FindControl("bm_conf_organigrama"), HtmlControl)
        Dim bm_myControl36 As HtmlControl = CType(FindControl("bm_stiro_eff_mens"), HtmlControl)

        With bmfullListOfControls
            .Add(bm_myControl1)
            .Add(bm_myControl2)
            .Add(bm_myControl3)
            .Add(bm_myControl4)
            '.Add(bm_myControl5)
            .Add(bm_myControl6)
            .Add(bm_myControl7)
            .Add(bm_myControl8)
            .Add(bm_myControl9)
            .Add(bm_myControl10)
            .Add(bm_myControl11)
            .Add(bm_myControl12)
            '.Add(bm_myControl13)
            '.Add(bm_myControl14)
            '.Add(bm_myControl15)
            .Add(bm_myControl16)
            '.Add(bm_myControl17)
            .Add(bm_myControl18)
            .Add(bm_myControl19)
            '.Add(bm_myControl20)
            .Add(bm_myControl21)
            .Add(bm_myControl22)
            .Add(bm_myControl23)
            '.Add(bm_myControl24)
            '.Add(bm_myControl25)
            .Add(bm_myControl26)
            .Add(bm_myControl27)
            .Add(bm_myControl28)
            .Add(bm_myControl29)
            .Add(bm_myControl30)
            .Add(bm_myControl31)
            '.Add(bm_myControl32)
            .Add(bm_myControl33)
            .Add(bm_myControl34)
            .Add(bm_myControl35)
            .Add(bm_myControl36)
        End With

        For Each cont As HtmlControl In bmfullListOfControls
            If cont.Attributes("data-link").ToString() IsNot String.Empty Then
                Dim dtlink As String = cont.Attributes("data-link").ToString()

                For Each row As DataRow In _tblUsrFav.Rows
                    Dim tbllink As String = row.Item(1).ToString()

                    If tbllink = dtlink Then
                        cont.Attributes.Add("class", "nekaKlasa1 bookyellow")
                        cont.Attributes.Add("class", cont.Attributes("class").Replace("booknone", ""))
                        Exit For
                    Else
                        cont.Attributes.Add("class", "nekaKlasa1 booknone")
                        cont.Attributes.Add("class", cont.Attributes("class").Replace("bookyellow", ""))
                    End If
                Next
            End If

        Next
    End Sub

    Protected Sub ddl_allusr_SelectedIndexChanged(sender As Object, e As EventArgs)
        For Each conts As CheckBox In _fullListOfCheckboxesAccepted
conts.Checked=False
        Next

        _tblAuthActivated.Clear()
        _tblAuthActivated = clientService.GetSoftwareModules(req_userAll_drop_down.SelectedValue)
        

        For each row As DataRow In _tblAuthActivated.Rows
             For Each conts As CheckBox In _fullListOfCheckboxesAccepted
                If conts.Attributes("data-guid") = row.Item(0).ToString Then
                    conts.Checked = True

                End If
            Next
        Next
    End Sub
    'SQL - Permissions Get
    Private Sub GetPerrmissions()
        _usrID = clientService.GetPermissions(User.Identity.Name)
        _tblAuth = clientService.GetSoftwareModules(_usrID)

        gv_permissions.DataSource =  _tblAuth
        gv_permissions.DataBind()
    End Sub
    'SQL - Modules GET
    Private Sub GetAllSoftModules()
        _dtAllSoftModules = clientService.GetAllSoftModules()
    End Sub
    Public Sub gv_permission_dbound(sender As Object, e As GridViewRowEventArgs)
        'For index = 0 To 7
        '    e.Row.Cells(index).Visible = False
        'Next
        '        e.Row.Cells(1).Visible=true
        'e.Row.Cells(2).Visible=true
    End Sub

    Dim dt_OnlineUsers As New DataTable
    Public Sub online_users_data_bound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(2).Attributes.Add("style", "width: 1px; margin-left: 20px;border:none;")
        e.Row.Cells(2).Attributes.Add("class", "online_user_td")
        e.Row.Cells(2).Attributes.Add("class","online_user_img")
        e.Row.Cells(1).Attributes.Add("style", "font-size: 12px;border:none;")
        e.Row.Cells(1).Attributes.Add("data-guid", e.Row.Cells(0).Text )
        e.Row.Cells(0).Attributes.Add("style","display:none;")
    End Sub
    'SQL - Load unactivated users
    Private Sub GetNonActivatedUsers()
        _reqDt = clientService.GetNonActivatedUsers()
        reg_notification_control.Attributes.Add("data-count", _reqDt.Rows.Count.ToString)

        req_h1.InnerText = "- " + _reqDt.Rows.Count.ToString + " Pending Requests"
        req_h1.Attributes.Add("style", "color:red;")

        req_user_drop_down.DataSource = _reqDt
        req_user_drop_down.DataTextField = "FullName"
        req_user_drop_down.DataValueField = "UserID"
        req_user_drop_down.DataBind()
        req_user_drop_down.Items.Insert(0, New ListItem(String.Empty))
        req_user_drop_down.SelectedIndex = 0
        'req_userAll_drop_down.Items.Insert(0, New ListItem(String.Empty))
        'req_userAll_drop_down.SelectedIndex = 0
    End Sub
    'SQL - Validate User Auth
    Private Sub ValidateAuthUser() Handles req_save_proced.Click
        Dim Name As String = String.Empty
        Dim UserStr As String = String.Empty
        Name = req_user_drop_down.SelectedItem.ToString()

        'USERID ID
        For Each row As DataRow In _reqDt.Rows
            If row(0).ToString().Equals(req_user_drop_down.SelectedValue.ToString) Then
                req_user_drop_down.Attributes.Add("data-attr", row(0).ToString)
                UserStr = req_user_drop_down.Attributes("data-attr")
            End If
        Next
    End Sub
    Dim tbl_msg As New DataTable
    'SQL - Load User Messages
    Private Sub GetReciveMessages()
        tbl_msg.Clear()

        If _myConnection2.State = ConnectionState.Closed Then _myConnection2.Open()

        Dim q As String = "SELECT * from User_Message Where [To] = '" + User.Identity.Name + "' UNION SELECT * from User_Message WHERE [From]='"+User.Identity.Name+"' ORDER BY Sended ASC"
        Dim adap As New SqlDataAdapter(q, _myConnection2)
        adap.Fill(tbl_msg)
        adap.Dispose()
        If _myConnection2.State = ConnectionState.Open Then _myConnection2.Close()
        
        'For each row As DataRow In tbl_msg.Rows

        '    If msg_selected_usr.Text = row.Item(0).ToString()
        '        Dim yourHTMLstring As string = "<li class='sent'><img src=""/>"+row.item(2).ToString()+"</li>"
        '        msg_messages.Controls.Add(New LiteralControl(yourHTMLstring))
        '    End If
        '    If row.Item(3) IsNOT Nothing
        '        chat_control_icon.Attributes.Add("data-count",tbl_msg.Rows.Count)
        '        Else
        '        'chat_control_icon.Attributes.Add("data-count","0")
        '    End If
        'Next

    End Sub
    'SQL - Load User Favorites
    Private Sub LoadUserFavorites()
        _tblUsrFav = clientService.LoadUserFavorites(User.Identity.Name)
        CreateUserFavorites()
    End Sub
    'Create User Favorites Controls - Bottom Of Screen
    Public Sub CreateUserFavorites()
        Dim Name As String = String.Empty
        Dim Link As String = String.Empty
        Dim myControl As HtmlControl = CType(FindControl("favnav"), HtmlControl)
        Dim imglink As String = String.Empty

        For Each row As DataRow In _tblUsrFav.Rows
            Name = row.ItemArray(2).ToString()
            Link = row.ItemArray(1).ToString()
            imglink = row.ItemArray(6).ToString()

            Dim str = "<a href='#!' class='nekaKlasa card__status book' data-name='"+Name+"' data-link='"+Link+"' data-img='"+imglink+"' style='background-image:url("+imglink+");background-size: 90px; background-attachment:inherit;background-position: 47% 15%;'> <span> "+Name+" </span> </a>"

            myControl.Controls.Add(New LiteralControl(str))
        Next
    End Sub
    'SQL - LOG-OUT CLICK
    Private Sub SendOnlineStatus(sender As Object, e As EventArgs) Handles LoginStatus1.LoggedOut
        'clientService.SendOfflineStatus(User.Identity.Name)
         Dim query As String = "Update Users Set OnlineStatus='False' WHERE Username='" & User.Identity.Name & "'"
        If _myConnection2.State = ConnectionState.Closed Then _myConnection2.Open()
        Dim cmd As New SqlCommand(query, _myConnection2)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection2.State = ConnectionState.Open Then _myConnection2.Close()

            Session.Clear()
            Session.Abandon()
            Response.Redirect("Login.aspx")
    End Sub
    'SQL - LOG-IN STATUS SEND
    Private Sub SendTrueOnlineStatus(sender As Object, e As EventArgs)
         clientService.SendOnlineStatus(User.Identity.Name)
    End Sub
    'SQL - Load User Profil Details
    Private Sub LoadUserProfile()
        Dim query = "SELECT * From Users Where Username='" + Page.User.Identity.Name + "'"

        If _myConnection2.State = ConnectionState.Closed Then _myConnection2.Open()
        Dim cmd As New SqlCommand(query, _myConnection2)
        Dim imgbyte
        Dim dr As SqlDataReader = cmd.ExecuteReader

        While dr.Read()
            profil_fullname.Text = dr.Item("FullName").ToString()
            profil_email.Text = dr.Item("Email").ToString()
            profil_lastlogin.Text = dr.Item("LastLogin").ToString()
            profil_createddate.Text = dr.Item("CreatedDate").ToString()
            profil_job.Text = dr.Item("JobType").ToString()
            profil_telephone.Text = dr.Item("Telephone").ToString()
            imgbyte = dr.Item("Image")
            'msg_me.Text = dr.Item("FullName").ToString()
        End While

        Try
            Dim bytes As Byte() = imgbyte
            Dim base64String As String = Convert.ToBase64String(bytes, 0, bytes.Length)
            Dim url As String = String.Empty
            url = Convert.ToString("data:Images/Image/png;base64,") & base64String
            profile_image.ImageUrl = url
            small_profile.ImageUrl = url
            'msg_img.ImageUrl = url
        Catch ex As Exception
            profile_image.ImageUrl = "Images/img/avatars-3/512/avatar_hipster_guy-512.png"
            small_profile.ImageUrl = "Images/img/avatar_hipster_guy-512.png"
        End Try

        cmd.Dispose()
        dr.Close()
        If _myConnection2.State = ConnectionState.Open Then _myConnection2.Close()

        LoadOtherUserProfiles()
        'SendTrueOnlineStatus(Nothing, Nothing)
    End Sub
    Dim tbl_all_users As New DataTable
    'SQL - Load Other User Profiles
    'Private Function LoadAllUsers() As DataTable
    '            Dim dt As New DataTable
    '    dt.TableName="tblOtherUsers"
    '    If _myConnection2.State = ConnectionState.Closed Then _myConnection2.Open()
    '    Dim q As String = "SELECT UserID, FullName from Users"
    '    Dim adap As New SqlDataAdapter(q, _myConnection2)
    '    adap.Fill(dt)
    '    adap.Dispose()
    '    If _myConnection2.State = ConnectionState.Open Then _myConnection2.Close()

    '    Return dt
    'End Function
    Private Sub LoadOtherUserProfiles()
        tbl_all_users = clientService.LoadOtherUserProfiles(User.Identity.Name)
        'req_userAll_drop_down.DataSource = LoadAllUsers()
        'req_userAll_drop_down.DataBind()
        'GetReciveMessages()

        'For each row As DataRow In tbl_all_users.Rows
        ' Dim url As string = String.Empty
        '    Dim imgbyte
        '    Dim bytes As Byte()
        '    Dim base64String As String
        '    Dim online_status As string

        '    If row.Item(8) = true
        '        online_status = "online"
        '        Else
        '        online_status = "offline"
        '    End If

        '        If Convert.IsDBNull(row.Item(11))
        '             url = "https://cdn0.iconfinder.com/data/Images/icons/avatars-3/512/avatar_hipster_guy-512.png"
        '        Else

        '        imgbyte  = row.Item(11)
        '        bytes = imgbyte
        '        base64String = Convert.ToBase64String(bytes, 0, bytes.Length)
        '        url = Convert.ToString("data:Images/Image/png;base64,") & base64String
        '        End If
   
        '    Dim yourHTMLstring As string = "<li class='contact "+row.Item(1).ToString+"' data-name='"+row.Item(1).ToString+"' ><div class='wrap'><span class='contact-status "+online_status+"'></span><img src='"+url+"'/><div class='meta'><p class='name'>"+row.Item(6).ToString+"</p><p class='preview'>"+row.Item(11)+"</p></div></div></li>"
        '    'msg_ul.Controls.Add(new LiteralControl(yourHTMLstring))
            
        'Next
        ' Dim msgHTMLstr As string = String.Empty
        ' Dim msgHTMLstr1 As string = String.Empty

        'For each row As DataRow In tbl_msg.Rows
        '    Dim url As String = String.Empty
        '    Dim imgbyte
        '    Dim bytes As Byte()
        '    Dim base64String As String
        '    'Dim online_status As string
        '    For each rows As DataRow In tbl_all_users.Rows
        '        'If row.Item(0) = rows.Item(1)
        '                Try
        '                    imgbyte  = rows.Item(12)
        '                    bytes = imgbyte
        '                    base64String = Convert.ToBase64String(bytes, 0, bytes.Length)
        '                    url = Convert.ToString("data:Images/Image/png;base64,") & base64String
        '                Catch ex As Exception
        '                    url = "https://cdn0.iconfinder.com/data/Images/icons/avatars-3/512/avatar_hipster_guy-512.png"
        '                End Try
        '        'End If
        '    Next
        '    'UKOLIKO JE POSLATA
          
        '    ' Dim recivedDate As DateTime 
        '    '     recivedDate = DateTime.Parse("6/22/2009 07:00:00 AM")
        '    '     recivedDate.ToString("HH:mm")
        '    '     recivedDate = CDate(row.Item(4))

        '    'If Page.IsPostBack = true
        '    '    msgHTMLstr1 = "<li class='replies " + row.Item(1).ToString() + "' data-name='" + row.Item(1).ToString() + "'><img src='" + url + "'/><p>" + row.item(2).ToString() + "</p><span class='msg_span'>" + recivedDate + "</span></li>"
        '    '    msg_messages.Controls.Add(New LiteralControl(msgHTMLstr1))
        '    '    msgHTMLstr = "<li class='sent " + row.Item(0).ToString() + "' data-name='" + row.Item(0).ToString() + "'><img src='" + url + "'/><p>" + row.item(2).ToString() + "</p></li>"
        '    '    msg_messages.Controls.Add(New LiteralControl(msgHTMLstr))
                
        '    'End If
        '    'UKOLIKO JE PRIMLJENA

        '         If row.Item(0) = User.Identity.Name
        '           msgHTMLstr1 = "<li class='replies "+row.Item(1).ToString()+"' data-name='"+row.Item(1).ToString()+"'><img src='"+url+"'/><p>"+row.item(2).ToString()+"</p><span class='msg_span'></span></li>"
        '          'msg_messages.Controls.Add(New LiteralControl(msgHTMLstr1))
        '          msgHTMLstr = "<li class='sent " + row.Item(0).ToString() + "' data-name='" + row.Item(0).ToString() + "'><img src='" + url + "'/><p>" + row.item(2).ToString() + "</p></li>"
        '          'msg_messages.Controls.Add(New LiteralControl(msgHTMLstr))
        '    End If
            
        'Next
        
    End Sub
    'SQL - Remove User Profile Image
    Private Sub RemoveUserImage()
        clientService.RemoveUserImage(User.Identity.Name)
    End Sub
    Public Function GetData(ByVal cmd As SqlCommand) As DataTable

        Dim dt As New DataTable
        Dim strConnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString()
        Dim con As New SqlConnection(_constr)
        Dim sda As New SqlDataAdapter

        cmd.CommandType = CommandType.Text
        cmd.Connection = con

        Try
            con.Open()
            sda.SelectCommand = cmd
            sda.Fill(dt)
            Return dt
        Catch ex As Exception
            Response.Write(ex.Message)
            Return Nothing
        Finally
            con.Close()
            sda.Dispose()
            con.Dispose()
        End Try
    End Function
    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As EventArgs)
        'RemoveUserImage()
        ' Read the file and convert it to Byte Array
        Dim filePath As String = FileUpload1.PostedFile.FileName
        Dim filename As String = Path.GetFileName(filePath)
        Dim ext As String = Path.GetExtension(filename)
        Dim contenttype As String = String.Empty
        'Set the contenttype based on File Extension
        Select Case ext
            Case ".jpg"
                contenttype = "Images/Image/jpg"
                Exit Select
            Case ".png"
                contenttype = "Images/Image/png"
                Exit Select
            Case ".gif"
                contenttype = "Images/Image/gif"
                Exit Select
        End Select

        If contenttype <> String.Empty Then

            Dim fs As Stream = FileUpload1.PostedFile.InputStream
            Dim br As New BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CInt(fs.Length))
            Dim strQuery As String = "UPDATE Users SET Image=@Image,ImageType=@ImageType  WHERE Username='" & Page.User.Identity.Name & "'"
            Dim cmd As New SqlCommand(strQuery)

            cmd.Parameters.Add("@ImageType", SqlDbType.VarChar).Value = contenttype
            cmd.Parameters.Add("@Image", SqlDbType.Binary).Value = bytes

            InsertUpdateData(cmd)
            lblMessage.ForeColor = System.Drawing.Color.Green
            lblMessage.Text = "File Uploaded Successfully"

        Else

            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = "File format not recognised."

        End If

        Response.Redirect("./Dashboard.aspx")
    End Sub
    Public Function InsertUpdateData(ByVal cmd As SqlCommand) As Boolean

        Dim strConnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString

        Dim con As New SqlConnection(_constr)

        cmd.CommandType = CommandType.Text

        cmd.Connection = con

        Try
            con.Open()
            cmd.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            Response.Write(ex.Message)
            Return False
        Finally
            con.Close()
            con.Dispose()
        End Try
    End Function
End Class