
Imports System.Data
Imports System.Data.SqlClient

Partial Class Sectors
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        End If

    End Sub


    Protected Sub Page_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        'MsgBox("unload")
    End Sub


    Const strConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
    Dim _myConnection As SqlConnection = New SqlConnection(strConnection)


    'LOG-OUT CLICK
    Public Sub SendOnlineStatus(sender As Object, e As EventArgs) Handles LoginStatus1.LoggedOut

        Dim name As String = User.Identity.Name

        Dim query As String = "Update Users Set OnlineStatus='False' WHERE Username='" & name & "'"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub

End Class
