using OfficeOpenXml;
using System.Data;
using System.Linq;

public static class ExcelPackageExtensions
{
    public static DataTable ToDataTable(this ExcelPackage package)
    {
        ExcelWorksheet workSheet = package.Workbook.Worksheets.First();

        DataTable tbl = new DataTable();
        bool hasHeader = true; // adjust it accordingly( i've mentioned that this is a simple approach)
        foreach (var firstRowCell in workSheet.Cells[1, 1, 1, workSheet.Dimension.End.Column])
        {
            tbl.Columns.Add(hasHeader ? firstRowCell.Text : string.Format("Column {0}", firstRowCell.Start.Column));
        }
        var startRow = hasHeader ? 2 : 1;
        for (var rowNum = startRow; rowNum <= workSheet.Dimension.End.Row; rowNum++)
        {
            var wsRow = workSheet.Cells[rowNum, 1, rowNum, workSheet.Dimension.End.Column];
            var row = tbl.NewRow();
            foreach (var cell in wsRow)
            {
                row[cell.Start.Column - 1] = cell.Text;
            }
            tbl.Rows.Add(row);
        }
        return tbl;
    }

}