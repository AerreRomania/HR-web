Imports System.Data
'Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Web.Configuration
Imports Telerik.Web.UI

Imports System.Web.UI.WebControls
Imports xi = Telerik.Web.UI.ExportInfrastructure
Imports System.Web.UI
Imports System.Web
Imports Telerik.Web.UI.GridExcelBuilder
Imports System.Drawing
Partial Class form_timbrature_new
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Dim datee As DateTime = DateTime.Now
            datee.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture)
            RadDatePicker1.SelectedDate = datee
            RadDatePicker2.SelectedDate = datee
            RadGrid1.DataSource = SqlDataSource1
            RadGrid1.MasterTableView.GetColumn("isPausaAndLate").Display = false
            RadGrid1.MasterTableView.GetColumn("IsLate").Display = false


        Else
            RadGrid1.MasterTableView.GetColumn("isPausaAndLate").Display = false
            RadGrid1.MasterTableView.GetColumn("IsLate").Display = false


            RadGrid1.DataSource = SqlDataSource1
        End If


    End Sub

    'Get the first day of the month
    Public Function FirstDayOfMonth(ByVal sourceDate As DateTime) As DateTime
        Return New DateTime(sourceDate.Year, sourceDate.Month, 1)
    End Function

    'Get the last day of the month
    Public Function LastDayOfMonth(ByVal sourceDate As DateTime) As DateTime
        Dim lastDay As DateTime = New DateTime(sourceDate.Year, sourceDate.Month, 1)
        Return lastDay.AddMonths(1).AddDays(-1)
    End Function


    ReadOnly _myConnection As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
    Dim dt As New DataTable

    Public Sub LoadData() Handles btnLoad.Click
        RadGrid1.DataSource = SqlDataSource1
        RadGrid1.DataBind()
    End Sub

    Private Sub RadGrid1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadGrid1.Init
        Dim menu As GridFilterMenu = RadGrid1.FilterMenu
        Dim i As Integer = 0
        'SetCurrentFilterforGrid(RadGrid1)

        While i < menu.Items.Count
            If menu.Items(i).Text = "NoFilter" Or
               menu.Items(i).Text = "Contains" Or
               menu.Items(i).Text = "EqualTo" Then
                i = i + 1
            Else
                menu.Items.RemoveAt(i)
            End If

        End While


    End Sub
    Public Shared Sub SetCurrentFilterforGrid(ByRef RadGrid1 As RadGrid)
        For Each column As GridColumn In RadGrid1.Columns
            column.CurrentFilterFunction = GridKnownFunction.Contains

            'if (column.UniqueName = "isPausaAndLate" ) Then
            '    column.Visible=False
            'End If
        Next
     End Sub

    Protected Sub RadGrid1_DataBound(sender As Object, e As EventArgs)

       'For Each row As GridColumn In RadGrid1.Tables
       '     if row.HeaderText.Equals("MANSIONE:")
       '         row.
       '     End If

       'Next

    End Sub
End Class
