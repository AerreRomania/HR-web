using System;

partial class DataClassWbmOlimpias : System.Data.Linq.DataContext
{
    partial void OnCreated()
    {
        //Put your desired timeout here.
        this.CommandTimeout = 360000;

        //If you do not want to hard code it, then take it 
        //from Application Settings / AppSettings
        //this.CommandTimeout = Settings.Default.CommandTimeout;
    }

    internal void PrezentaImport(string codAngajat, DateTime data, string codTipOra, decimal v1, decimal v2, decimal v3, int v4, ref int? id, ref int? idEroare)
    {
        throw new NotImplementedException();
    }
}