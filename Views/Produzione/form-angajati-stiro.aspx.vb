
Imports System.Data
Imports System.Data.SqlClient

Partial Class form_angajati_stiro
    Inherits System.Web.UI.Page
    Const StrConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
    Public MyConnection As New SqlConnection(StrConnection)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'cal_date_assign.Text = DateTime.Now.ToString("yyyy-MM-dd")

        Checking_System(Nothing, Nothing)
    End Sub

    Protected Sub TaskGridView_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        ' Use the CopyTo method to copy the DictionaryEntry objects in the 
        ' NewValues collection to an array.
        Dim records(e.NewValues.Count - 1) As DictionaryEntry
        e.NewValues.CopyTo(records, 0)
        ' Iterate through the array and HTML encode all user-provided values 
        ' before updating the data source.
        Dim entry As DictionaryEntry
        For Each entry In records
            e.NewValues(entry.Key) = Server.HtmlEncode(entry.Value.ToString())
        Next
    End Sub
    Protected Sub TaskGridView_RowDeleteing(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        For Each row As DataRow In _dtverify.Rows
            'txt_ang1_code.Text = (row.Item(0)).ToString()
        Next
    End Sub

    Protected Sub ConfA_Grid_DataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(0).Visible = False

        'If (e.Row.RowState And DataControlRowState.Edit) > 0 Then
        '    e.Row.Cells(0).Focus()
        'End If
        'If e.Row.RowType <> DataControlRowType.DataRow Then
        '    Return
        'End If
        'Dim updateButton = DirectCast(e.Row.Cells(0).Controls(0), LinkButton)
        'If updateButton.Text = "Update" Then
        '    updateButton.OnClientClick = "return confirm('Do you really want to update?');"
        'End If
        'Dim deleteButton = DirectCast(e.Row.Cells(0).Controls(2), LinkButton)
        'If deleteButton.Text = "Delete" Then
        '    deleteButton.OnClientClick = "return confirm('Do you really want to delete?');"
        'End If

    End Sub

    Dim _dtverify As New DataTable

    Public Sub Checking_System(sender As Object, e As EventArgs)

        _dtverify.Clear()
        Const q = "SELECT TOP 1 CodAngajat FROM Angajati ORDER BY CodAngajat DESC"
        If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
        Dim cmd = New SqlCommand(q, MyConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader()

        _dtverify.Load(dr)
        dr.Close()
        cmd.Dispose()

        If MyConnection.State = ConnectionState.Open Then MyConnection.Close()


        For Each row As DataRow In _dtverify.Rows
            'txt_ang1_code.Text = (row.Item(0) + 1).ToString()
        Next

    End Sub

    'Public Sub Update_grid(sender As Object, e As EventArgs) Handles btn_adduser.Click
    '    Dim query As String = String.Empty
    '    Dim mycommand As New SqlCommand
    '    query = "INSERT INTO Angajati (CodAngajat,Angajat,Sex,DataNasterii,DataAngajarii,status,Linie,IdSector) VALUES (@codang,@txt_ang_name1,@txt_ang_sex,@txt_ang_date1,@txt_ang_date2,@status,@Linie,@IdSector)"

    '    Using conn As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
    '        Using comm As New SqlCommand()
    '            With comm
    '                .Connection = conn
    '                .CommandType = CommandType.Text
    '                .CommandText = query
    '                .Parameters.Add("@txt_ang_name1", SqlDbType.NVarChar).Value = (txt_ang1_lastname.Text & " " & txt_ang1_name.Text).ToString()
    '                .Parameters.Add("@txt_ang_sex", SqlDbType.NVarChar).Value = txt_ang1_sex.Text
    '                .Parameters.Add("@txt_ang_date1", SqlDbType.NVarChar).Value = cal_date_assign.Text
    '                .Parameters.Add("@txt_ang_date2", SqlDbType.NVarChar).Value = cal_date_assign.Text
    '                .Parameters.Add("@status", SqlDbType.Bit).Value = 1
    '                .Parameters.Add("@Linie", SqlDbType.NVarChar).Value = ddl_Line.SelectedItem.ToString()
    '                .Parameters.Add("@IdSector", SqlDbType.Float).Value = ddl_Sector.SelectedValue.ToString()
    '                .Parameters.Add("@codang", SqlDbType.VarChar).SqlValue = txt_ang1_code.Text

    '            End With
    '            Try
    '                conn.Open()
    '                comm.ExecuteNonQuery()

    '                ConfA_Grid.DataBind()
    '                'MsgBox("Succsess")
    '            Catch ex As Exception
    '                'MsgBox("Error Message" + ex.ToString())
    '            End Try
    '        End Using
    '    End Using

    '    Checking_System(Nothing, Nothing)

    'End Sub
End Class