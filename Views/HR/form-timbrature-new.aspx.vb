Imports System.Data
Imports System.Data.SqlClient

Namespace Views.HR

    Partial Class form_timbrature_new
        Inherits System.Web.UI.Page

        Protected Sub gvCktMap_PreRender(ByVal sender As Object, ByVal e As EventArgs)
            RadGrid1.MasterTableView.GetColumn("Id").Display = False
            RadGrid1.MasterTableView.GetColumn("IdAngajat").Display = False
            RadGrid1.MasterTableView.GetColumn("IdTipPostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("IdPostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("IdDepartament").Display = False
            RadGrid1.MasterTableView.GetColumn("IdEchipa").Display = False
            RadGrid1.MasterTableView.GetColumn("IdLinie").Display = False
            RadGrid1.MasterTableView.GetColumn("IdTipOra").Display = False
            RadGrid1.MasterTableView.GetColumn("CodSistem").Display = False
            RadGrid1.MasterTableView.GetColumn("CodDepartament").Display = False
            RadGrid1.MasterTableView.GetColumn("CodPostDeLucru").Display = False
            RadGrid1.MasterTableView.GetColumn("CodLinie").Display = False
            RadGrid1.MasterTableView.GetColumn("CodEchipa").Display = False
            RadGrid1.MasterTableView.GetColumn("Echipa").Display = False
            RadGrid1.MasterTableView.GetColumn("CodTipOra").Display = False
            RadGrid1.MasterTableView.GetColumn("CodAngajat").Display = False
            RadGrid1.MasterTableView.GetColumn("Departament").Display = False
            RadGrid1.MasterTableView.GetColumn("Linie").Display = False
        End Sub

        Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click

            Dim query As String = String.Empty
            Dim mycommand As New SqlCommand
            query = "UPDATE Prezente SET Data=@Data,R1DAL=@R1DAL,R1ALL=@R1ALL,R1TOT=@R1TOT,IdTipOra=@IdTipOra,IdUtilizatorModificare=@IdUtilizatorModificare,DataModificare=GETDATE() WHERE Id=@Id"

            Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("WbmOlimpiasConnectionString").ConnectionString)
                Using comm As New SqlCommand()
                    With comm
                        .Connection = conn
                        .CommandType = CommandType.Text
                        .CommandText = query

                        Dim dtdata As DateTime
                        If dpData.SelectedDate Is Nothing Then
                            dtdata = Convert.ToDateTime(dpData.InvalidTextBoxValue)
                        Else
                            dtdata = Convert.ToDateTime(dpData.SelectedDate)
                        End If
                        Dim strdpData As String = dtdata.ToShortDateString()
                        .Parameters.Add("@Id", SqlDbType.Int).Value = CInt(lblid.Text)
                        .Parameters.Add("@Data", SqlDbType.Date).Value = CDate(strdpData)
                        .Parameters.Add("@R1DAL", SqlDbType.Decimal).Value = nmr1dal.DisplayText
                        .Parameters.Add("@R1ALL", SqlDbType.Decimal).Value = nmr1all.DisplayText
                        .Parameters.Add("@R1TOT", SqlDbType.Decimal).Value = nmr1tot.DisplayText
                        .Parameters.Add("@IdTipOra", SqlDbType.Int).Value = ComboTipOre.SelectedValue
                        .Parameters.Add("@IdUtilizatorModificare", SqlDbType.Int).Value = 1
                    End With
                    Try
                        conn.Open()
                        comm.ExecuteNonQuery()
                        RadGrid1.Rebind()

                        nmr1all.Text = String.Empty
                        nmr1dal.Text = String.Empty
                        nmr1tot.Text = String.Empty

                        txtCognome.Text = String.Empty
                        txtLine.Text = String.Empty
                        txtMarca.Text = String.Empty
                        txtNome.Text = String.Empty
                        txtPostDeLucru.Text = String.Empty
                        txtReparto.Text = String.Empty
                        txtTipPostDeLucru.Text = String.Empty

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


    End Class
End Namespace