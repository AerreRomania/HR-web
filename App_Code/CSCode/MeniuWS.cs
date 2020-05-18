using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace WbmOlimpias
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class MeniuWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession=true)]
        public void SchimbareFirma(string IdFirma)
        {
            Session["IdFirma"] = IdFirma;
        }
    }
}