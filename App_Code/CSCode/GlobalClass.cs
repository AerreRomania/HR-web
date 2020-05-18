using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using System.Text;

public static class GlobalClass
{
    
    public static bool VerificareAcces(string Pagina, string IdUtilizator)
    {
        Nullable<bool> AccesAutorizat = null;
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        dcWbmOlimpias.VerificareAcces(Convert.ToInt32(IdUtilizator), Pagina, ref AccesAutorizat);
        return AccesAutorizat.Value;
    }
    public static bool VerificareAccesOperatie(string Pagina, string IdUtilizator, string Operatie)
    {
        Nullable<bool> AccesAutorizat = null;
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        dcWbmOlimpias.VerificareAccesOperatie(Convert.ToInt32(IdUtilizator), Pagina, Operatie, ref AccesAutorizat);
        return AccesAutorizat.Value;
    }
    public static string ConversieNumarInLuna(int iLuna)
    {
        string Luna = "";
        switch (iLuna)
        {
            case 1:
                Luna = "GENNAIO";
                break;
            case 2:
                Luna = "FEBBRAIO";
                break;
            case 3:
                Luna = "MARZO";
                break;
            case 4:
                Luna = "APRILE";
                break;
            case 5:
                Luna = "MAGGIO";
                break;
            case 6:
                Luna = "GIUGNO";
                break;
            case 7:
                Luna = "LUGLIO";
                break;
            case 8:
                Luna = "AGOSTO";
                break;
            case 9:
                Luna = "SETTEMBRE";
                break;
            case 10:
                Luna = "OTTOBRE";
                break;
            case 11:
                Luna = "NOVEMBRE";
                break;
            case 12:
                Luna = "DICEMBRE";
                break;
        }

        return Luna;
    }
}

