
Imports System.Data
Imports System.Data.SqlClient
Imports Telerik.Web.UI

Namespace Views.HR

    Partial Class form_timbrature_new
        Inherits System.Web.UI.Page


        Dim tbl_cod_angajat As New DataTable
        Dim tbl_cod_system As New DataTable
        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
            Dim query_last_cod_angajat As String = "SELECT TOP 1 CodAngajat FROM AngajatiMY ORDER BY CodAngajat DESC"
            Dim query_last_cod_system As String = "SELECT TOP 1 CodSistem FROM AngajatiMY ORDER BY CodSistem DESC"

            Using cnn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                cnn.Open()
                Using dad As New SqlDataAdapter(query_last_cod_angajat, cnn)
                    dad.Fill(tbl_cod_angajat)
                End Using

                Using dads As New SqlDataAdapter(query_last_cod_system, cnn)
                    dads.Fill(tbl_cod_system)
                End Using
                cnn.Close()
            End Using
            strMerchantId = Request.QueryString("uid") 
        End Sub

        Protected Sub RadGrid1_ItemCreated(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemCreated
            If TypeOf e.Item Is GridEditableItem AndAlso e.Item.IsInEditMode Then
                If Not (TypeOf e.Item Is GridEditFormInsertItem) Then
                    Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                    Dim manager As GridEditManager = item.EditManager
                    Dim editor As GridTextBoxColumnEditor = TryCast(manager.GetColumnEditor("Id"), GridTextBoxColumnEditor)
                    editor.TextBoxControl.Enabled = False
                End If
            End If
        End Sub

        Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
            If TypeOf e.Item Is GridEditableItem AndAlso e.Item.ItemIndex = 0 AndAlso e.Item.IsInEditMode Then
                Dim item As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                'Dim text As TextBox = DirectCast(item("Id").Controls(0), TextBox) 
                item.Focus()
            End If

        End Sub

        Protected Sub gvCktMap_PreRender(ByVal sender As Object, ByVal e As EventArgs)
            RadGrid1.MasterTableView.GetColumn("Id").Display = False
            RadGrid1.MasterTableView.GetColumn("DataNasterii").Display = False
            RadGrid1.MasterTableView.GetColumn("DataAngajarii").Display = False
            RadGrid1.MasterTableView.GetColumn("DataNedeterminat").Display = False
            RadGrid1.MasterTableView.GetColumn("Sex").Display = False
            RadGrid1.MasterTableView.GetColumn("NumarTelefon").Display = False
            RadGrid1.MasterTableView.GetColumn("CC").Display = False
            RadGrid1.MasterTableView.GetColumn("PostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("TipPostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("IdLocalitate").Display = False
            RadGrid1.MasterTableView.GetColumn("Somaj").Display = False
            RadGrid1.MasterTableView.GetColumn("IdTipPostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("DataExpirareContract").Display = False
            RadGrid1.MasterTableView.GetColumn("DataExpirareProba").Display = False
            RadGrid1.MasterTableView.GetColumn("IdIntervalDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("IdPostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("IdLoculNasterii").Display = False
            RadGrid1.MasterTableView.GetColumn("IdIncadrare").Display = False
            RadGrid1.MasterTableView.GetColumn("IdNivelStudiu").Display = False
            RadGrid1.MasterTableView.GetColumn("IdBanca").Display = False
            RadGrid1.MasterTableView.GetColumn("StareCivila").Display = False
            RadGrid1.MasterTableView.GetColumn("IdDepartament").Display = False
            RadGrid1.MasterTableView.GetColumn("IdEchipa").Display = False
            RadGrid1.MasterTableView.GetColumn("AdresaEmail").Display = False
            RadGrid1.MasterTableView.GetColumn("IdLinie").Display = False
            RadGrid1.MasterTableView.GetColumn("Banca").Display = False
            RadGrid1.MasterTableView.GetColumn("Echipa").Display = False
            RadGrid1.MasterTableView.GetColumn("Localitate").Display = False
            RadGrid1.MasterTableView.GetColumn("NivelStudiu").Display = False
            RadGrid1.MasterTableView.GetColumn("LoculNasterii").Display = False
            RadGrid1.MasterTableView.GetColumn("CodAngajat").Display = False
            RadGrid1.MasterTableView.GetColumn("CodSistem").Display = False
            RadGrid1.MasterTableView.GetColumn("DataLichidarii").Display = False
            RadGrid1.MasterTableView.GetColumn("DataMaternitate").Display = False
            RadGrid1.MasterTableView.GetColumn("Strada").Display = False
            RadGrid1.MasterTableView.GetColumn("IntervalDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("DeteIndete").Display = False
            RadGrid1.MasterTableView.GetColumn("ImageUrl").Display = False
            RadGrid1.MasterTableView.GetColumn("CvUrl").Display = False

            RadGrid1.Rebind()
        End Sub

        Protected Sub gvCktMap_PreRenderQ(ByVal sender As Object, ByVal e As EventArgs)
            'RadGrid2.MasterTableView.GetColumn("Id").Display = False
            RadGrid2.MasterTableView.GetColumn("DataNasterii").Display = False
            RadGrid2.MasterTableView.GetColumn("DataAngajarii").Display = False
            RadGrid2.MasterTableView.GetColumn("DataNedeterminat").Display = False
            RadGrid2.MasterTableView.GetColumn("Sex").Display = False
            RadGrid2.MasterTableView.GetColumn("NumarTelefon").Display = False
            RadGrid2.MasterTableView.GetColumn("CC").Display = False
            RadGrid2.MasterTableView.GetColumn("PostDeLucru").Display = False
            RadGrid2.MasterTableView.GetColumn("TipPostDeLucru").Display = False
            RadGrid2.MasterTableView.GetColumn("IdLocalitate").Display = False
            RadGrid2.MasterTableView.GetColumn("Somaj").Display = False
            RadGrid2.MasterTableView.GetColumn("IdTipPostDeLucru").Display = False
            RadGrid2.MasterTableView.GetColumn("DataExpirareContract").Display = False
            RadGrid2.MasterTableView.GetColumn("DataExpirareProba").Display = False
            RadGrid2.MasterTableView.GetColumn("IdIntervalDeLucru").Display = False
            RadGrid2.MasterTableView.GetColumn("IdPostDeLucru").Display = False
            RadGrid2.MasterTableView.GetColumn("IdLoculNasterii").Display = False
            RadGrid2.MasterTableView.GetColumn("IdIncadrare").Display = False
            RadGrid2.MasterTableView.GetColumn("IdNivelStudiu").Display = False
            RadGrid2.MasterTableView.GetColumn("IdBanca").Display = False
            RadGrid2.MasterTableView.GetColumn("StareCivila").Display = False
            RadGrid2.MasterTableView.GetColumn("IdDepartament").Display = False
            RadGrid2.MasterTableView.GetColumn("IdEchipa").Display = False
            RadGrid2.MasterTableView.GetColumn("AdresaEmail").Display = False
            RadGrid2.MasterTableView.GetColumn("IdLinie").Display = False
            RadGrid2.MasterTableView.GetColumn("Banca").Display = False
            RadGrid2.MasterTableView.GetColumn("Echipa").Display = False
            RadGrid2.MasterTableView.GetColumn("Localitate").Display = False
            RadGrid2.MasterTableView.GetColumn("NivelStudiu").Display = False
            RadGrid2.MasterTableView.GetColumn("LoculNasterii").Display = False
            RadGrid2.MasterTableView.GetColumn("CodAngajat").Display = False
            RadGrid2.MasterTableView.GetColumn("CodSistem").Display = False
            RadGrid2.MasterTableView.GetColumn("DataLichidarii").Display = False
            RadGrid2.MasterTableView.GetColumn("DataMaternitate").Display = False
            RadGrid2.MasterTableView.GetColumn("Strada").Display = False
            RadGrid2.MasterTableView.GetColumn("IntervalDeLucru").Display = False
            RadGrid2.MasterTableView.GetColumn("DeteIndete").Display = False
            RadGrid1.MasterTableView.GetColumn("ImageUrl").Display = False
            RadGrid1.MasterTableView.GetColumn("CvUrl").Display = False

            RadGrid2.Rebind()
        End Sub

        Protected Sub RadGrid1_ItemInserted(source As Object, e As GridInsertedEventArgs) Handles RadGrid1.ItemInserted

            If e.Exception IsNot Nothing Then

                e.ExceptionHandled = True

                SetMessage("Customer cannot be inserted. Reason: " + e.Exception.Message)
            Else
                SetMessage("New customer is inserted!")
            End If
        End Sub
        Private Sub DisplayMessage(text As String)
            RadGrid1.Controls.Add(New LiteralControl(String.Format("<span style='color:red'>{0}</span>", text)))
        End Sub

        Private Sub SetMessage(message As String)
            gridMessage = message
        End Sub

        Private gridMessage As String = Nothing
        Protected Sub RadGrid1_PreRender(sender As Object, e As EventArgs) Handles RadGrid1.PreRender
            If Not String.IsNullOrEmpty(gridMessage) Then
                DisplayMessage(gridMessage)
            End If


        End Sub

        Protected Sub RadGrid1_InsertCommand(sender As Object, e As GridCommandEventArgs)
            If TypeOf e.Item Is GridEditableItem Then
                Dim editedItem As GridEditableItem = TryCast(e.Item, GridEditableItem) 
                Dim newValues As New Hashtable() 
                e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem)
            End If
        End Sub

        'POPRAVITI
        Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click

            Dim query As String = "UPDATE AngajatiMY SET Marca=@Marca,Nume=@Nume,Prenume=@Prenume,Strada=@Strada,IdLocalitate=@IdLocalitate,DataAngajarii=@DataAngajarii, DataExpirareContract=@DataExpirareContract ,DataNedeterminat=@DataNedeterminat,IdTipPostDeLucru=@IdTipPostDeLucru,IdIntervalDeLucru=@IdIntervalDeLucru,IdPostDeLucru=@IdPostDeLucru,Sex=@Sex,IdLoculNasterii=@IdLoculNasterii,NumarIdentificarePersonala=@NumarIdentificarePersonala,IdIncadrare=@IdIncadrare,IdNivelStudiu=@IdNivelStudiu,IdBanca=@IdBanca,NumarTelefon=@NumarTelefon,CC=@CC,IdDepartament=@IdDepartament,IdEchipa=@IdEchipa,AdresaEmail=@AdresaEmail,IdLinie=@IdLinie,IdUtilizatorModificare=@IdUtilizatorModificare,DataModificare=GETDATE(),TGroup=@TGroup WHERE CodAngajat=@CodAngajat AND Dmonth=@Dmonth AND Dyear=@Dyear"
            Dim mycommand As New SqlCommand


            Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                Using comm As New SqlCommand()
                    With comm
                        .Connection = conn
                        .CommandType = CommandType.Text
                        .CommandText = query

                        Dim mmonth As Int32 = DateTime.Today.AddMonths(-1).Month
                        Dim myear As Int32 = DateTime.Today.Year

                        .Parameters.Add("@Dmonth", SqlDbType.Int).Value = mmonth
                        .Parameters.Add("@Dyear", SqlDbType.Int).Value = myear
                        .Parameters.Add("@CodAngajat", SqlDbType.Int).Value = txtEmployeeCode.Text
                        .Parameters.Add("@Marca", SqlDbType.VarChar).Value = txtMarca.Text
                        .Parameters.Add("@Nume", SqlDbType.VarChar).Value = txtName.Text
                        .Parameters.Add("@Prenume", SqlDbType.VarChar).Value = txtPrenume.Text
                        .Parameters.Add("@Strada", SqlDbType.VarChar).Value = txtStreatAddres.Text
                        .Parameters.Add("@AdresaEmail", SqlDbType.VarChar).Value = txtEmail.Text
                        .Parameters.Add("@TGroup", SqlDbType.VarChar).Value = txtTgroup.Text

                        Dim dtAngajarii As DateTime
                        If txtDateZapos.SelectedDate Is Nothing Then
                            dtAngajarii = Convert.ToDateTime(txtDateZapos.InvalidTextBoxValue)
                        Else
                            dtAngajarii = Convert.ToDateTime(txtDateZapos.SelectedDate)
                        End If

                        Dim dtExpirare As DateTime
                        If txtDateZapos.SelectedDate Is Nothing Then
                            dtExpirare = Convert.ToDateTime("1/1/0001")
                        Else
                            dtExpirare = Convert.ToDateTime(txtDateExpirare.SelectedDate)
                        End If

                        Dim strAngajarii As String = dtAngajarii.ToShortDateString()
                        Dim strExpirare As String = dtExpirare.ToShortDateString()

                        Dim dtNedeterminat As DateTime
                        If txtDateIstek.SelectedDate Is Nothing Then
                            dtNedeterminat = Convert.ToDateTime("1/1/0001")
                        Else
                            dtNedeterminat = Convert.ToDateTime(txtDateIstek.SelectedDate)
                        End If
                        Dim strNedetrminat As String = dtNedeterminat.ToShortDateString()

                        .Parameters.Add("@DataAngajarii", SqlDbType.Date).Value = CDate(strAngajarii)
                        .Parameters.Add("@DataExpirareContract", SqlDbType.Date).Value = CDate(strExpirare)
                        .Parameters.Add("@DataNedeterminat", SqlDbType.Date).Value = CDate(strNedetrminat)
                        .Parameters.Add("@NumarIdentificarePersonala", SqlDbType.VarChar).Value = txtJmbg.Text
                        .Parameters.Add("@NumarTelefon", SqlDbType.VarChar).Value = txtTelephone.Text
                        .Parameters.Add("@CC", SqlDbType.VarChar).Value = txtBank.Text
                        .Parameters.Add("@Sex", SqlDbType.VarChar).Value = txtPol.Text
                        .Parameters.Add("@IdLoculNasterii", SqlDbType.Int).Value = ComboLocalitate.SelectedValue
                        .Parameters.Add("@IdTipPostDeLucru", SqlDbType.Int).Value = ComboTipPost.SelectedValue
                        .Parameters.Add("@IdLocalitate", SqlDbType.Int).Value = ComboLocalitate.SelectedValue
                        .Parameters.Add("@IdIntervalDeLucru", SqlDbType.Int).Value = ComboWorkHours.SelectedValue
                        .Parameters.Add("@IdPostDeLucru", SqlDbType.Int).Value = ComboJobType.SelectedValue
                        .Parameters.Add("@IdIncadrare", SqlDbType.Int).Value = ComboIncadrare.SelectedValue
                        .Parameters.Add("@IdNivelStudiu", SqlDbType.Int).Value = ComboNivel.SelectedValue
                        .Parameters.Add("@IdBanca", SqlDbType.Int).Value = 1
                        .Parameters.Add("@IdDepartament", SqlDbType.Int).Value = ComboDepartament.SelectedValue
                        .Parameters.Add("@IdEchipa", SqlDbType.Int).Value = 1
                        .Parameters.Add("@IdLinie", SqlDbType.Int).Value = ComboLine.SelectedValue
                        .Parameters.Add("@IdUtilizatorModificare", SqlDbType.Int).Value = 1
                    End With
                    Try
                        conn.Open()
                        comm.ExecuteNonQuery()
                        RadGrid1.Rebind()



                    Catch ex As Exception
                        Dim queryEx As String = "INSERT INTO dbo.Exception (Application,Exception,Time) VALUES (@application, @exception,@time)"
                        Dim cmd As SqlCommand = New SqlCommand(queryEx, conn)
                        cmd.Parameters.Add("@application", SqlDbType.NVarChar).Value = "Anagrafiche Update for '" + txtEmployeeCode.Text + "'"
                        cmd.Parameters.Add("@exception", SqlDbType.NVarChar).Value = ex.ToString()
                        cmd.Parameters.Add("@time", SqlDbType.DateTime).Value = DateTime.Now
                        cmd.ExecuteNonQuery()
                    End Try
                End Using
            End Using


            'UPDATE BADGE
            'if exist update in badge  table, if is empty insert

            'select IdBadge from Badges where IdRnum=
            Dim strSql As String = "SELECT IdBadge from Badge where IdRnum='" + txtMarca.Text + "'"
            Dim dtb As New DataTable
            Using cnn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                cnn.Open()
                Using dad As New SqlDataAdapter(strSql, cnn)
                    dad.Fill(dtb)
                End Using
                cnn.Close()
            End Using


            If dtb.Rows.Count > 0 Then
                'update
                Dim queryy As String = String.Empty
                queryy = "UPDATE Badge SET IdBadge=@Badge WHERE IdRnum='" + txtMarca.Text + "'"

                Using connn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                    Using commm As New SqlCommand()
                        With commm
                            .Connection = connn
                            .CommandType = CommandType.Text
                            .CommandText = queryy
                            .Parameters.Add("@Badge", SqlDbType.Int).Value = txtBadge.Text
                        End With
                        connn.Open()
                        commm.ExecuteNonQuery()
                    End Using
                End Using
            Else
                'insert
                Dim queryq As String = "INSERT INTO Badge (IdBadge, IdRnum) VALUES (@Badge,@Rnum)"

                Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                    Using comm As New SqlCommand()
                        With comm
                            .Connection = conn
                            .CommandType = CommandType.Text
                            .CommandText = queryq
                            .Parameters.AddWithValue("@Badge", txtBadge.Text)
                            .Parameters.AddWithValue("@Rnum", txtMarca.Text)
                        End With
                        conn.Open()
                        comm.ExecuteNonQuery()
                    End Using
                End Using
            End If


            txtEmployeeCode.Text = String.Empty
            txtName.Text = String.Empty
            txtPrenume.Text = String.Empty
            txtMarca.Text = String.Empty
            txtTelephone.Text = String.Empty
            txtPol.Text = String.Empty
            txtJmbg.Text = String.Empty
            txtStreatAddres.Text = String.Empty
            txtEmail.Text = String.Empty
            txtTelephone.Text = String.Empty
            txtStreatAddres.Text = String.Empty
            txtTgroup.Text = String.Empty

        End Sub

        Protected Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click

            Dim query As String = String.Empty
            Dim mycommand As New SqlCommand

            Dim cod_ang As Int32 = 0
            Dim cod_sys As Int32 = 0


            For Each row As DataRow In tbl_cod_angajat.Rows
                cod_ang = row.Item(0) + 1
            Next
            For Each row As DataRow In tbl_cod_system.Rows
                cod_sys = row.Item(0) + 1
            Next


            query = "INSERT INTO AngajatiMY (CodAngajat,CodSistem,Marca,Nume,Prenume,Strada,IdLocalitate,DataAngajarii,DataNedeterminat,IdTipPostDeLucru,IdIntervalDeLucru,IdPostDeLucru,Sex,IdLoculNasterii,NumarIdentificarePersonala,IdIncadrare,IdNivelStudiu,IdBanca,NumarTelefon,CC,IdDepartament,IdEchipa,AdresaEmail,IdLinie,DataAdaugare,DataNasterii,Somaj,StareCivila,IdUtilizatorAdaugare,DataLichidarii,DataExpirareContract) VALUES (@CodAngajat,@CodSistem,@Marca,@Nume,@Prenume,@Strada,@IdLocalitate,@DataAngajarii,@DataNedeterminat,@IdTipPostDeLucru,@IdIntervalDeLucru,@IdPostDeLucru,@Sex,@IdLoculNasterii,@NumarIdentificarePersonala,@IdIncadrare,@IdNivelStudiu,@IdBanca,@NumarTelefon,@CC,@IdDepartament,@IdEchipa,@AdresaEmail,@IdLinie,GETDATE(),@DataNasterii,' ',' ','1',@DataLichidarii,@DataExpirareContract)"


            Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                Using comm As New SqlCommand()
                    With comm
                        .Connection = conn
                        .CommandType = CommandType.Text
                        .CommandText = query
                        .Parameters.Add("@CodAngajat", SqlDbType.Int).Value = cod_ang
                        .Parameters.Add("@CodSistem", SqlDbType.Int).Value = cod_sys
                        .Parameters.Add("@Marca", SqlDbType.VarChar).Value = ins_r_num.Text
                        .Parameters.Add("@Nume", SqlDbType.VarChar).Value = ins_nome.Text
                        .Parameters.Add("@Prenume", SqlDbType.VarChar).Value = ins_cognome.Text
                        .Parameters.Add("@Strada", SqlDbType.VarChar).Value = ins_adress.Text
                        .Parameters.Add("@AdresaEmail", SqlDbType.VarChar).Value = ins_email.Text

                        Dim dtAngajarii As DateTime
                        If ins_dt_assunzione.SelectedDate Is Nothing Then
                            'dtAngajarii = Convert.ToDateTime(ins_dt_assunzione.InvalidTextBoxValue) 
                            dtAngajarii = "0001/01/01"
                        Else
                            dtAngajarii = Convert.ToDateTime(ins_dt_assunzione.SelectedDate)
                        End If
                        Dim strAngajarii As String = dtAngajarii.ToShortDateString()

                        Dim dtNedeterminat As DateTime
                        If ins_dt_termine_contratto.SelectedDate Is Nothing Then
                            'dtNedeterminat = Convert.ToDateTime(ins_dt_termine_contratto.InvalidTextBoxValue)
                            dtNedeterminat = "0001/01/01"
                        Else
                            dtNedeterminat = Convert.ToDateTime(ins_dt_termine_contratto.SelectedDate)
                        End If
                        Dim strNedetrminat As String = dtNedeterminat.ToShortDateString()

                        Dim dtRodjenje As DateTime
                        If ins_data_rodj.SelectedDate Is Nothing Then
                            'dtRodjenje = Convert.ToDateTime(ins_data_rodj.InvalidTextBoxValue) 
                            dtRodjenje = "0001/01/01"
                        Else
                            dtRodjenje = Convert.ToDateTime(ins_data_rodj.SelectedDate)
                        End If
                        Dim strRodjenje As String = dtRodjenje.ToShortDateString()

                        Dim dtstrOdredjeno As DateTime
                        If ins_data_rodj.SelectedDate Is Nothing Then
                            'dtstrOdredjeno = Convert.ToDateTime(ins_data_na_odredjeno.InvalidTextBoxValue) 
                            dtstrOdredjeno = "0001/01/01"
                        Else
                            dtstrOdredjeno = Convert.ToDateTime(ins_data_na_odredjeno.SelectedDate)
                        End If
                        Dim strOdredjeno As String = dtstrOdredjeno.ToShortDateString()


                        .Parameters.Add("@DataAngajarii", SqlDbType.Date).Value = CDate(strAngajarii)
                        .Parameters.Add("@DataNasterii", SqlDbType.Date).Value = CDate(strRodjenje)
                        .Parameters.Add("@DataExpirareContract", SqlDbType.Date).Value = CDate(strOdredjeno)
                        .Parameters.Add("@DataLichidarii", SqlDbType.Date).Value = CDate(strNedetrminat)
                        .Parameters.Add("@DataNedeterminat", SqlDbType.Date).Value = CDate(strNedetrminat)

                        .Parameters.Add("@NumarIdentificarePersonala", SqlDbType.VarChar).Value = ins_n_identifi.Text
                        .Parameters.Add("@NumarTelefon", SqlDbType.VarChar).Value = ins_tel.Text
                        .Parameters.Add("@CC", SqlDbType.VarChar).Value = ins_bank.Text
                        .Parameters.Add("@Sex", SqlDbType.VarChar).Value = ins_sesso.SelectedValue
                        .Parameters.Add("@IdLoculNasterii", SqlDbType.Int).Value = ins_luogo.SelectedValue
                        .Parameters.Add("@IdTipPostDeLucru", SqlDbType.Int).Value = ins_diretti.SelectedValue
                        .Parameters.Add("@IdLocalitate", SqlDbType.Int).Value = ins_luogo.SelectedValue
                        .Parameters.Add("@IdIntervalDeLucru", SqlDbType.Int).Value = ins_orario.SelectedValue
                        .Parameters.Add("@IdPostDeLucru", SqlDbType.Int).Value = ins_faze.SelectedValue
                        .Parameters.Add("@IdIncadrare", SqlDbType.Int).Value = ins_mansione.SelectedValue
                        .Parameters.Add("@IdNivelStudiu", SqlDbType.Int).Value = ins_titolo.SelectedValue
                        .Parameters.Add("@IdBanca", SqlDbType.Int).Value = 1
                        .Parameters.Add("@IdDepartament", SqlDbType.Int).Value = ins_reparto.SelectedValue
                        .Parameters.Add("@IdEchipa", SqlDbType.Int).Value = 1
                        .Parameters.Add("@IdLinie", SqlDbType.Int).Value = ins_linie.SelectedValue
                        .Parameters.Add("@IdUtilizatorModificare", SqlDbType.Int).Value = 1
                    End With
                    Try
                        conn.Open()
                        comm.ExecuteNonQuery()
                        RadGrid1.Rebind()

                        'ins_cod_dip.Text = String.Empty
                        ins_r_num.Text = String.Empty
                        ins_nome.Text = String.Empty
                        ins_cognome.Text = String.Empty
                        ins_adress.Text = String.Empty
                        ins_email.Text = String.Empty
                        ins_n_identifi.Text = String.Empty
                        ins_tel.Text = String.Empty
                        ins_bank.Text = String.Empty
                        ins_sesso.Text = String.Empty

                    Catch ex As Exception
                        Dim queryEx As String = "INSERT INTO dbo.Exception (Application,Exception,Time) VALUES (@application, @exception,@time)"
                        Dim cmd As SqlCommand = New SqlCommand(queryEx, conn)
                        cmd.Parameters.Add("@application", SqlDbType.NVarChar).Value = "Anagrafiche Update"
                        cmd.Parameters.Add("@exception", SqlDbType.NVarChar).Value = ex.ToString()
                        cmd.Parameters.Add("@time", SqlDbType.DateTime).Value = DateTime.Now
                        cmd.ExecuteNonQuery()
                    End Try
                End Using
            End Using

        End Sub
        Protected strMerchantId As String

        Public Sub btn_save_Click(sender As Object, e As EventArgs)
            
            strMerchantId = Request.Headers("Referer")
            strMerchantId = strMerchantId.Substring(strMerchantId.Length - 5)


            If upl_img.HasFile Then
                Dim fileExtension As String = upl_img.FileName.Substring(upl_img.FileName.LastIndexOf(".") + 1)
                Dim filePath As String = "~/Images/Upload/Images/" + strMerchantId + "." + fileExtension + ""
                upl_img.SaveAs(MapPath(filePath))

                'If not exist insert, if exist update

                Using connection As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                    connection.Open()
                    Dim sqlStatement As String = "IF EXISTS (select Rcode FROM Attachments WHERE Rcode=@Rcode) " _
                                                 & "BEGIN " _
                                                 & "UPDATE Attachments SET ImageUrl=@ImageUrl WHERE Rcode=@Rcode " _
                                                 & "END " _
                                                 & "ELSE " _
                                                 & "INSERT INTO Attachments (ImageUrl, Rcode) VALUES (@ImageUrl, @Rcode)"
                    Using Command As New SqlCommand(sqlStatement, connection)
                        Dim imgurl As String = "../../Images/Upload/Images/" + strMerchantId + "." + fileExtension + ""
                        Command.Parameters.AddWithValue("@ImageUrl", imgurl)
                        Command.Parameters.AddWithValue("@Rcode", strMerchantId)
                        Command.ExecuteNonQuery()
                    End Using
                End Using



                'Dim query As String = "UPDATE AngajatiMY SET ImageUrl='../../Images/Upload/Images/" + strMerchantId + "." + fileExtension + "' WHERE Marca='" + strMerchantId + "'"
                'Using connection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                '    Dim command As SqlCommand = New SqlCommand(query, connection)
                '    command.Connection.Open()
                '    command.ExecuteNonQuery()
                'End Using

            End If

            If upl_cv.HasFile Then
                Dim fileExtension As String = upl_cv.FileName.Substring(upl_cv.FileName.LastIndexOf(".") + 1)
                Dim filePath As String = "~/Images/Upload/CV/" + strMerchantId + "." + fileExtension + ""
                upl_cv.SaveAs(MapPath(filePath))


                Using connection As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                    connection.Open()
                    Dim sqlStatement As String = "IF EXISTS (select Rcode FROM Attachments WHERE Rcode=@Rcode) " _
                                                 & "BEGIN " _
                                                 & "UPDATE Attachments SET CvUrl=@CvUrl WHERE Rcode=@Rcode " _
                                                 & "END " _
                                                 & "ELSE " _
                                                 & "INSERT INTO Attachments (CvUrl, Rcode) VALUES (@CvUrl, @Rcode)"
                    Using Command As New SqlCommand(sqlStatement, connection)
                        Dim cvurl As String = "../../Images/Upload/CV/" + strMerchantId + "." + fileExtension + ""
                        Command.Parameters.AddWithValue("@CvUrl", cvurl)
                        Command.Parameters.AddWithValue("@Rcode", strMerchantId)
                        Command.ExecuteNonQuery()
                    End Using
                End Using



                'Dim query As String = "UPDATE AngajatiMY SET CvUrl='../../Images/Upload/CV/" + strMerchantId + "." + fileExtension + "' WHERE Marca='" + strMerchantId + "'"
                'Using connection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                '    Dim command As SqlCommand = New SqlCommand(query, connection)
                '    command.Connection.Open()
                '    command.ExecuteNonQuery()
                'End Using
            End If
        End Sub

    End Class
End Namespace