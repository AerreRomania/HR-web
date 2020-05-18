
Imports System.Data
Imports System.Data.SqlClient

Partial Class form_tabletserials
    Inherits System.Web.UI.Page
    ReadOnly _connection As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
    Dim tbl_angajati As New DataTable
    Dim tbl_line As New DataTable
    Dim tbl_all As New DataTable
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        LoadInfosAngajati(_connection)
        'LoadInfosLine(_connection)
        LoadInfosTablets(_connection)
        If Page.IsPostBack = False
            FillDropdowns()
        End If
    End Sub

    Private Sub LoadInfosAngajati(con As SqlConnection)
        If _connection.State = ConnectionState.Closed Then _connection.Open()
        tbl_angajati.Clear()

        Const q  = "SELECT * from Angajati WHERE IdDepartament in ('2','5')"
        Dim cmd = New SqlDataAdapter(q, con)
        cmd.Fill(tbl_angajati)
        cmd.Dispose()
        If _connection.State = ConnectionState.Open Then _connection.Close()
    End Sub

    Private Sub LoadInfosLine(con As SqlConnection)
        If _connection.State = ConnectionState.Closed Then _connection.Open()
        tbl_line.Clear()

        Const q  = "SELECT CodLinie from Linii"
        Dim cmd = New SqlDataAdapter(q, con)
        cmd.Fill(tbl_line)
        cmd.Dispose()
        If _connection.State = ConnectionState.Open Then _connection.Close()
    End Sub

    Dim liConfA As List(Of Object)
    Dim liConfB As List(Of Object)
    Private Sub LoadInfosTablets(con As SqlConnection)
        If _connection.State = ConnectionState.Closed Then _connection.Open()
        tbl_all.Clear()

        Const q  = "SELECT * FROM TabletInformations"
        Dim cmd = New SqlDataAdapter(q, con)
        cmd.Fill(tbl_all)
        cmd.Dispose()
        If _connection.State = ConnectionState.Open Then _connection.Close()


        'For each row As DataRow In tbl_all.Rows
        '    If row(2).ToString = "A1"
        '        liConfA.Add(row(1).ToString)
        '    End If
        'Next

        'Dim dwa As DataView = New DataView(tbl_all)
        ''dwa.FindRows("A1")
        'dwa.Sort= "A1"
        'tot_conf_a.Text = dwa.Count.ToString

    End Sub


    'GRID START
    Public Sub Grid_DataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(1).Visible = False
        e.Row.Cells(0).Attributes.Add("style","width:100px;")
    End Sub

    Protected Sub TaskGridView_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        'Dim records(e.NewValues.Count - 1) As DictionaryEntry
        'e.NewValues.CopyTo(records, 0)
        'Dim entry As DictionaryEntry
        'For Each entry In records
        '    e.NewValues(entry.Key) = Server.HtmlEncode(entry.Value.ToString())
        'Next
    End Sub

    Protected Sub TaskGridView_RowDeleteing(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        'For Each row As DataRow In _dtverify.Rows
        '    txt_machine_code.Text = (row.Item(0)).ToString()
        'Next
    End Sub
    'GRID END

    Dim liNames As New List(Of Object)


    Private Sub FillDropdowns()
            For each row As DataRow In tbl_angajati.Rows
                liNames.Add(row(4).ToString + " " + row(5).ToString)
            Next

            liNames.Sort()
            'ddl_name.DataSource = liNames
            'ddl_name.DataBind()
            'ddl_name.Items.Insert(0, new ListItem(String.Empty, String.Empty))
            'ddl_name.SelectedIndex = 0

    End Sub

    'NA KLIK PROVERI DA LI POSTOJI ako ne postoji dodaj.
    Private sub AddSerial(sender As Object,e As EventArgs) Handles btn_addtabletserial.Click

            Dim queryString As String = "INSERT INTO TabletInformations (FullName, Line, SerialNumber, TabletMark, Description) VALUES ('"+ txtFullName.text +"','"+ddl_Line.SelectedValue +"', '"+txt_serial.Text+"', '"+ddl_tablet_mark.SelectedValue +"', '"+txt_description.Text+"') "
            Dim command As New SqlCommand(queryString, _connection)
            _connection.Open()
            command.ExecuteNonQuery()
            _connection.Close()

            gv_all.DataBind()
            txt_serial.Text = ""
            txtFullName.Text = ""
    End sub
End Class
