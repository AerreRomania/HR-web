Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports SimplexWeb.Reports


Partial Class Report
    Inherits System.Web.UI.Page

    Dim _strConnection As String = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
    Public MyConnection As New SqlConnection(_strConnection)
    Dim _tblData As New DataTable

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        _tblData.Clear()
        GettingData()
        FillGrdis()

    End Sub

    Sub GettingData()
        _tblData.Clear()
        Const q = "Select  Line,Name,Lavoro,Active, Other from Organizator where IdSector='1' AND Other <> 'Maternita' AND Other <> 'Malatia' ORDER BY LAVORO"
        If MyConnection.State = ConnectionState.Closed Then MyConnection.Open()
        Dim cmd = New SqlCommand(q, MyConnection)
        Dim dr As SqlDataReader = cmd.ExecuteReader()

        _tblData.Load(dr)
        dr.Close()
        cmd.Dispose()
        If MyConnection.State = ConnectionState.Open Then MyConnection.Close()

    End Sub

    ReadOnly test As Reports = New Reports(_tblData)

    Sub FillGrdis()

        ConfA_OtherGrids
        ConfA_MainGrids
        ConfB_MainGrids
    End Sub

    Private Sub ConfA_OtherGrids
        'TECHNICHE A
        Dim viewATechniche As DataView = New DataView(_tblData) With {
            .RowFilter = "Lavoro='Tecchnice'"
        }

        dgvTechnicheA.DataSource = test.ValuesByLavoro("Tecchnice")
        dgvTechnicheA.DataBind()

        'Uffico
        Dim viewAUffico As DataView = New DataView(_tblData) With {
            .RowFilter = "Other='Ufficio' OR Lavoro='tempi e metodi'"
        }

        dgvUffico.DataSource = test.ValuesByOther("Ufficio")
        dgvUffico.DataBind()

        'Controlo Qualita
        Dim viewACQ As DataView = New DataView(_tblData) With {
            .RowFilter = "Other='CQ'"
        }

        dgvCQA.DataSource = test.ValuesByOther("CQ")
        dgvCQA.DataBind()

        'Rammendo
        Dim viewARamA As DataView = New DataView(_tblData) With {
            .RowFilter = "Lavoro='Rammendo' OR Other='Rammendo'"
        }

        dgvRamA.DataSource = test.ValuesByLavoro("Rammendo")
        dgvRamA.DataBind()

        'Meccanico
        Dim viewAMecc As DataView = New DataView(_tblData) With {
            .RowFilter = "Other='Meccanico'"
        }

        dgvMeccanico.DataSource = test.ValuesByOther("meccanico")
        dgvMeccanico.DataBind()

        'Maggazioneri
        Dim viewAMaggazio As DataView = New DataView(_tblData) With {
            .RowFilter = "Lavoro='Magazzioneri'"
        }

        dgvMagazioneri.DataSource = test.ValuesByLavoro("Magazzioneri")
        dgvMagazioneri.DataBind()

        'Pulzie
        Dim viewAPulzie As DataView = New DataView(_tblData) With {
            .RowFilter = "Other='Pulizia'"
        }

        _tblData.Dispose()

        dgvPulizia.DataSource = test.ValuesByOther("Pulizia")
        dgvPulizia.DataBind()
    End Sub

    'Private Sub ConfB_OtherGrids
    '    'TECHNICHE A
    '     Dim viewATechniche As DataView = New DataView(_tblData)
    '        viewATechniche.RowFilter = "Lavoro='Tecchnice'"

    '        dgvConfBTecc.DataSource = viewATechniche
    '        dgvConfBTecc.DataBind()

    '    'Uffico
    '     Dim viewAUffico As DataView = New DataView(_tblData)
    '        viewAUffico.RowFilter = "Other='Ufficio' OR Lavoro='tempi e metodi'"

    '        dgvConfBUfficio.DataSource = viewAUffico
    '        dgvConfBUfficio.DataBind()

    '     'Controlo Qualita
    '     Dim viewACQ As DataView = New DataView(_tblData)
    '        viewACQ.RowFilter = "Other='CQ'"

    '        dgvConfBCQ.DataSource = viewACQ
    '        dgvConfBCQ.DataBind()

    '   'Rammendo
    '     Dim viewARamA As DataView = New DataView(_tblData)
    '        viewARamA.RowFilter = "Lavoro='Rammendo' OR Other='Rammendo'"

    '        dgvConfBRammendo.DataSource = viewARamA
    '        dgvConfBRammendo.DataBind()

    '    'Meccanico
    '     Dim viewAMecc As DataView = New DataView(_tblData)
    '        viewAMecc.RowFilter = "Other='Meccanico'"

    '        dgvConfBMechanico.DataSource = viewAMecc
    '        dgvConfBMechanico.DataBind()

    '     'Maggazioneri
    '     Dim viewAMaggazio As DataView = New DataView(_tblData)
    '        viewAMaggazio.RowFilter = "Lavoro='Magazzioneri'"

    '        dgvConfBMaggazi.DataSource = viewAMaggazio
    '        dgvConfBMaggazi.DataBind()

    '     'Pulzie
    '     Dim viewAPulzie As DataView = New DataView(_tblData)
    '        viewAPulzie.RowFilter = "Other='Pulizia'"

    '        dgvConfBPullzie.DataSource = viewAPulzie
    '        dgvConfBPullzie.DataBind()
    'End Sub

    Private Sub ConfA_MainGrids
        Dim viewA1 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA13'"
        }
        lblPTL1A.Text = "PT:" & viewA1.Count
        lblPTL1A.ForeColor = Color.darkslategray

        Dim viewPPA1 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA13' and Active='True'"
        }
        lblPPL1A.Text = "PP:" & viewPPA1.Count
        lblPPL1A.ForeColor = Color.green

        Dim viewASSA1 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA13' and Active='False'"
        }
        lblASL1A.Text = "AS:" & viewASSA1.Count
        lblASL1A.ForeColor = Color.Red



        dgvA1.DataSource = test.ValuesByLine("LINEA13")
        dgvA1.DataBind()

        'L2 A
        Dim viewA2 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA14'"
        }
        lblPTL2A.Text = "PT:" & viewA2.Count
        lblPTL2A.ForeColor = Color.DarkSlateGray

        
        Dim viewPPA2 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA14' and Active='True'"
        }
        lblPPL2A.Text = "PP:" & viewPPA2.Count
        lblPPL2A.ForeColor = Color.Green

        Dim viewASSA2 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA14' and Active='False'"
        }
        lblASL2A.Text = "AS:" & viewASSA2.Count
        lblASL2A.ForeColor = Color.Red

        dgvA2.DataSource = test.ValuesByLine("LINEA14")
        dgvA2.DataBind()

        'L3 A
        Dim viewA3 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA15'"
        }
        lblPTL3A.Text = "PT:" & viewA3.Count
        lblPTL3A.ForeColor = Color.DarkSlateGray

        Dim viewPPA3 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA15' and Active='True'"
        }
        lblPPL3A.Text = "PP:" & viewPPA3.Count
        lblPPL3A.ForeColor = Color.Green

        Dim viewASSA3 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA15' and Active='False'"
        }
        lblASL3A.Text = "AS:" & viewASSA3.Count
        lblASL3A.ForeColor = Color.Red

        dgvA3.DataSource = test.ValuesByLine("LINEA15")
        dgvA3.DataBind()
        'L4 A
        Dim viewA4 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA16'"
        }
        lblPTL4A.Text = "PT:" & viewA4.Count
        lblPTL4A.ForeColor = Color.DarkSlateGray


        Dim viewPPA4 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA16' and Active='True'"
        }
        lblPPL4A.Text = "PP:" & viewPPA4.Count
        lblPPL4A.ForeColor = Color.Green

        Dim viewASSA4 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA16' and Active='False'"
        }
        lblASL4A.Text = "AS:" & viewASSA4.Count
        lblASL4A.ForeColor = Color.Red

        dgvA4.DataSource = test.ValuesByLine("LINEA16")
        dgvA4.DataBind()

        'L5 A
        Dim viewA5 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA17'"
        }
        lblPTL5A.Text = "PT:" & viewA5.Count
        lblPTL5A.ForeColor = Color.DarkSlateGray


        Dim viewPPA5 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA17' and Active='True'"
        }
        lblPPL5A.Text = "PP:" & viewPPA5.Count
        lblPPL5A.ForeColor = Color.Green

        Dim viewASSA5 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA17' and Active='False'"
        }
        lblASL5A.Text = "AS:" & viewASSA5.Count
        lblASL5A.ForeColor = Color.Red

        dgvA5.DataSource = test.ValuesByLine("LINEA17")
        dgvA5.DataBind()
        'L6 A
        Dim viewA6 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA18'"
        }
        lblPTL6A.Text = "PT:" & viewA6.Count
        lblPTL6A.ForeColor = Color.DarkSlateGray


        Dim viewPPA6 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA18' and Active='True'"
        }
        lblPPL6A.Text = "PP:" & viewPPA6.Count
        lblPPL6A.ForeColor = Color.Green

        Dim viewASSA6 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA18' and Active='False'"
        }
        lblASL6A.Text = "AS:" & viewASSA6.Count
        lblASL6A.ForeColor = Color.Red

        dgvA6.DataSource = test.ValuesByLine("LINEA18")
        dgvA6.DataBind()

        _tblData.Dispose()

        lbltotConfAPT.Text = (viewA1.Count + viewA2.Count + viewA3.Count + viewA4.Count + viewA5.Count ).ToString()
        lbltotConfAPP.Text = (viewPPA1.Count + viewPPA2.Count + viewPPA3.Count + viewPPA4.Count + viewPPA5.Count ).ToString()
        lbltotConfAASS.Text = (viewASSA1.Count + viewASSA2.Count + viewASSA3.Count + viewASSA4.Count + viewASSA5.Count ).ToString()
    End Sub

    Private Sub ConfB_MainGrids

        'L1 B
        Dim viewB1 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA1'"
        }
        lblPTL1B.Text = "PT:" & viewB1.Count
        lblPTL1B.ForeColor = Color.DarkSlateGray


        Dim viewPPB1 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA1' and Active='True'"
        }
        lblPPL1B.Text = "PP:" & viewPPB1.Count
        lblPPL1B.ForeColor = Color.Green

        Dim viewASSB1 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA1' and Active='False'"
        }
        lblASL1B.Text = "AS:" & viewASSB1.Count
        lblASL1B.ForeColor = Color.Red

        dgvB1.DataSource = test.ValuesByLine("LINEA1")
        dgvB1.DataBind()


        'L2 B
        Dim viewB2 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA2'"
        }
        lblPTL2B.Text = "PT:" & viewB2.Count
        lblPTL2B.ForeColor = Color.DarkSlateGray

        Dim viewPPB2 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA2' and Active='True'"
        }
        lblPPL2B.Text = "PP:" & viewPPB2.Count
        lblPPL2B.ForeColor = Color.Green

        Dim viewASSB2 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA2' and Active='False'"
        }
        lblASL2B.Text = "AS:" & viewASSB2.Count
        lblASL2B.ForeColor = Color.Red

        dgvB2.DataSource = test.ValuesByLine("LINEA2")
        dgvB2.DataBind()


        'L3 B
        Dim viewB3 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA3'"
        }
        lblPTL3B.Text = "PT:" & viewB3.Count
        lblPTL3B.ForeColor = Color.DarkSlateGray

        Dim viewPPB3 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA3' and Active='True'"
        }
        lblPPL3B.Text = "PP:" & viewPPB3.Count
        lblPPL3B.ForeColor = Color.Green

        Dim viewASSB3 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA3' and Active='False'"
        }
        lblASL3B.Text = "AS:" & viewASSB3.Count
        lblASL3B.ForeColor = Color.Red

        dgvB3.DataSource = test.ValuesByLine("LINEA3")
        dgvB3.DataBind()


        'L4 B
        Dim viewB4 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA4'"
        }
        lblPTL4B.Text = "PT:" & viewB4.Count
        lblPTL4B.ForeColor = Color.DarkSlateGray

        Dim viewPPB4 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA4' and Active='True'"
        }
        lblPPL4B.Text = "PP:" & viewPPB4.Count
        lblPPL4B.ForeColor = Color.Green

        Dim viewASSB4 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA4' and Active='False'"
        }
        lblASL4B.Text = "AS:" & viewASSB4.Count
        lblASL4B.ForeColor = Color.Red

        dgvB4.DataSource = test.ValuesByLine("LINEA4")
        dgvB4.DataBind()


        'L5 B
        Dim viewB5 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA5'"
        }
        lblPTL5B.Text = "PT:" & viewB5.Count
        lblPTL5B.ForeColor = Color.DarkSlateGray

        Dim viewPPB5 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA5' and Active='True'"
        }
        lblPPL5B.Text = "PP:" & viewPPB5.Count
        lblPPL5B.ForeColor = Color.Green

        Dim viewASSB5 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA5' and Active='False'"
        }
        lblASL5B.Text = "AS:" & viewASSB5.Count
        lblASL5B.ForeColor = Color.Red

        dgvB5.DataSource = test.ValuesByLine("LINEA5")
        dgvB5.DataBind()



        'L6 B
        Dim viewB6 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA6'"
        }
        lblPTL6B.Text = "PT:" & viewB6.Count
        lblPTL6B.ForeColor = Color.DarkSlateGray

        Dim viewPPB6 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA6' and Active='True'"
        }
        lblPPL6B.Text = "PP:" & viewPPB6.Count
        lblPPL6B.ForeColor = Color.Green

        Dim viewASSB6 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA6' and Active='False'"
        }
        lblASL6B.Text = "AS:" & viewASSB6.Count
        lblASL6B.ForeColor = Color.Red

        dgvB6.DataSource = test.ValuesByLine("LINEA6")
        dgvB6.DataBind()


        'L7 B
        Dim viewB7 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA7'"
        }
        lblPTL7B.Text = "PT:" & viewB7.Count
        lblPTL7B.ForeColor = Color.DarkSlateGray

        Dim viewPPB7 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA7' and Active='True'"
        }
        lblPPL7B.Text = "PP:" & viewPPB7.Count
        lblPPL7B.ForeColor = Color.Green

        Dim viewASSB7 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA7' and Active='False'"
        }
        lblASL7B.Text = "AS:" & viewASSB7.Count
        lblASL7B.ForeColor = Color.Red

        dgvB7.DataSource = test.ValuesByLine("LINEA7")
        dgvB7.DataBind()




        'L8 B
        Dim viewB8 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA8'"
        }
        lblPTL8B.Text = "PT:" & viewB8.Count
        lblPTL8B.ForeColor = Color.DarkSlateGray

        Dim viewPPB8 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA8' and Active='True'"
        }
        lblPPL8B.Text = "PP:" & viewPPB8.Count
        lblPPL8B.ForeColor = Color.Green

        Dim viewASSB8 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA8' and Active='False'"
        }
        lblASL8B.Text = "AS:" & viewASSB8.Count
        lblASL8B.ForeColor = Color.Red

        dgvB8.DataSource = test.ValuesByLine("LINEA8")
        dgvB8.DataBind()




        'L9 B
        Dim viewB9 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA9'"
        }
        lblPTL9B.Text = "PT:" & viewB9.Count
        lblPTL9B.ForeColor = Color.DarkSlateGray

        Dim viewPPB9 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA9' and Active='True'"
        }
        lblPPL9B.Text = "PP:" & viewPPB9.Count
        lblPPL9B.ForeColor = Color.Green

        Dim viewASSB9 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA9' and Active='False'"
        }
        lblASL9B.Text = "AS:" & viewASSB9.Count
        lblASL9B.ForeColor = Color.Red

        dgvB9.DataSource = test.ValuesByLine("LINEA9")
        dgvB9.DataBind()




        'L10 B
        Dim viewB10 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA10'"
        }
        lblPTL10B.Text = "PT:" & viewB10.Count
        lblPTL10B.ForeColor = Color.DarkSlateGray

        Dim viewPPB10 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA10' and Active='True'"
        }
        lblPPL10B.Text = "PP:" & viewPPB10.Count
        lblPPL10B.ForeColor = Color.Green

        Dim viewASSB10 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA10' and Active='False'"
        }
        lblASL10B.Text = "AS:" & viewASSB10.Count
        lblASL10B.ForeColor = Color.Red

        dgvB10.DataSource = test.ValuesByLine("LINEA10")
        dgvB10.DataBind()




        'L11 B
        Dim viewB11 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA11'"
        }
        lblPTL11B.Text = "PT:" & viewB11.Count
        lblPTL11B.ForeColor = Color.DarkSlateGray

        Dim viewPPB11 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA11' and Active='True'"
        }
        lblPPL11B.Text = "PP:" & viewPPB11.Count
        lblPPL11B.ForeColor = Color.Green

        Dim viewASSB11 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA11' and Active='False'"
        }
        lblASL11B.Text = "AS:" & viewASSB11.Count
        lblASL11B.ForeColor = Color.Red

        dgvB11.DataSource = test.ValuesByLine("LINEA11")
        dgvB11.DataBind()



        'L12 B
        Dim viewB12 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA12'"
        }
        lblPTL12B.Text = "PT:" & viewB12.Count
        lblPTL12B.ForeColor = Color.DarkSlateGray

        Dim viewPPB12 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA12' and Active='True'"
        }
        lblPPL12B.Text = "PP:" & viewPPB12.Count
        lblPPL12B.ForeColor = Color.Green

        Dim viewASSB12 As DataView = New DataView(_tblData) With {
            .RowFilter = "Line='LINEA12' and Active='False'"
        }
        lblASL12B.Text = "AS:" & viewASSB12.Count
        lblASL12B.ForeColor = Color.Red

        dgvB12.DataSource = test.ValuesByLine("LINEA12")
        dgvB12.DataBind()

        _tblData.Dispose()

        lbltotConfBPT.Text = (viewB1.Count + viewB2.Count + viewB3.Count + viewB4.Count + viewB5.Count + viewB6.Count + viewB7.Count + viewB8.Count + viewB9.Count + viewB10.Count + viewB11.Count + viewB12.Count).ToString()
        lbltotConfBPP.Text = (viewPPB1.Count + viewPPB2.Count + viewPPB3.Count + viewPPB4.Count + viewPPB5.Count + viewPPB6.Count + viewPPB7.Count + viewPPB8.Count + viewPPB9.Count + viewPPB10.Count + viewPPB11.Count + viewPPB12.Count).ToString()

        lbltotConfBAS.Text = (viewASSB1.Count + viewASSB2.Count + viewASSB3.Count + viewASSB4.Count + viewASSB5.Count + viewASSB6.Count + viewASSB7.Count + viewASSB8.Count + viewASSB9.Count + viewASSB10.Count + viewASSB11.Count + viewASSB12.Count).ToString()
    End Sub


    Protected Sub Grid_DataBound(sender As Object, e As DataGridItemEventArgs)
        'HIDE LINE COLUMN (0)
        'e.Item.Cells(0).Visible = False 
        e.Item.Cells(0).Attributes.Add("style", "text-align:center; color:black; border-left-style: solid;border-left-color: #c3b7b7;border-right-style: solid;border-right-color: #c3b7b7;")

        If e.Item.Cells(0).Text = "Cognome e Nome" 
             e.Item.Cells(0).Attributes.Add("style", "border-left-style: solid;border-right-style: solid; border-left-width:2px; border-left-color:white; border-right-width:2px;border-right-color:white;")
        End If

        If e.Item.Cells(0).Text = "Fase"
            e.Item.Cells(0).Attributes.Add("style", "border-left-style: solid;border-right-style: solid; border-left-width:2px; border-left-color:white; border-right-width:2px;border-right-color:white;")
        End If


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


        'BIG FIRST LETTER
        e.Item.Cells(2).Attributes.Add("style", "text-transform: capitalize;")

        'If e.Item.Cells(2).Text = "Lavoro" Then e.Item.Cells(2).Text = "Fase"
        'If e.Item.Cells(1).Text = "Name" Then e.Item.Cells(1).Text = "Cognome e Nome"

        e.Item.Cells(1).Attributes.Add("style","width:132px!important;")
        e.Item.Cells(0).Attributes.Add("style","width:23px!important;")


      Dim checkfalse As New CheckBox
        checkfalse.Checked = False

      Dim checktrue As New CheckBox
        checktrue.Checked = True

        'ACTIVE-TRUE(FALSE)
        If e.Item.Cells(5).Text = "False"
            e.Item.Cells(5).BackColor = Color.red
            e.Item.Cells(5).Text = ""
            'e.Item.Cells(5).Attributes.Add("style", "border-bottom-color:red;")

            'e.Item.Cells(5).Controls.Add(checkfalse)
        End If

        If e.Item.Cells(5).Text = "True"
            e.Item.Cells(5).Text = ""
            'e.Item.Cells(5).Attributes.Add("style", "border-bottom-color:green;")
            'e.Item.Cells(5).Controls.Add(checktrue)
        End If
        e.Item.Cells(5).Attributes.Add("style", "border-left-style: solid;border-right-style: solid;width: 25px;")
    End Sub



    Protected Sub Grid_DataBound_Other_A(sender As Object, e As DataGridItemEventArgs)
        e.Item.Cells(0).Visible = False
        e.Item.Cells(3).Visible = False
        e.Item.Cells(4).Visible = False
        e.Item.Cells(5).Visible = False
        e.Item.Cells(6).Visible = False
        
    End Sub
End Class


