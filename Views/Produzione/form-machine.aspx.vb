
Imports System.Data
Imports System.Data.SqlClient

Partial Class form_machine_confezione
    Inherits System.Web.UI.Page

    Const StrConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
    Public MyConnection As New SqlConnection(StrConnection)
    Dim _dtverify As New DataTable
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Checking_System(Nothing, Nothing)
    End Sub

    Protected Sub Conf_Grid_DataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(1).Visible = False

        If (e.Row.RowState And DataControlRowState.Edit) > 0 Then
            e.Row.Cells(0).Focus()
        End If

        If e.Row.RowType <> DataControlRowType.DataRow Then
            Return
        End If

        Dim updateButton = DirectCast(e.Row.Cells(0).Controls(0), LinkButton)
        If updateButton.Text = "Update" Then
            updateButton.OnClientClick = "return confirm('Do you really want to update?');"
        End If

        Dim deleteButton = DirectCast(e.Row.Cells(0).Controls(2), LinkButton)
        If deleteButton.Text = "Delete" Then
            deleteButton.OnClientClick = "return confirm('Do you really want to delete?');"
        End If

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
            txt_machine_code.Text = (row.Item(0)).ToString()
        Next
    End Sub

    Public Sub Checking_System(sender As Object, e As EventArgs)

        _dtverify.Clear()
        Const q = "SELECT TOP 1 Adresa FROM Masini ORDER BY Adresa DESC"
        If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
        Dim cmd = New SqlCommand(q, MyConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader()

        _dtverify.Load(dr)
        dr.Close()
        cmd.Dispose()

        If MyConnection.State = ConnectionState.Open Then MyConnection.Close()


        For Each row As DataRow In _dtverify.Rows

            txt_machine_code.Text = (row.Item(0) + 1).ToString()


            If row.Item(0) = 999 Then
                txt_machine_code.Text = "Contact Administrator!"
            End If

        Next

    End Sub


    Public Sub Update_grid(sender As Object, e As EventArgs) Handles btn_addmachine.Click
        Dim query As String = String.Empty
        Dim mycommand As New SqlCommand
        query = "INSERT INTO Masini (CodMasina,Adresa,Descriere,Linie,Buton,BucatiButon,Realizare,IdSector,Active) VALUES (@codemasina,@adresa,@descriere,@linie,@buton,@bucatibutton,@realizare,@idsector,@active)"

        Using conn As New SqlConnection("Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias")
            Using comm As New SqlCommand()
                With comm
                    .Connection = conn
                    .CommandType = CommandType.Text
                    .CommandText = query
                    .Parameters.Add("@codemasina", SqlDbType.VarChar).Value = (txt_machine_suf.Text + txt_machine_code.Text).ToString()
                    .Parameters.Add("@adresa", SqlDbType.VarChar).Value = txt_machine_code.Text
                    .Parameters.Add("@descriere", SqlDbType.VarChar).Value = txt_lavoro.Text
                    .Parameters.Add("@linie", SqlDbType.VarChar).Value = ddl_Line.SelectedItem.ToString()
                    .Parameters.Add("@buton", SqlDbType.Bit).Value = 0
                    .Parameters.Add("@bucatibutton", SqlDbType.Int).Value = Convert.ToInt32(txt_ang1_code.Text)
                    .Parameters.Add("@realizare", SqlDbType.Int).Value = -1
                    .Parameters.Add("@idsector", SqlDbType.Int).Value = 1
                    .Parameters.Add("@active", SqlDbType.Bit).SqlValue = 0

                End With

                Try
                    conn.Open()
                    comm.ExecuteNonQuery()
                    ConfA_Grid.DataBind()

                Catch ex As Exception
                    MsgBox(ex.ToString())
                End Try

            End Using
        End Using

        Checking_System(Nothing, Nothing)

    End Sub
End Class
