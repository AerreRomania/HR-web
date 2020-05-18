
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing

Partial Class form_faze
    Inherits System.Web.UI.Page



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
        'For Each row As DataRow In _dtverify.Rows
        '    txt_ang1_code.Text = (row.Item(0)).ToString()
        'Next
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

    'Public Sub Update_grid(sender As Object, e As EventArgs) Handles btn_adduser.Click
    '    Dim query As String = String.Empty
    '    Dim mycommand As New SqlCommand
    '    query = "INSERT INTO Operatii (CodOperatie,Operatie,PozRaport,isPasiv,IdSector) VALUES (@CodOperatie,@Operatie,@PozRaport,@isPasiv,@IdSector)"

    '    Using conn As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
    '        Using comm As New SqlCommand()
    '            With comm
    '                .Connection = conn
    '                .CommandType = CommandType.Text
    '                .CommandText = query
    '                .Parameters.Add("@CodOperatie", SqlDbType.Int).Value = Convert.ToInt32(txt_code.Text)
    '                .Parameters.Add("@Operatie", SqlDbType.VarChar).Value = txt_operatie.Text
    '                .Parameters.Add("@PozRaport", SqlDbType.Int).Value = 0
    '                .Parameters.Add("@isPasiv", SqlDbType.Bit).Value = 0
    '                .Parameters.Add("@IdSector", SqlDbType.Int).Value = 1

    '            End With
    '            Try
    '                conn.Open()
    '                comm.ExecuteNonQuery()

    '                ConfA_Grid.DataBind()
    '                lbl_status.Text = "Faze Succssesfuly Added!"
    '                lbl_status.ForeColor = Color.Green
    '                'MsgBox("Succsess")
    '            Catch ex As Exception
    '                MsgBox("Error Message" + ex.ToString())
    '            End Try
    '        End Using
    '    End Using
    'End Sub

End Class
