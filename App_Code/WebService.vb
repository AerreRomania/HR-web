Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://localhost")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ScriptService>
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Public Class WebService
    Inherits System.Web.Services.WebService

    Const StrConnection = "Data Source=192.168.96.37;Initial Catalog=ONLYOU; User Id=sa; Password=olimpiasknitting;"
    ReadOnly _myConnection As SqlConnection = New SqlConnection(StrConnection)
    Const StrConnection2 = "Data Source=192.168.96.37;Initial Catalog=ONLYOU; User Id=sa; Password=olimpiasknitting;"
    ReadOnly _myConnection2 As SqlConnection = New SqlConnection(StrConnection2)

    <WebMethod()>
    Public Sub InsertBookmark(username As String, name As String, link As String)
        'Dim userid1 As Guid = New Guid(userid)
        Dim query As String = "INSERT INTO Users_Favorite (User_name, Link, Name) VALUES (@usrname, @link, @name)"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)

        cmd.Parameters.AddWithValue("@usrname", username)
        cmd.Parameters.AddWithValue("@link", link)
        cmd.Parameters.AddWithValue("@name", name)
        'cmd.Parameters.AddWithValue("@img", img)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

    End Sub
    <WebMethod()>
    Public Sub DeleteBookmark(username As String, name As String, link As String)

        Dim query As String = "Delete FROM Users_Favorite WHERE User_name = '" + username + "' AND Link = '" + link + "' AND Name = '" + name + "'"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

    End Sub

    <WebMethod()>
    Public Sub InsertRole(UserID As Integer, RoleID As Integer)

        Using con As New SqlConnection(StrConnection)
            Using cmd As New SqlCommand("crud_UserSoftwareModuleAccesability_Insert")
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID
                cmd.Parameters.Add("@SoftwareModuleID", SqlDbType.Int).Value = RoleID
                cmd.Parameters.Add("@CanRead", SqlDbType.Bit).Value = 1
                cmd.Parameters.Add("@CanWrite", SqlDbType.Bit).Value = 1
                cmd.Connection = con
                con.Open()

                cmd.ExecuteNonQuery()

                con.Close()
            End Using
        End Using
    End Sub

    <WebMethod()>
    Public Sub DeleteRole(UserID As Integer, RoleID As Integer)

        Using con As New SqlConnection(StrConnection)
            Using cmd As New SqlCommand("crud_UserSoftwareModuleAccesability_Delete2")
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID
                cmd.Parameters.Add("@SoftwareModuleID", SqlDbType.Int).Value = RoleID
                cmd.Connection = con
                con.Open()

                cmd.ExecuteNonQuery()

                con.Close()
            End Using
        End Using
    End Sub

    <WebMethod()>
    Public Sub SendMessage(msg_to As String, msg_from As String, msg As String)

        Using con As New SqlConnection(StrConnection)
            Using cmd As New SqlCommand("crud_Message_Insert")
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.Add("@msg_to", SqlDbType.NVarChar).Value = msg_to
                cmd.Parameters.Add("@msg_from", SqlDbType.NVarChar).Value = msg_from
                cmd.Parameters.Add("@msg", SqlDbType.NVarChar).Value = msg
                cmd.Parameters.Add("@sended_time", SqlDbType.NVarChar).Value = DateTime.Now

                cmd.Connection = con
                con.Open()

                cmd.ExecuteNonQuery()

                con.Close()
            End Using
        End Using

    End Sub

    '<WebMethod()> _      
    'Public Function GetReciveMessages(tbl_msg As DataTable)

    '    tbl_msg.Clear()

    '    If _myConnection2.State = ConnectionState.Closed Then _myConnection2.Open()

    '    Dim q As String = "SELECT * from User_Message Where [To] = '" + User.Identity.Name + "'"

    '    Dim adap As New SqlDataAdapter(q, _myConnection2)
    '    adap.Fill(tbl_msg)
    '    adap.Dispose()
    '    If _myConnection2.State = ConnectionState.Open Then _myConnection2.Close()
    '    Return tbl_msg
    'End Function

    <WebMethod()>
    Public Function GetSoftwareModules(username As Int32) As DataTable
        Dim dt As New DataTable
        dt.TableName = "tblSoftModules"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim q As String = "SELECT DISTINCT SoftwareModules.SoftwareModuleID FROM UserSoftwareModuleAccesability INNER JOIN SoftwareModules ON UserSoftwareModuleAccesability.SoftwareModuleID = SoftwareModules.SoftwareModuleID INNER JOIN Users ON UserSoftwareModuleAccesability.UserID = '" + username.ToString() + "'"

        Dim adap As New SqlDataAdapter(q, _myConnection)
        adap.Fill(dt)
        adap.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
        Return dt
    End Function

    <WebMethod()>
    Public Function GetAllSoftModules() As DataTable
        Dim dt As New DataTable
        dt.TableName = "tblAllSoftModules"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim q As String = "SELECT * FROM SoftwareModules"
        Dim adap As New SqlDataAdapter(q, _myConnection)
        adap.Fill(dt)
        adap.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Return dt
    End Function

    <WebMethod()>
    Public Function GetPermissions(useridentity As String) As Int32
        Dim UserID As Int32 = 0
        Using con As New SqlConnection(StrConnection)
            Using cmd As New SqlCommand("spUserRolePermissinUserID")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 64).Value = useridentity
                cmd.Parameters.Add("@userID", SqlDbType.Int).Direction = ParameterDirection.Output
                cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                UserID = cmd.Parameters("@userID").Value
                con.Close()
            End Using
        End Using
        Return UserID
    End Function
    <WebMethod()>
    Public Function GetNonActivatedUsers() As DataTable
        Dim dt As New DataTable
        dt.TableName = "tblNonActivatedUsers"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

        Dim q As String = "SELECT DISTINCT * FROM Users WHERE UserID NOT IN (SELECT UserID FROM UserSoftwareModuleAccesability)"
        Dim adap As New SqlDataAdapter(q, _myConnection)
        adap.Fill(dt)
        adap.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Return dt
    End Function


    <WebMethod()>
    Public Function LoadUserFavorites(useridentity As String) As DataTable
        Dim dt As New DataTable
        dt.TableName = "tblUserFavorites"

        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()

        Dim q As String = "SELECT * from Users_Favorite INNER JOIN SoftwareModules ON Users_Favorite.Link = SoftwareModules.WebLink Where Users_Favorite.User_Name = '" + useridentity + "'"

        Dim adap As New SqlDataAdapter(q, _myConnection)
        adap.Fill(dt)
        adap.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
        Return dt
    End Function

    <WebMethod()>
    Public Sub SendOfflineStatus(useridentity As String)
        'Dim now As DateTime = DateTime.now
        'now.ToString("yyyy/MM/dd HH:mm:ss")

        'Dim query As String = "Update Users Set OnlineStatus='False' WHERE Username='" & useridentity & "'"
        'If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        'Dim cmd As New SqlCommand(query, _myConnection)
        'cmd.ExecuteNonQuery()
        'cmd.Dispose()
        'If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub
    <WebMethod()>
    Public Sub SendOnlineStatus(useridentity As String)
        Dim now As DateTime = DateTime.now
        now.ToString("yyyy/MM/dd HH:mm:ss")
        Dim query As String = "Update Users Set OnlineStatus='true', LastLogin='"& now &"' WHERE Username='" & useridentity & "'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub
    <WebMethod()>
    Public Function LoadOtherUserProfiles(useridentity As String) As DataTable
        Dim dt As New DataTable
        dt.TableName="tblOtherUsers"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim q As String = "SELECT * from Users WHERE Username <> '"+useridentity+"' ORDER BY OnlineStatus DESC"
        Dim adap As New SqlDataAdapter(q, _myConnection)
        adap.Fill(dt)
        adap.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()

        Return dt
    End Function

    <WebMethod()>
    Public Sub RemoveUserImage(useridentity As String)
        Dim query As String = "Update Users Set Image=NULL WHERE Username='" & useridentity & "'"
        If _myConnection.State = ConnectionState.Closed Then _myConnection.Open()
        Dim cmd As New SqlCommand(query, _myConnection)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        If _myConnection.State = ConnectionState.Open Then _myConnection.Close()
    End Sub
End Class