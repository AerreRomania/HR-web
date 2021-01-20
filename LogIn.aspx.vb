Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail


Partial Class LogIn
    Inherits Page
    Dim constr As String = ConfigurationManager.ConnectionStrings("NOYConnectionString").ConnectionString
    Dim _myConnection As SqlConnection = New SqlConnection(constr)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("User") = Nothing
        'Dim returnUrl As String = Request.QueryString("ReturnUrl")
        If Session("User") IsNot Nothing Then
            Session("User") = Login1.UserName
            'if return url is empty go to deshboart, else redirect to sended url
            'If returnUrl Is String.Empty
                Response.Redirect("Dashboard.aspx")
            '    Else
            '     Response.Redirect(returnUrl)
            'End If
            
        Else
            Exit Sub
        End If
    End Sub

    ReadOnly _tblUsers As New DataTable
    Dim _tblJobs As New DataTable

    Protected Sub CreateAccount1(sender As Object, e As EventArgs)
        If checkbox1.Checked = True And checkbox2.Checked = True Then
            RegisterUser(sender, e)
        Else
            Exit Sub
        End If
    End Sub

    Protected Sub GoBack1(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub

    'SEND ONLINE STATUS TO SQL
    Public Sub SendOnlineStatus()
        Dim query As String = "Update Users Set OnlineStatus='True' WHERE Username='" & Login1.UserName & "'"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub

    'SEND EMAIL TO CLIENT
    Protected Sub SendRegistrationEmail(sender As Object, e As EventArgs)
        Dim mail As New MailMessage()
        mail.From = New MailAddress("noreply@olimpias.rs","Web Application - Registration")
        mail.[To].Add(txtEmail.Text)
        mail.Subject = "Olimpias Knitting Serbia - Web Account Information"
            Dim sb As New StringBuilder
            sb.AppendLine("<i><p style='font-size:16px;margin: 0 0 0px;'>Greetings " + txtName.Text + ",</p>We notify you that new Account is created on Web Application and waiting administrator for approvement.</i></br></br>")
            sb.AppendLine("<b style='text-decoration:underline;'>Account information details:</b>")
            sb.AppendLine("<p style='font-size:14px;margin: 0 0 0px;'>You can check your status <a href='loknitting.olimpias.it' style='color:blue;'>here</a></p>")
            sb.AppendLine("<p style='font-size:14px;margin: 0 0 0px;'>Username: " + txtUsername.Text + "</p>")
            sb.AppendLine("<p style='font-size:14px;margin: 0 0 0px;'>Password: " + txtPassword.Text + "</p></br></br>")
            sb.AppendLine("</br></br></br><p style='font-size:16px;margin: 0 0 0px;'>Best Regards,</p>")
            sb.AppendLine("<p style='margin: 0 0 0px;font-size:16px;color:blue;text-decoration:none;'><a href='loknitting.olimpias.it'>Olimpias Knitting Serbia</a></p>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("mail.olimpias.it")
        smtp.Port = 25
        smtp.Send(mail)
    End Sub
    'SEND EMAIL TO ADMIN
    Protected Sub SendRegistrationEmailToAdmin(sender As Object, e As EventArgs)
        Dim mail As New MailMessage()
        mail.From = New MailAddress("noreply@olimpias.rs","Web Request - Waiting")
        mail.[To].Add("giovanni@antonioli.it")
        mail.[To].Add("pnikolic@olimpias.rs")
        'set the content
        mail.Subject = "Web Request - New account registred"
        Dim sb As New StringBuilder
        sb.AppendLine("<i><p style='font-size:16px;margin: 0 0 0px;'>Greetings Mr.Antonioli,</p>We notify you that new Account is created on Web and waiting for approvement.</i></br></br>")
        sb.AppendLine("<b style='text-decoration:underline;'>Account information details:</b>")
        sb.AppendLine("</br><b>Name: </b>" + txtName.Text)
        sb.AppendLine("</br><b>Username: </b>" + txtUsername.Text)
        sb.AppendLine("</br><b>E-mail: </b>" + txtEmail.Text)
        sb.AppendLine("</br><b>Job Type: </b>" + txtJob.Text)
        sb.AppendLine("</br><b>Telephone: </b>" + txtPhone.Text)
        sb.AppendLine("</br></br></br><p style='font-size:16px;margin: 0 0 0px;'>Best Regards,</p>")
        sb.AppendLine("<p style='margin: 0 0 0px;font-size:16px;color:blue;text-decoration:none;'><a href='loknitting.olimpias.it'>Olimpias Knitting Serbia</a></p>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True

        Dim smtp As New SmtpClient("mail.olimpias.it")
        smtp.Port = 25
        smtp.Send(mail)
    End Sub

   Dim _userId As Integer

    Protected Sub RegisterUser(sender As Object, e As EventArgs)

        Dim message As String = String.Empty

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("spUserRole")
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar,64).Value = txtUsername.Text.Trim()
                    cmd.Parameters.Add("@password", SqlDbType.VarChar,128).Value = CreateSHAHash(txtUsername.Text, txtPassword.Text)
                    'cmd.Parameters.Add("@roleID", SqlDbType.UniqueIdentifier).Direction = ParameterDirection.Output
                    cmd.Parameters.Add("@userID", SqlDbType.Int).Direction = ParameterDirection.Output
                    cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteNonQuery

                    Dim s As Integer                    
                Try
                    s = cmd.Parameters("@userID").Value
                Catch ex As Exception
                    s = 0
                End Try

                    If s = 0
                        _userId = 0
                        Else
                        _userId = s
                    End If
                con.Close()
            End Using
        End Using

        If txtPassword.Text = txtPasswordre.Text
            If _userId = 0 Then

            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("crud_Users_Insert")
                        cmd.CommandType = CommandType.StoredProcedure
                        cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim())
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim())
                        cmd.Parameters.AddWithValue("@Password", CreateSHAHashWithoutMime(txtUsername.Text.ToLower(), txtPassword.Text))
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim())
                        'cmd.Parameters.AddWithValue("@RoleID", Guid.Parse("6DEACE6E-D744-4E47-A3DB-014E97DC56C3"))
                        'cmd.Parameters.AddWithValue("@DepartmentID", Guid.Parse("F6BA006C-0B13-4F1D-B63B-C94E6EDA4826"))
                        cmd.Parameters.AddWithValue("@Telephone", txtPhone.Text.Trim())
                        'cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now)
                        cmd.Parameters.AddWithValue("@LastLogin", DateTime.Now)
                        cmd.Parameters.AddWithValue("@OnlineStatus", "false")
                        cmd.Parameters.AddWithValue("@Active", "true")
                        cmd.Parameters.AddWithValue("@JobType", txtJob.Text)
                        cmd.Connection = con
                        con.Open()

                    Dim reader As SqlDataReader
                    reader = cmd.ExecuteReader()
                    reader.Read()

                    _userId = reader.GetOrdinal("UserID")
                    con.Close()
                End Using
                message = "Succsessful created"
                    Try
                        SendRegistrationEmailToAdmin(sender,e)
                    Catch ex As Exception
                        Exit Try
                    End Try

                    Try
                        SendRegistrationEmail(sender,e)
                    Catch ex As Exception
                        Exit Try
                    End Try
                
                ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") + message) + "');", True)
            End Using
        Else
            message = "User already exist"
            ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
        End If
            Else
            message = "Your Password does not match!"
                ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
            Exit Sub
        End If
    End Sub

    'USER VALIDATION - DISABLED
    Protected Sub ValidateUser(sender As Object, e As EventArgs)
        'Dim userId As Guid = New Guid
        Try
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Validate_User")
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Username", Login1.UserName)
                    cmd.Parameters.AddWithValue("@Password", CreateSHAHashWithoutMime(Login1.UserName.ToLower(), Login1.Password))
                    cmd.Connection = con
                    con.Open()
                    _userId = cmd.ExecuteScalar()
                    cmd.Dispose()
                    con.Close()
            End Using
                    If _userId = "-1"
                        Login1.FailureText = "Username or Password is Incorrect. Or your account is not activated yet. Try again Later"
                    Else
                        FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet)
                    End If
        End Using
                    Catch ex As Exception
            Login1.FailureText = "Username or Password is incorrect."
        End Try
    End Sub
    
    Public Shared Function CreateShaHash(salt As String, password As String) As String
        Dim hashTool = New System.Security.Cryptography.SHA512Managed()
        Dim passwordAsByte As Byte() = Encoding.UTF8.GetBytes(String.Concat(Salt.ToLower() + ":" + Password))
        Dim hashedPassword As Byte() = hashTool.ComputeHash(passwordAsByte)
        Dim strBuild As New StringBuilder(128)

        For Each bt As Byte In hashedPassword
            strBuild.Append(bt.ToString("X2"))
        Next

        Dim enc = Encoding.UTF8.GetBytes(Salt + ":" + strBuild.ToString())
        Return Convert.ToBase64String(enc)

    End Function
    'REGISTRATION
    Public Shared Function CreateShaHashWithoutMime(ByVal salt As String, ByVal password As String) As String
        Dim hashTool  = New System.Security.Cryptography.SHA512Managed()
        Dim passwordAsByte As Byte() = Encoding.UTF8.GetBytes(String.Concat(Salt.ToLower() + ":" + Password))
        Dim hashedPassword As Byte() = hashTool.ComputeHash(passwordAsByte)
        Dim strBuild As New StringBuilder(128)

      Dim stringBuilder As New StringBuilder()

      For i As Integer = 0 To hashedPassword.Length - 1
        stringBuilder.Append(hashedPassword(i).ToString("x2"))
      Next

      Return stringBuilder.ToString()

    End Function


#Region "DatabaseCommunication"
    Private Sub LoadUsers()
        Const q As String = "SELECT E_mail From user_Account"
        Try
            _myConnection.Open()
            Dim c As New SqlClient.SqlCommand With {
                .CommandText = q,
                .Connection = _myConnection
            }
            Dim dr As SqlClient.SqlDataReader
            dr = c.ExecuteReader
            _tblUsers.Load(dr)
            dr = Nothing
            c = Nothing
            _myConnection.Close()
        Catch ex As Exception

        End Try

    End Sub
    Private Sub LoadJobs()
        _tblJobs.Clear()
        'ddlJobs.Items.Clear()

        Dim querys As String = "Select distinct lavoro from organizator"

        _myConnection.Open()
        Dim cmd As New SqlCommand With {
            .CommandText = (querys),
            .Connection = _myConnection
        }
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        _tblJobs.Load(dr)
        dr.Close()
        dr = Nothing
        cmd = Nothing
        _myConnection.Close()

        For i As Integer = 0 To _tblJobs.Rows.Count - 1
            'ddlJobs.Items.Add(_tblJobs.Rows(i).Item(0).ToString())
        Next
    End Sub
#End Region

End Class
