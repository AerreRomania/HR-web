
Imports System.Data
Imports System.Data.SqlClient

Partial Class form_article
    Inherits System.Web.UI.Page

    Shared ReadOnly _myConnection As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

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




    Protected Sub ConfA_Grid_DataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(0).Visible = False

        'If (e.Row.RowState And DataControlRowState.Edit) > 0 Then

        '    e.Row.Cells(0).Focus()

        'End If

        
            'If e.Row.RowType <> DataControlRowType.DataRow Then
	           ' Return
            'End If
            'Dim updateButton = DirectCast(e.Row.Cells(0).Controls(0), LinkButton)
            'If updateButton.Text = "Update" Then
	           ' updateButton.OnClientClick = "return confirm('Do you really want to update?');"
            'End If
            'Dim deleteButton = DirectCast(e.Row.Cells(0).Controls(2), LinkButton)
            'If deleteButton.Text = "Delete" Then
	           ' deleteButton.OnClientClick = "return confirm('Do you really want to delete?');"
            'End If

    End Sub


    'Public Sub Update_grid(sender As Object,e As EventArgs) Handles btn_adduser.Click
    '    Dim query As String = String.Empty
    '    Dim mycommand As New SqlCommand
    '    query = "INSERT INTO Articole (Articol,Descriere,CostProductie,IdStagiune,Finete,Prezzo,IdSector,Centes,Stagione) VALUES (@txt_art_name1,@txt_art_descript1,@ddl_Sector1,@txt_art_cost1,@txt_art_idstag1,@txt_art_finete1,@txt_art_prezzo1,@txt_art_centes1,@txt_art_stagione1)"

    '    Using conn As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
    '        Using comm As New SqlCommand()
    '            With comm
    '                .Connection = conn
    '                .CommandType = CommandType.Text
    '                .CommandText = query
    '                .Parameters.Add("@txt_art_name1", SqlDbType.NVarChar).Value = txt_art_name.Text
    '                .Parameters.Add("@txt_art_descript1", SqlDbType.NVarChar).Value = txt_art_descript.Text
    '                .Parameters.Add("@ddl_Sector1", SqlDbType.Int).Value = ddl_Sector.SelectedValue
    '                .Parameters.Add("@txt_art_cost1", SqlDbType.Float).Value = txt_art_cost.Text
    '                .Parameters.Add("@txt_art_idstag1", SqlDbType.Int).Value = txt_art_idstag.Text
    '                .Parameters.Add("@txt_art_finete1", SqlDbType.NVarChar).Value = txt_art_finete.Text
    '                .Parameters.Add("@txt_art_prezzo1", SqlDbType.Float).Value = txt_art_prezzo.Text
    '                .Parameters.Add("@txt_art_centes1", SqlDbType.Float).Value = txt_art_centes.Text
    '                .Parameters.Add("@txt_art_stagione1", SqlDbType.NVarChar).Value = txt_art_stagione.Text

    '            End With
    '            Try
    '                conn.Open()
    '                comm.ExecuteNonQuery()

    '                ConfA_Grid.DataBind()
    '                'MsgBox("Succsess")
    '            Catch ex As Exception
    '                'MsgBox("Error Message" + ex.ToString())
    '           End Try
    '        End Using
    '    End Using

    '    'ConfA_Grid.DataSource(CustomersSqlDataSourceArticle)
    'End Sub

End Class
