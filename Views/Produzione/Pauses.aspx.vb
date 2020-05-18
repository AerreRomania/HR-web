
Imports System.Data
Imports System.Drawing
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class Stats
    Inherits System.Web.UI.Page


    Public MyConnection As New SqlConnection
    Dim _strConnection As String
    Public MyDataSet As New DataSet

    Dim dvPausa As DataView
    Dim dvPausa1 As DataView

    Dim day As String
    Dim month As String
    Dim year As String
    Dim tblPauza As New DataTable
    Dim tmpTable As New DataTable


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        _strConnection = "Data Source = KNSQL2014;Initial Catalog = ONLYOU; user=sa;password=onlyouolimpias"
        MyConnection = New SqlConnection(_strConnection)

        If checkerdate.Value = True Then
            day = datetimecalendar.SelectedDate.Day
            month = datetimecalendar.SelectedDate.Month
            year = datetimecalendar.SelectedDate.Year

        Else
            day = DateTime.Now.Day
            month = DateTime.Now.Month
            year = DateTime.Now.Year
        End If

        LoadBreakTable()

    End Sub




    Public Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles datetimecalendar.SelectionChanged
        checkerdate.Value = True
        LoadBreakTableOnCalendarChange()
    End Sub


    Private Sub CreateColumns()
        MyDataSet.Reset()

        tmpTable = MyDataSet.Tables.Add("Pausa")
        With tmpTable.Columns
            .Add("Id", GetType(Integer))
            .Add("Worker", GetType(String))
            .Add("Pause type", GetType(String))
            .Add("Duration", GetType(String))
            .Add("StartPause", GetType(String))
            .Add("EndPause", GetType(String))
            .Add("Date", GetType(String))
            .Add("newDurat", GetType(Integer))
            .Add("Linea", GetType(String))
            .Add("numlinea", GetType(Integer))
        End With
    End Sub

    Private Sub LoadBreakTable()
        Dim editvalue As String
        editvalue = datetimecalendar.SelectedDate

        Dim query As String = "SELECT tblPause.newID, tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Angajati.Angajat,Angajati.Linie FROM tblPause INNER Join Realizari ON tblPause.IdRealization = Realizari.Id inner join Angajati ON Realizari.IdAngajat = Angajati.Id WHERE Day(tblPause.StartTime) = '" & day & "' AND Month(tblPause.StartTime) = '" & month & "' AND Year(tblPause.StartTime) = '" & year & "'"

        MyConnection.Open()
        Dim myCommand As New SqlCommand(query, MyConnection)
        Dim myDataReader As SqlDataReader = myCommand.ExecuteReader()
        tblPauza.Load(myDataReader)
        myDataReader.Close()
        myCommand = Nothing
        MyConnection.Close()

        MyDataSet.Reset()
        dvPausa = Nothing

        If Not IsNothing(wcgrid.DataSource) Then
            wcgrid.DataSource = Nothing
        End If

        CreateColumns()

        For Each row As DataRow In tblPauza.Rows
            Dim id As Integer = CInt(row.Item(0))
            Dim tip As String = CStr(row.Item(1))
            Dim emp As String = CStr(row.Item(4))
            Dim line As String = CStr(row.Item(5))

            Dim duration As String = String.Empty
            Dim endP As String = String.Empty
            Dim drt As Double = 0           '//real duration

            Dim startTime As DateTime = CDate(row.Item(2))

            Dim endTime As DateTime
            If IsDBNull(row(3)) Then
                duration = "In pausa..."
                drt = 0
            Else
                endTime = CDate(row.Item(3))

                Dim ts As TimeSpan = endTime.Subtract(startTime)
                drt = ts.Minutes
                duration = Format(drt.ToString() & "min")
                endP = Format(endTime, "HH:mm") ' .AddHours(2)
            End If

            Dim actDate As String = Format(startTime, "dd.MM.yyyy")
            Dim startP As String = Format(startTime, "HH:mm") '.AddHours(2)

            Dim newRow As DataRow = MyDataSet.Tables("Pausa").NewRow
            With newRow
                .Item(0) = id           '//oreder by id
                .Item(1) = emp          '//employee
                .Item(2) = tip          '//pausa type
                .Item(3) = duration     '//endTime - startime
                .Item(4) = startP    '//pause startTime
                .Item(5) = endP         '//pause endTime
                .Item(6) = actDate      '//actuel date
                .Item(7) = CInt(drt)    '//invisible column for total amount of pause
                .Item(8) = line
                .Item(9) = Int32.Parse(line.Remove(0, 5))

            End With

            MyDataSet.Tables("Pausa").Rows.Add(newRow)
        Next

        'CONF B
        Dim linea1max As Int32 = 0
        Dim linea2max As Int32 = 0
        Dim linea3max As Int32 = 0
        Dim linea4max As Int32 = 0
        Dim linea5max As Int32 = 0
        Dim linea6max As Int32 = 0
        Dim linea7max As Int32 = 0
        Dim linea8max As Int32 = 0
        Dim linea9max As Int32 = 0
        Dim linea10max As Int32 = 0
        Dim linea11max As Int32 = 0
        Dim linea12max As Int32 = 0
        'CONF A
        Dim linea13max As Int32 = 0
        Dim linea14max As Int32 = 0
        Dim linea15max As Int32 = 0
        Dim linea16max As Int32 = 0

        'LINEA 1
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 1 And row(2) = "WC" Then
                linea1max = linea1max + 1
            End If
        Next
        linea1m.Text = linea1max

        'LINEA 2
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 2 And row(2) = "WC" Then
                linea2max = linea2max + 1
            End If
        Next
        linea2m.Text = linea2max

        'LINEA 3
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 3 And row(2) = "WC" Then
                linea3max = linea3max + 1
            End If
        Next
        linea3m.Text = linea3max

        'LINEA 4
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 4 And row(2) = "WC" Then
                linea4max = linea4max + 1
            End If
        Next
        linea4m.Text = linea4max

        'LINEA 5
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 5 And row(2) = "WC" Then
                linea5max = linea5max + 1
            End If
        Next
        linea5m.Text = linea5max

        'LINEA 6
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 6 And row(2) = "WC" Then
                linea6max = linea6max + 1
            End If
        Next
        linea6m.Text = linea6max

        'LINEA 7
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 7 And row(2) = "WC" Then
                linea7max = linea7max + 1
            End If
        Next
        linea7m.Text = linea7max

        'LINEA 8
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 8 And row(2) = "WC" Then
                linea8max = linea8max + 1
            End If
        Next
        linea8m.Text = linea8max

        'LINEA 9
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 9 And row(2) = "WC" Then
                linea9max = linea9max + 1
            End If
        Next
        linea9m.Text = linea9max

        'LINEA 10
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 10 And row(2) = "WC" Then
                linea10max = linea10max + 1
            End If
        Next
        linea10m.Text = linea10max

        'LINEA 11
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 11 And row(2) = "WC" Then
                linea11max = linea11max + 1
            End If
        Next
        linea11m.Text = linea11max

        'LINEA 12
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 12 And row(2) = "WC" Then
                linea12max = linea12max + 1
            End If
        Next
        linea12m.Text = linea12max

        'LINEA 13
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 13 And row(2) = "WC" Then
                linea13max = linea13max + 1
            End If
        Next
        linea13m.Text = linea13max

        ''LINEA 13
        'For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
        '    If row(9) = 13 And row(2) = "WC" Then
        '        linea13max = linea13max + 1
        '    End If
        'Next
        'linea13m.Text = linea13max

        'LINEA 14
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 14 And row(2) = "WC" Then
                linea14max = linea14max + 1
            End If
        Next
        linea14m.Text = linea14max

        'LINEA 15
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 15 And row(2) = "WC" Then
                linea15max = linea15max + 1
            End If
        Next
        linea15m.Text = linea15max

        'LINEA 16
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 16 And row(2) = "WC" Then
                linea16max = linea16max + 1
            End If
        Next
        linea16m.Text = linea16max


        dvPausa = New DataView(MyDataSet.Tables("Pausa"))
        dvPausa.Sort = "numlinea,Worker,Duration DESC"

        wcgrid.DataSource = dvPausa
        wcgrid.DataBind()
    End Sub

    Private Sub LoadBreakTableOnCalendarChange()
        Dim editvalue As String
        editvalue = datetimecalendar.SelectedDate

        Dim day As String = datetimecalendar.SelectedDate.Day
        Dim month As String = datetimecalendar.SelectedDate.Month
        Dim year As String = datetimecalendar.SelectedDate.Year

        tblPauza.Clear()


        Dim query As String = "SELECT tblPause.newID, tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Angajati.Angajat,Angajati.Linie FROM tblPause INNER Join Realizari ON tblPause.IdRealization = Realizari.Id inner join Angajati ON Realizari.IdAngajat = Angajati.Id WHERE Day(tblPause.StartTime) = '" & day & "' AND Month(tblPause.StartTime) = '" & month & "' AND Year(tblPause.StartTime) = '" & year & "'"

        MyConnection.Open()
        Dim myCommand As New SqlCommand(query, MyConnection)
        Dim myDataReader As SqlDataReader = myCommand.ExecuteReader()
        tblPauza.Load(myDataReader)
        myDataReader.Close()
        myCommand = Nothing
        MyConnection.Close()

        MyDataSet.Reset()
        dvPausa = Nothing

        If Not IsNothing(wcgrid.DataSource) Then
            wcgrid.DataSource = Nothing
        End If

        CreateColumns()

        For Each row As DataRow In tblPauza.Rows
            Dim id As Integer = CInt(row.Item(0))
            Dim tip As String = CStr(row.Item(1))
            Dim emp As String = CStr(row.Item(4))
            Dim line As String = CStr(row.Item(5))

            Dim duration As String = String.Empty
            Dim endP As String = String.Empty
            Dim drt As Double = 0           '//real duration

            Dim startTime As DateTime = CDate(row.Item(2))

            Dim endTime As DateTime
            If IsDBNull(row(3)) Then
                duration = "In pausa..."
                drt = 0
            Else
                endTime = CDate(row.Item(3))

                Dim ts As TimeSpan = endTime.Subtract(startTime)
                drt = ts.Minutes
                duration = Format(drt.ToString() & "min")
                endP = Format(endTime, "HH:mm")
            End If

            Dim actDate As String = Format(startTime, "dd.MM.yyyy")
            Dim startP As String = Format(startTime, "HH:mm")


            Dim newRow As DataRow = MyDataSet.Tables("Pausa").NewRow
            With newRow
                .Item(0) = id           '//oreder by id
                .Item(1) = emp          '//employee
                .Item(2) = tip          '//pausa type
                .Item(3) = duration     '//endTime - startime
                .Item(4) = startP       '//pause startTime
                .Item(5) = endP         '//pause endTime
                .Item(6) = actDate      '//actuel date
                .Item(7) = CInt(drt)    '//invisible column for total amount of pause
                .Item(8) = line
                .Item(9) = Int32.Parse(line.Remove(0, 5))

            End With

            MyDataSet.Tables("Pausa").Rows.Add(newRow)
        Next


        'CONF B
        Dim linea1max As Int32 = 0
        Dim linea2max As Int32 = 0
        Dim linea3max As Int32 = 0
        Dim linea4max As Int32 = 0
        Dim linea5max As Int32 = 0
        Dim linea6max As Int32 = 0
        Dim linea7max As Int32 = 0
        Dim linea8max As Int32 = 0
        Dim linea9max As Int32 = 0
        Dim linea10max As Int32 = 0
        Dim linea11max As Int32 = 0
        Dim linea12max As Int32 = 0
        'CONF A
        Dim linea13max As Int32 = 0
        Dim linea14max As Int32 = 0
        Dim linea15max As Int32 = 0
        Dim linea16max As Int32 = 0

        'LINEA 1
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 1 And row(2) = "WC" Then
                linea1max = linea1max + 1
            End If
        Next
        linea1m.Text = linea1max

        'LINEA 2
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 2 And row(2) = "WC" Then
                linea2max = linea2max + 1
            End If
        Next
        linea2m.Text = linea2max

        'LINEA 3
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 3 And row(2) = "WC" Then
                linea3max = linea3max + 1
            End If
        Next
        linea3m.Text = linea3max

        'LINEA 4
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 4 And row(2) = "WC" Then
                linea4max = linea4max + 1
            End If
        Next
        linea4m.Text = linea4max

        'LINEA 5
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 5 And row(2) = "WC" Then
                linea5max = linea5max + 1
            End If
        Next
        linea5m.Text = linea5max

        'LINEA 6
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 6 And row(2) = "WC" Then
                linea6max = linea6max + 1
            End If
        Next
        linea6m.Text = linea6max

        'LINEA 7
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 7 And row(2) = "WC" Then
                linea7max = linea7max + 1
            End If
        Next
        linea7m.Text = linea7max

        'LINEA 8
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 8 And row(2) = "WC" Then
                linea8max = linea8max + 1
            End If
        Next
        linea8m.Text = linea8max

        'LINEA 9
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 9 And row(2) = "WC" Then
                linea9max = linea9max + 1
            End If
        Next
        linea9m.Text = linea9max

        'LINEA 10
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 10 And row(2) = "WC" Then
                linea10max = linea10max + 1
            End If
        Next
        linea10m.Text = linea10max

        'LINEA 11
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 11 And row(2) = "WC" Then
                linea11max = linea11max + 1
            End If
        Next
        linea11m.Text = linea11max

        'LINEA 12
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 12 And row(2) = "WC" Then
                linea12max = linea12max + 1
            End If
        Next
        linea12m.Text = linea12max

        'LINEA 13
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 13 And row(2) = "WC" Then
                linea13max = linea13max + 1
            End If
        Next
        linea13m.Text = linea13max

        'LINEA 13
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 13 And row(2) = "WC" Then
                linea13max = linea13max + 1
            End If
        Next
        linea13m.Text = linea13max

        'LINEA 14
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 14 And row(2) = "WC" Then
                linea14max = linea14max + 1
            End If
        Next
        linea14m.Text = linea14max

        'LINEA 15
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 15 And row(2) = "WC" Then
                linea15max = linea15max + 1
            End If
        Next
        linea15m.Text = linea15max

        'LINEA 16
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 16 And row(2) = "WC" Then
                linea16max = linea16max + 1
            End If
        Next
        linea16m.Text = linea16max

        dvPausa = New DataView(MyDataSet.Tables("Pausa"))
        dvPausa.Sort = "numlinea,Worker,Duration DESC"

        wcgrid.DataSource = dvPausa
        wcgrid.DataBind()


    End Sub

    Public Sub SortByWorker_Click(sender As Object, e As EventArgs) Handles wrkname.Click, wrkcount.Click, wrkdate.Click, wrkduration.Click, wrklinea.Click, wrkpausetype.Click, wrkstarttime.Click, wrkstoptime.Click

        Dim editvalue As String
        editvalue = datetimecalendar.SelectedDate

        tblPauza.Clear()

        Dim query As String = "SELECT tblPause.newID, tblPause.PauseType,tblPause.StartTime,tblPause.EndTime,Angajati.Angajat,Angajati.Linie FROM tblPause INNER Join Realizari ON tblPause.IdRealization = Realizari.Id inner join Angajati ON Realizari.IdAngajat = Angajati.Id WHERE Day(tblPause.StartTime) = '" & day & "' AND Month(tblPause.StartTime) = '" & month & "' AND Year(tblPause.StartTime) = '" & year & "'"

        MyConnection.Open()
        Dim myCommand As New SqlCommand(query, MyConnection)
        Dim myDataReader As SqlDataReader = myCommand.ExecuteReader()
        tblPauza.Load(myDataReader)
        myDataReader.Close()
        myCommand = Nothing
        MyConnection.Close()

        MyDataSet.Reset()
        dvPausa = Nothing

        If Not IsNothing(wcgrid.DataSource) Then
            wcgrid.DataSource = Nothing
        End If

        CreateColumns()

        For Each row As DataRow In tblPauza.Rows
            Dim id As Integer = CInt(row.Item(0))
            Dim tip As String = CStr(row.Item(1))
            Dim emp As String = CStr(row.Item(4))
            Dim line As String = CStr(row.Item(5))

            Dim duration As String = String.Empty
            Dim endP As String = String.Empty
            Dim drt As Double = 0           '//real duration

            Dim startTime As DateTime = CDate(row.Item(2))

            Dim endTime As DateTime
            If IsDBNull(row(3)) Then
                duration = "In pausa..."
                drt = 0
            Else
                endTime = CDate(row.Item(3))

                Dim ts As TimeSpan = endTime.Subtract(startTime)
                drt = ts.Minutes
                duration = Format(drt.ToString() & "min")
                endP = Format(endTime, "HH:mm")
            End If

            Dim actDate As String = Format(startTime, "dd.MM.yyyy")
            Dim startP As String = Format(startTime, "HH:mm")


            Dim newRow As DataRow = MyDataSet.Tables("Pausa").NewRow
            With newRow
                .Item(0) = id           '//oreder by id
                .Item(1) = emp          '//employee
                .Item(2) = tip          '//pausa type
                .Item(3) = duration     '//endTime - startime
                .Item(4) = startP       '//pause startTime
                .Item(5) = endP         '//pause endTime
                .Item(6) = actDate      '//actuel date
                .Item(7) = CInt(drt)    '//invisible column for total amount of pause
                .Item(8) = line
                .Item(9) = Int32.Parse(line.Remove(0, 5))

            End With

            MyDataSet.Tables("Pausa").Rows.Add(newRow)
        Next



        If sender Is wrkname Then
            If checker1.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Worker ASC"
                checker1.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Worker Desc"
                checker1.Value = True
            End If
        End If

        If sender Is wrkcount Then
            If checker2.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "newDurat DESC"
                checker2.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "newDurat ASC"
                checker2.Value = True
            End If
        End If

        If sender Is wrkdate Then
            If checker3.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Date DESC"
                checker3.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Date ASC"
                checker3.Value = True
            End If
        End If

        If sender Is wrkduration Then
            If checker4.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Duration DESC"
                checker4.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Duration ASC"
                checker4.Value = True
            End If
        End If

        If sender Is wrklinea Then
            If checker5.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "numlinea ASC"
                checker5.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "numlinea Desc"
                checker5.Value = True
            End If
        End If

        If sender Is wrkpausetype Then
            If checker6.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Pause type ASC"
                checker6.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "Pause type Desc"
                checker6.Value = True
            End If
        End If

        If sender Is wrkstarttime Then
            If checker7.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "StartPause ASC"
                checker7.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "StartPause Desc"
                checker7.Value = True
            End If
        End If

        If sender Is wrkstoptime Then
            If checker8.Value = True Then
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "EndPause ASC"
                checker8.Value = False
            Else
                dvPausa = New DataView(MyDataSet.Tables("Pausa"))
                dvPausa.Sort = "EndPause Desc"
                checker8.Value = True
            End If
        End If

        'CONF B
        Dim linea1max As Int32 = 0
        Dim linea2max As Int32 = 0
        Dim linea3max As Int32 = 0
        Dim linea4max As Int32 = 0
        Dim linea5max As Int32 = 0
        Dim linea6max As Int32 = 0
        Dim linea7max As Int32 = 0
        Dim linea8max As Int32 = 0
        Dim linea9max As Int32 = 0
        Dim linea10max As Int32 = 0
        Dim linea11max As Int32 = 0
        Dim linea12max As Int32 = 0
        'CONF A
        Dim linea13max As Int32 = 0
        Dim linea14max As Int32 = 0
        Dim linea15max As Int32 = 0
        Dim linea16max As Int32 = 0

        'LINEA 1
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 1 And row(2) = "WC" Then
                linea1max = linea1max + 1
            End If
        Next
        linea1m.Text = linea1max

        'LINEA 2
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 2 And row(2) = "WC" Then
                linea2max = linea2max + 1
            End If
        Next
        linea2m.Text = linea2max

        'LINEA 3
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 3 And row(2) = "WC" Then
                linea3max = linea3max + 1
            End If
        Next
        linea3m.Text = linea3max

        'LINEA 4
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 4 And row(2) = "WC" Then
                linea4max = linea4max + 1
            End If
        Next
        linea4m.Text = linea4max

        'LINEA 5
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 5 And row(2) = "WC" Then
                linea5max = linea5max + 1
            End If
        Next
        linea5m.Text = linea5max

        'LINEA 6
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 6 And row(2) = "WC" Then
                linea6max = linea6max + 1
            End If
        Next
        linea6m.Text = linea6max

        'LINEA 7
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 7 And row(2) = "WC" Then
                linea7max = linea7max + 1
            End If
        Next
        linea7m.Text = linea7max

        'LINEA 8
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 8 And row(2) = "WC" Then
                linea8max = linea8max + 1
            End If
        Next
        linea8m.Text = linea8max

        'LINEA 9
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 9 And row(2) = "WC" Then
                linea9max = linea9max + 1
            End If
        Next
        linea9m.Text = linea9max

        'LINEA 10
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 10 And row(2) = "WC" Then
                linea10max = linea10max + 1
            End If
        Next
        linea10m.Text = linea10max

        'LINEA 11
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 11 And row(2) = "WC" Then
                linea11max = linea11max + 1
            End If
        Next
        linea11m.Text = linea11max

        'LINEA 12
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 12 And row(2) = "WC" Then
                linea12max = linea12max + 1
            End If
        Next
        linea12m.Text = linea12max

        'LINEA 13
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 13 And row(2) = "WC" Then
                linea13max = linea13max + 1
            End If
        Next
        linea13m.Text = linea13max

        'LINEA 13
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 13 And row(2) = "WC" Then
                linea13max = linea13max + 1
            End If
        Next
        linea13m.Text = linea13max

        'LINEA 14
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 14 And row(2) = "WC" Then
                linea14max = linea14max + 1
            End If
        Next
        linea14m.Text = linea14max

        'LINEA 15
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 15 And row(2) = "WC" Then
                linea15max = linea15max + 1
            End If
        Next
        linea15m.Text = linea15max

        'LINEA 16
        For Each row As DataRow In MyDataSet.Tables("Pausa").Rows
            If row(9) = 16 And row(2) = "WC" Then
                linea16max = linea16max + 1
            End If
        Next
        linea16m.Text = linea16max

        wcgrid.DataSource = dvPausa
        wcgrid.DataBind()

    End Sub

    Protected Sub SubmitAppraisalGrid_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        wcgrid.PageIndex = e.NewPageIndex
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        e.Row.Cells(9).Style.Add("display", "none")
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            If (e.Row.RowIndex = 0) Then
                'e.Row.Style.Add("height", "40px")
                'e.Row.Style.Add("position", "absolute")

            End If
        End If

    End Sub

End Class
