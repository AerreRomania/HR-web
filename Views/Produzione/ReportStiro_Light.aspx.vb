Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports SimplexWeb.Reports

Partial Class ReportStiro
    Inherits System.Web.UI.Page
    Const StrConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
    Public MyConnection As New SqlConnection (StrConnection)
    ReadOnly _tblData As New DataTable

     Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        _tblData.Clear()
        _tblDataSecond.Clear()

        GettingData()

        FillGrdis()
        
    End Sub
 
     Sub GettingData()
        _tblData.Clear()
            Const q = "Select  Line,Name,Lavoro,Active, Other, Turno from Organizator where  IdSector=2 AND Other <> 'Maternita' AND Other <> 'Malatia' ORDER BY Lavoro "
            If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
            Dim cmd = New SqlCommand(q, MyConnection)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
                _tblData.Load(dr)
                dr.Close()
                cmd.Dispose()
                _tblData.Dispose()
            If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

     End Sub
    ReadOnly _tblDataSecond As New DataTable
    ReadOnly test As Reports = New Reports(_tblData)

    Sub FillGrdis()
        
        ConfA_OtherGrids
        ConfB_OtherGrids

        ConfA_MainGrids
        ConfB_MainGrids
    End Sub

    Private Sub ConfA_OtherGrids
        'TECHNICHE A
         Dim viewATechniche As DataView = New DataView(_tblData)
            viewATechniche.RowFilter = "Lavoro='Tecchnice'"

        dgvTechnicheA.DataSource = test.ValuesByLavoro("Tecchnice")
        dgvTechnicheA.DataBind()

        'Uffico
        Dim viewAUffico As DataView = New DataView(_tblData)
            viewAUffico.RowFilter = "Other='Ufficio' OR Lavoro='tempi e metodi'"

        dgvUffico.DataSource = test.ValuesByOther("Ufficio")
        dgvUffico.DataBind()

        'Controlo Qualita
        Dim viewACQ As DataView = New DataView(_tblData)
            viewACQ.RowFilter = "Other='CQ'"

        dgvCQA.DataSource = test.ValuesByOther("CQ")
        dgvCQA.DataBind()

        'Rammendo
        Dim viewARamA As DataView = New DataView(_tblData)
            viewARamA.RowFilter = "Other='Abaco'"

        dgvRamA.DataSource = test.ValuesByOther("Abaco")
        dgvRamA.DataBind()

        'Meccanico
        Dim viewAMecc As DataView = New DataView(_tblData)
            viewAMecc.RowFilter = "Other='Meccanico'"

            'dgvMeccanico.DataSource = test.ValuesByOther("meccanico")
            'dgvMeccanico.DataBind()

         'Maggazioneri
         Dim viewAMaggazio As DataView = New DataView(_tblData)
            viewAMaggazio.RowFilter = "Lavoro='Magazzioneri'"

        'dgvMagazioneri.DataSource = test.ValuesByLavoro("Magazzioneri")
        'dgvMagazioneri.DataBind()

        'Pulzie
        Dim viewAPulzie As DataView = New DataView(_tblData)
            viewAPulzie.RowFilter = "Other='Pulizia'"

            'dgvPulizia.DataSource = test.ValuesByOther("Pulizia")
            'dgvPulizia.DataBind()

        _tblData.Dispose()
    End Sub

    Private Sub ConfB_OtherGrids
        'TECHNICHE A
        Dim viewATechniche As DataView = New DataView(_tblData)
        viewATechniche.RowFilter = "Lavoro='Tecchnice'"

        dgvTechnicheA.DataSource = test.ValuesByLavoro("Tecchnice")
        dgvTechnicheA.DataBind()

        'Uffico
        Dim viewAUffico As DataView = New DataView(_tblData)
        viewAUffico.RowFilter = "Other='Ufficio' OR Lavoro='tempi e metodi'"

        dgvUffico.DataSource = test.ValuesByOther("Ufficio")
        dgvUffico.DataBind()

        'Controlo Qualita
        Dim viewACQ As DataView = New DataView(_tblData)
        viewACQ.RowFilter = "Other='CQ'"

        dgvCQA.DataSource = test.ValuesByOther("CQ")
        dgvCQA.DataBind()

        'Rammendo
        Dim viewARamA As DataView = New DataView(_tblData)
        viewARamA.RowFilter = "Lavoro='Rammendo' OR Other='Rammendo'"

        dgvRamA.DataSource = test.ValuesByOther("Abaco")
        dgvRamA.DataBind()

        'dgvRamB.DataSource = viewARamA
        'dgvRamB.DataBind()

        'Meccanico
        Dim viewAMecc As DataView = New DataView(_tblData)
        viewAMecc.RowFilter = "Other='Meccanico'"

        'dgvMeccanicoB.DataSource = viewAMecc
        'dgvMeccanicoB.DataBind()

        'Maggazioneri
        Dim viewAMaggazio As DataView = New DataView(_tblData)
        viewAMaggazio.RowFilter = "Lavoro='Magazzioneri'"

        'dgvMagazioneriB.DataSource = test.ValuesByLavoro("Magazzioneri")
        'dgvMagazioneriB.DataBind()

        'Pulzie
        Dim viewAPulzie As DataView = New DataView(_tblData)
        viewAPulzie.RowFilter = "Other='Pulizia'"
        _tblData.Dispose()
        'dgvPuliziaB.DataSource = viewAPulzie
        'dgvPuliziaB.DataBind()
    End Sub

    Private Sub ConfA_MainGrids

        Dim dt As New DataTable("MyTable")
        Dim column As New DataColumn("Col", GetType(Integer))
        dt.Columns.Add(column)

        ' Add 5 rows on Added state 
        For i As Integer = 0 To 4
            Dim row As DataRow = dt.NewRow()
            row("Col") = i
            dt.Rows.Add(row)
        Next
        
       Dim viewA1 As DataView = New DataView(_tblData)
            viewA1.RowFilter = "Line='LINEA1' and Turno='1' "
             lblPTL1A.Text = "PT:" & viewA1.Count
        
        Dim viewPPA1 As DataView = New DataView(_tblData)
            viewPPA1.RowFilter = "Line='LINEA1' and Active='True' and Turno='1' "
            lblPPL1A.Text = "PP:" & viewPPA1.Count
            lblPPL1A.ForeColor = Color.DarkSlateGray

        Dim viewASSA1 As DataView = New DataView(_tblData)
            viewASSA1.RowFilter = "Line='LINEA1' and Active='False' and Turno='1'"
            lblASL1A.Text = "AS:" &  viewASSA1.Count
            lblASL1A.ForeColor = Color.Red
     
            dgvA1.DataSource = test.ValuesByLineStiro("LINEA1","1")
            dgvA1.DataBind()

        'L2 A
        Dim viewA2 As DataView = New DataView(_tblData)
            viewA2.RowFilter = "Line='LINEA2' and Turno='1'"
            lblPTL2A.Text = "PT:" & viewA2.Count

        Dim viewPPA2 As DataView = New DataView(_tblData)
            viewPPA2.RowFilter = "Line='LINEA2' and Active='True' and Turno='1'"
            lblPPL2A.Text = "PP:" & viewPPA2.Count
            lblPPL2A.ForeColor = Color.DarkSlateGray

        Dim viewASSA2 As DataView = New DataView(_tblData)
            viewASSA2.RowFilter = "Line='LINEA2' and Active='False' and Turno='1'"
            lblASL2A.Text = "AS:" &  viewASSA2.Count
            lblASL2A.ForeColor = Color.Red

            dgvA2.DataSource = test.ValuesByLineStiro("LINEA2","1")
            dgvA2.DataBind()

        'L3 A
        Dim viewA3 As DataView = New DataView(_tblData)
            viewA3.RowFilter = "Line='LINEA3' and Turno='1'"
            lblPTL3A.Text = "PT:" & viewA3.Count

        Dim viewPPA3 As DataView = New DataView(_tblData)
            viewPPA3.RowFilter = "Line='LINEA3' and Active='True' and Turno='1'"
            lblPPL3A.Text = "PP:" & viewPPA3.Count
            lblPPL3A.ForeColor = Color.DarkSlateGray

        Dim viewASSA3 As DataView = New DataView(_tblData)
            viewASSA3.RowFilter = "Line='LINEA3' and Active='False' and Turno='1'"
            lblASL3A.Text = "AS:" &  viewASSA3.Count
            lblASL3A.ForeColor = Color.Red

             dgvA3.DataSource = test.ValuesByLineStiro("LINEA3","1")
             dgvA3.DataBind()
      
        _tblData.Dispose()

        lbltotConfAPT.Text = (viewA1.Count + viewA2.Count + viewA3.Count).ToString()
        lbltotConfAPP.Text =  (viewPPA1.Count + viewPPA2.Count + viewPPA3.Count).ToString()
        lbltotConfAASS.Text =   (viewASSA1.Count + viewASSA2.Count + viewASSA3.Count).ToString()
    End Sub

    Private Sub ConfB_MainGrids

        'L1 B
        Dim viewB1 As DataView = New DataView(_tblData)
        viewB1.RowFilter = "Line='LINEA1' and Turno='2' "
        lblPTL1B.Text = "PT:" & viewB1.Count
        
        Dim viewPPB1 As DataView = New DataView(_tblData)
        viewPPB1.RowFilter = "Line='LINEA1' and Active='True' and Turno='2' "
        lblPPL1B.Text = "PP:" & viewPPB1.Count
        lblPPL1B.ForeColor = Color.DarkSlateGray

        Dim viewASSB1 As DataView = New DataView(_tblData)
        viewASSB1.RowFilter = "Line='LINEA1' and Active='False' and Turno='2' "
        lblASL1B.Text = "AS:" &  viewASSB1.Count
        lblASL1B.ForeColor = Color.Red

        dgvB1.DataSource = test.ValuesByLineStiro("LINEA1","2")
        dgvB1.DataBind()

        'L2 B
        Dim viewB2 As DataView = New DataView(_tblData)
        viewB2.RowFilter = "Line='LINEA2' and Turno='2' "
        lblPTL2B.Text = "PT:" & viewB2.Count

        Dim viewPPB2 As DataView = New DataView(_tblData)
        viewPPB2.RowFilter = "Line='LINEA2' and Active='True' and Turno='2' "
        lblPPL2B.Text = "PP:" & viewPPB2.Count
        lblPPL2B.ForeColor = Color.DarkSlateGray

        Dim viewASSB2 As DataView = New DataView(_tblData)
        viewASSB2.RowFilter = "Line='LINEA2' and Active='False' and Turno='2' "
        lblASL2B.Text = "AS:" &  viewASSB2.Count
        lblASL2B.ForeColor = Color.Red

        dgvB2.DataSource = test.ValuesByLineStiro("LINEA2", "2")
        dgvB2.DataBind()


        'L3 B
        Dim viewB3 As DataView = New DataView(_tblData)
        viewB3.RowFilter = "Line='LINEA3' and Turno='2' "
        lblPTL3B.Text = "PT:" & viewB3.Count

        Dim viewPPB3 As DataView = New DataView(_tblData)
        viewPPB3.RowFilter = "Line='LINEA3' and Active='True' and Turno='2' "
        lblPPL3B.Text = "PP:" & viewPPB3.Count
        lblPPL3B.ForeColor = Color.DarkSlateGray

        Dim viewASSB3 As DataView = New DataView(_tblData)
        viewASSB3.RowFilter = "Line='LINEA3' and Active='False' and Turno='2' "
        lblASL3B.Text = "AS:" &  viewASSB3.Count
        lblASL3B.ForeColor = Color.Red

        dgvB3.DataSource = test.ValuesByLineStiro("LINEA3", "2")
        dgvB3.DataBind()
        _tblData.Dispose()

        lbltotConfBPT.Text = (viewB1.Count + viewB2.Count + viewB3.Count).ToString()
        lbltotConfBPP.Text =  (viewPPB1.Count + viewPPB2.Count + viewPPB3.Count).ToString()
        lbltotConfBAS.Text =   (viewASSB1.Count + viewASSB2.Count + viewASSB3.Count).ToString()
    End Sub

    Protected Sub Grid_DataBound(sender As Object, e As DataGridItemEventArgs)
        'HIDE LINE COLUMN (0)
        e.Item.Cells(0).Attributes.Add("style", "text-align:center; color:black; border-left-style: solid;border-left-color: #c3b7b7;border-right-style: solid;border-right-color: #c3b7b7;")

        If e.Item.Cells(0).Text = "Cognome e Nome" 
             e.Item.Cells(0).Attributes.Add("style", "border-left-style: solid;border-right-style: solid; border-left-width:2px; border-left-color:white; border-right-width:2px;border-right-color:white;")
        End If

        If e.Item.Cells(0).Text = "Fase"
            e.Item.Cells(0).Attributes.Add("style", "border-left-style: solid;border-right-style: solid; border-left-width:2px; border-left-color:white; border-right-width:2px;border-right-color:white;")
        End If

        e.Item.Cells(1).Attributes.Add("style", "width:137px!important;")
    
        e.Item.Cells(4).Visible = False
        e.Item.Cells(3).Visible = False
        e.Item.Cells(6).Visible = False

        If e.Item.Cells(0).Text ="Id"
            e.Item.Cells(0).Text = String.Empty
        End If

        If e.Item.Cells(5).Text = "Active"
            e.Item.Cells(5).Text = String.Empty
            e.Item.Cells(5).Attributes.Add("style", "text-align:center;")
        End If

        If e.Item.Cells(2).Text = "Capolinea"
            e.Item.ForeColor = Color.darkred
            e.Item.Attributes.Add("font-weight","600")
        End If

        If e.Item.Cells(2).Text = "Lavoro" Then e.Item.Cells(2).Text = "Fase"
        If e.Item.Cells(1).Text = "Name" Then e.Item.Cells(1).Text = "Cognome e Nome"

        'BIG FIRST LETTER
        e.Item.Cells(2).Attributes.Add("style", "text-transform: uppercase;width:120px;")

      Dim checkfalse As New CheckBox
        checkfalse.Checked = False

      Dim checktrue As New CheckBox
        checktrue.Checked = True

        'ACTIVE-TRUE(FALSE)
        If e.Item.Cells(5).Text = "False"
            e.Item.Cells(5).BackColor = Color.red
            e.Item.Cells(5).Text = ""
        End If

        If e.Item.Cells(5).Text = "True"
            e.Item.Cells(5).Text = ""
        End If



           e.Item.Cells(5).Attributes.Add("style", "border-left-style: solid;border-right-style: solid;width: 25px;")
    End Sub

    Protected Sub Grid_DataBound_Other_A(sender As Object, e As DataGridItemEventArgs)
                e.Item.Cells(3).Visible = False
                e.Item.Cells(5).Visible = False
                e.Item.Cells(6).Visible = False
        
                e.Item.Cells(1).Attributes.Add("style", "width:137px!important;")
                e.Item.Cells(2).Attributes.Add("style", "width:120px!important;")
    End Sub

End Class
