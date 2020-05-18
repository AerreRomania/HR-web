
Partial Class form_exacta
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
End Class
