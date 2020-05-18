Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class profil
    Inherits System.Web.UI.Page

    Const strConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
    Dim _myConnection As SqlConnection = New SqlConnection(strConnection)

    Dim _tblUsers As New DataTable

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
            Else
                profil_username.Text = Page.User.Identity.Name
        End If
     
        LoadUserProfile()
      
    End Sub

    Private Sub LoadUserProfile()

        Dim query = "SELECT * From Users Where Username='"+ Page.User.Identity.Name +"'"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader

        While dr.Read()
            profil_fullname.Text = dr.Item("FullName").ToString()
            profil_email.Text = dr.Item("Email").ToString()
            profil_lastlogin.Text = dr.Item("LastLoginDate").ToString()
            profil_createddate.Text = dr.Item("CreatedDate").ToString()
            profil_job.Text = dr.Item("JobType").ToString()
            profil_telephone.Text = dr.Item("Telephone").ToString()
        End While

        cmd.Dispose()
        dr.Close()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

    End Sub
    
    Public Function GetData(ByVal cmd As SqlCommand) As DataTable

        Dim dt As New DataTable

        Dim strConnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString()

        Dim con As New SqlConnection(strConnString)

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


    'LOG-OUT CLICK
    'Public Sub SendOnlineStatus(sender As Object, e As EventArgs) Handles LoginStatus1.LoggedOut

    '    Dim name As String = User.Identity.Name

    '    Dim query As String = "Update Users Set OnlineStatus='False' WHERE Username='" & name & "'"

    '    If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
    '    Dim cmd As New SqlCommand(query, _myConnection)
    '    cmd.ExecuteNonQuery()
    '    cmd.Dispose()
    '    If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    'End Sub
    
    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As EventArgs)

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

       Dim strQuery As String = "insert into tblFiles" & "(Name, ContentType, Data, Username)" & " values (@Name, @ContentType, @Data,'"+ Page.User.Identity.Name +"')"
        Dim cmd As New SqlCommand(strQuery)

        cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename
        cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype
        cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes

        InsertUpdateData(cmd)
        lblMessage.ForeColor = System.Drawing.Color.Green
        lblMessage.Text = "File Uploaded Successfully"

     Else

       lblMessage.ForeColor = System.Drawing.Color.Red

       lblMessage.Text = "File format not recognised."

     End If

  End Sub

    Public Function InsertUpdateData(ByVal cmd As SqlCommand) As Boolean

        Dim strConnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString

        Dim con As New SqlConnection(strConnString)

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
