Imports System.Drawing
Imports System.Data
Imports System.Data.SqlClient

Partial Class SingUp
    Inherits Page

    Dim tmpRow() as DataRow

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        CreateConnection()  'sql connection
        LoadUsers() ''load all users from log in table
        LoadJobs()  ''load all jobs from organization

        tmpRow = _tblUsers.Select("NewUser ='" & txtUser.text & "'")
    End Sub

    Dim _myConnection As New SqlConnection
    ReadOnly _tblUsers as new DataTable
    Dim _tblJobs As New DataTable
    
    Private sub CreateConnection()
        Const strConnection = "Data Source = KNSQL\SQLEXPRESS;Initial Catalog = dbSoConItrButoane; user=sconservice;password=Softcenter77"
        _myConnection = New SqlConnection(strConnection)
    End sub

    Protected Sub GetSecurityCode(sender As Object, e As EventArgs) Handles btnGetCode.Click
        Dim n as integer = New Random().Next(1010101, 9999999)
        lblSecurityCode.text = n.tostring()
    End Sub

    'Protected Sub CreateAccount(sender As Object, e As EventArgs) Handles btnCheck.Click
    '    CreateAccount()
    'End Sub

    'Protected Sub GoBack(sender As Object, e As EventArgs) Handles btnGoBack.Click
    '    Response.Redirect("Login.aspx")
    'End Sub

    Public Sub CreateAccount()
        'check the primary base of security    
        'if security code is okay, continue with other info

        If txtUser.Text = string.empty orelse txtName.Text = string.empty orelse txtEnterSCode.Text = string.empty orelse txtNewPassword.Text = string.empty orelse txtRePassword.Text = string.empty Then
            lblAlert.Text = "ERROR: Inserted info isn't valid"
            Exit sub

        ElseIf txtEnterSCode.Text <> lblSecurityCode.Text Then
            lblAlert.Text = "ERROR: Security code isn't valid"
            Exit sub

        ElseIf txtNewPassword.Text.Length < 8 Then
            lblAlert.Text = "Password must contains more then 8 characters"
            Exit Sub

        ElseIf tmprow.Length > 0 Then
            lblAlert.Text = "ATTENTION: User alrady exist"
            Exit Sub

        ElseIf Not txtRepassword.Text.Equals(txtNewPassword.Text) Then
            lblAlert.Text = "ERROR: Passwords doesn't match"
            Exit Sub

        ElseIf Not ddlJobs IsNot nothing Then
            lblAlert.Text = "ERROR: Your job information is required"
            Exit Sub
        End If

        Dim newUser As String = txtUser.Text   'username
        Dim name As String = txtName.Text   'personal name
        Dim password As String = txtNewPassword.Text 'password
        Const num As String = "1"

        Dim query As String = "INSERT INTO LogIn (NewUser,FullName,Password,Sector,Line,Feedback) "
        query += "VALUES ('" & newUser & "','" & name & "','" & password & "','" & num & "','" & num & "','" & num & "')"

        _myConnection.Open()
        Dim myCmd As SqlClient.SqlCommand = New SqlCommand(query, _myConnection)
        myCmd.ExecuteNonQuery()
        myCmd = Nothing
        _myConnection.Close()

        Response.Redirect("Loginsuccess.aspx")
    End Sub

#Region "DatabaseCommunication"

    Private Sub LoadUsers()
        Const q As String = "SELECT NewUser From LogIn"

        _myConnection.Open()
        Dim c As New SqlClient.SqlCommand
        c.CommandText = q
        c.Connection = _myConnection
        Dim dr As SqlClient.SqlDataReader
        dr = c.ExecuteReader
        _tblUsers.Load(dr)
        dr = Nothing
        c = Nothing
        _myConnection.Close()
    End Sub

    Private sub LoadJobs()
        _tblJobs.Clear()
        ddlJobs.Items.Clear()

        Dim querys As String = "Select distinct lavoro from organizator"

        _myConnection.Open()
        Dim cmd As New SqlCommand
        cmd.CommandText = (querys)
        cmd.Connection = _myConnection
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        _tblJobs.Load(dr)
        dr.Close()
        dr = Nothing
        cmd = Nothing
        _myConnection.Close()

        For i As Integer = 0 To _tblJobs.Rows.Count - 1
            ddlJobs.Items.Add(_tblJobs.Rows(i).Item(0).ToString())
        Next
    End sub
#End Region

End Class
