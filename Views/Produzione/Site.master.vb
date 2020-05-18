
Namespace Views.Produzione

    Partial Class SiteMaster
        Inherits MasterPage

        Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
        Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
        Dim _antiXsrfTokenValue As String

        Protected Sub Page_Init(sender As Object, e As System.EventArgs)


            ' The code below helps to protect against XSRF attacks
            Dim requestCookie As HttpCookie = Request.Cookies(AntiXsrfTokenKey)
            Dim requestCookieGuidValue As Guid
            If ((Not requestCookie Is Nothing) AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue)) Then
                ' Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value
                Page.ViewStateUserKey = _antiXsrfTokenValue
            Else
                ' Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
                Page.ViewStateUserKey = _antiXsrfTokenValue

                Dim responseCookie As HttpCookie = New HttpCookie(AntiXsrfTokenKey) With {.HttpOnly = True, .Value = _antiXsrfTokenValue}
                If (FormsAuthentication.RequireSSL And Request.IsSecureConnection) Then
                    responseCookie.Secure = True
                End If
                Response.Cookies.Set(responseCookie)
            End If

            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "fullscreen();", True)


            AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
        End Sub

        Private Sub master_Page_PreLoad(sender As Object, e As System.EventArgs)
            If (Not IsPostBack) Then
                ' Set Anti-XSRF token
                ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
                ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, String.Empty)
            Else
                ' Validate the Anti-XSRF token
                If (Not DirectCast(ViewState(AntiXsrfTokenKey), String) = _antiXsrfTokenValue _
                    Or Not DirectCast(ViewState(AntiXsrfUserNameKey), String) = If(Context.User.Identity.Name, String.Empty)) Then
                    Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
                End If
            End If
        End Sub

        Dim confa_visible As Byte = 1
        Dim confb_visible As Byte = 0
        Dim stiro_visible As Byte = 0

        'Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        '    'Efficiency_Procedure_ConfB()
        '    'MainConfB.Visible=False
        '    'pnl_leftnavi.Visible=False
        '                'System.Web.UI.ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "Script", "goFullScreen();", True)
        '            'Master.Page.Controls.Add(ContextDataSourceView(Control(pn)))
        'End Sub

        'Public Sub ConfA_Click(sender as object, e As EventArgs) Handles ConfA_Change.Click
        '    Page.Response.Redirect("ConfezioneA.aspx")
        'End Sub

        'Public Sub ConfB_Click(sender as object, e As EventArgs) Handles ConfB_Change.Click
        '    Page.Response.Redirect("ConfezioneB.aspx")
        'End Sub

        'Public Sub Stiro_Click(sender as object, e As EventArgs) Handles Stiro_Change.Click
        '    Page.Response.Redirect("Stiro.aspx")
        'End Sub

        'Dim MyConnection As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
        'Dim Shared _effA As New DataTable

        'Public Sub Efficiency_Procedure_ConfB()
        '    _effA.Clear()

        '    Dim dtStart As String
        '    dtStart = FormatDateTime(DateTime.Today)

        '    Dim cmd As New SqlCommand("spEfficiencyConfA", MyConnection)
        '    cmd.CommandType = CommandType.StoredProcedure
        '    cmd.Parameters.Add("@startTime", SqlDbType.DateTime).Value = dtStart
        '    cmd.Parameters.Add("@stopTime", SqlDbType.DateTime).Value = dtStart


        '    If MyConnection.State = ConnectionState.Closed Then
        '        MyConnection.Open()
        '    End If

        '    Dim dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SequentialAccess)

        '    _effA.Load(dr)

        '    dr.Close()
        '    cmd.Dispose()

        '    If MyConnection.State = ConnectionState.Open Then
        '        MyConnection.Close()
        '    End If
        'End Sub

        'Public Sub go_to_ConfA(sender As Object, e As EventArgs)
        '    pnl_confa.Visible = True
        '    pnl_confb.Visible = False
        '    pnl_stiro.Visible = False
        'End Sub

        'Public Sub go_to_ConfB(sender As Object, e As EventArgs)
        '    pnl_confa.Visible = False
        '    pnl_confb.Visible = True
        '    pnl_stiro.Visible = False
        'End Sub

        'Public Sub go_to_Stiro(sender As Object, e As EventArgs)
        '    pnl_confa.Visible = False
        '    pnl_confb.Visible = False
        '    pnl_stiro.Visible = True
        'End Sub

    End Class
End Namespace