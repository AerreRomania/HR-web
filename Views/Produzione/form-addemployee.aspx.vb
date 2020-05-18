
Imports System.Data.SqlClient

Partial Class form_addemployee
    Inherits System.Web.UI.Page

    Shared ReadOnly _myConnection As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'cal_date_assign.Text = DateTime.Now.ToString("yyyy-MM-dd")
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


    'Public Sub Update_grid(sender As Object,e As EventArgs) Handles btn_adduser.Click
    '    Dim query As String = String.Empty
    '    Dim mycommand As New SqlCommand
    '    query = "INSERT INTO Organizator (Name,DateAssig,Line,Lavoro,Other,Inderect,Active,IdSector,NameSector,Turno,ShortJob) VALUES (@txt_usr_name1,@cal_date_assign1,@ddl_Line1,@ddl_Lavoro1,@txt_usr_other1,@Inderect1,@Active1,@ddl_Sector1,@ddl_Sector_Name1,@txt_usr_turno1,@txt_shortjob)"

    '    Using conn As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
    '        Using comm As New SqlCommand()
    '            With comm
    '                .Connection = conn
    '                .CommandType = CommandType.Text
    '                .CommandText = query
    '                .Parameters.Add("@txt_usr_name1", SqlDbType.NVarChar).Value = (txt_usr_surname.Text & " " & txt_usr_name.Text).ToString()
    '                .Parameters.Add("@cal_date_assign1", SqlDbType.NVarChar).Value = (cal_date_assign.Text).ToString()
    '                .Parameters.Add("@ddl_Line1", SqlDbType.NVarChar).Value = ddl_Line.SelectedItem.ToString()
    '                .Parameters.Add("@ddl_Lavoro1", SqlDbType.NVarChar).Value = ddl_Lavoro.SelectedItem.ToString()
    '                .Parameters.Add("@Inderect1", SqlDbType.Int).Value = 0
    '                .Parameters.Add("@Active1", SqlDbType.Bit).Value = 0
    '                .Parameters.Add("@ddl_Sector1", SqlDbType.Int).Value = ddl_Sector.SelectedValue
    '                .Parameters.Add("@ddl_Sector_Name1", SqlDbType.NVarChar).Value = ddl_Sector.SelectedItem.ToString()
    '                .Parameters.Add("@txt_usr_other1", SqlDbType.NVarChar).Value = txt_usr_other.text
    '                .Parameters.Add("@txt_usr_turno1", SqlDbType.Int).Value = txt_usr_turno.Text
    '                .Parameters.Add("@txt_shortjob", SqlDbType.Int).Value = "8"
    '            End With
    '            Try
    '                conn.Open()
    '                comm.ExecuteNonQuery()

    '                ConfA_Grid.DataBind()
    '                ConfB_Grid.DataBind()

    '                'MsgBox("Succsess")
    '            Catch ex As Exception
    '                'Console.("Error Message" + ex.ToString())
    '           End Try
    '        End Using
    '    End Using

    '    'ConfA_Grid.DataSource(CustomersSqlDataSourceArticle)
    'End Sub


    Protected Sub ConfA_Grid_DataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(0).Visible = False

        'If (e.Row.RowState And DataControlRowState.Edit) > 0 Then

        '    e.Row.Cells(0).Focus()

        'End If



        'If e.Row.RowType <> DataControlRowType.DataRow Then
        '     Return
        '    End If
        '    Dim updateButton = DirectCast(e.Row.Cells(0).Controls(0), LinkButton)
        '    If updateButton.Text = "Update" Then
        '     updateButton.OnClientClick = "return confirm('Do you really want to update?');"
        '    End If
        '    Dim deleteButton = DirectCast(e.Row.Cells(0).Controls(2), LinkButton)
        '    If deleteButton.Text = "Delete" Then
        '     deleteButton.OnClientClick = "return confirm('Do you really want to delete?');"
        '    End If

    End Sub



End Class