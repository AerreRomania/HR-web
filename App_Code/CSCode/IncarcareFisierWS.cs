using System;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
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
    public class IncarcareFisierWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        /* pentru upload status: http://dotnetslackers.com/columns/ajax/ASPNETAjaxWebService.aspx */
        public void Incarcare()
        {
            Nullable<int> Id = null;
            string Fisier = "", Eroare = "";
            HttpContext postedContext = HttpContext.Current;
            try
            {
                HttpFileCollection hfc = postedContext.Request.Files;
                

                if (hfc.Count == 1)
                {
                    HttpPostedFile hpf = (HttpPostedFile)hfc[0];
                    if (hpf.FileName != "")
                    {
                        if (hpf.ContentLength > 1)
                        {
                            byte[] binaryWriteArray = new byte[hpf.InputStream.Length];
                            hpf.InputStream.Read(binaryWriteArray, 0, (int)hpf.InputStream.Length);

                            Fisier = System.IO.Path.GetFileName(hpf.FileName);

                            if (postedContext.Request.Form["hfTestareImagine"].ToString() == "1")
                            {
                                /*if (!EsteImagine(binaryWriteArray))
                                    Eroare = "Selectati un fisier cu imagine!";*/
                            }
                            if (Eroare == "")
                            {
                                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();

                                dcWbmOlimpias.FisierAdaugare(Fisier, hpf.ContentType, binaryWriteArray, ref Id);

                            }
                        }
                        else
                            Eroare = "Fisierul ales este gol!";
                    }
                    else
                        Eroare = "Alegeti un fisier";
                }
                else
                    Eroare = "Alegeti un fisier";
            }
            catch (Exception ex)
            {
                Eroare = ex.Message;

                //Eroare = "Eroare cu baza de date!";
                Eroare = Eroare.Replace('\\','1');
                Eroare = Eroare.Replace('\'', '2');
                Eroare = Eroare.Replace('(', '3');
                Eroare = Eroare.Replace(')', '4');
                Eroare = Eroare.Replace(Convert.ToChar(13), '5');
                System.IO.File.AppendAllText("c:\\Temp\\Eroare.log",Eroare);
            }
           
            postedContext.Response.Clear();
            if (Eroare == "")
                postedContext.Response.Write("<html><body><script type=\"text/javascript\">parent.IncarcareCompleta('" + Id.ToString() + "','" + Fisier + "');</script></body></html> ");
                //postedContext.Response.Write("<html><body><script type=\"text/javascript\">parent.IncarcareCuEroare('aha');</script></body></html> ");
            else
                postedContext.Response.Write("<html><body><script type=\"text/javascript\">parent.IncarcareCuEroare('" + Eroare + "');</script></body></html> ");
        }

        private bool EsteImagine(byte[] binaryWriteArray)
        {
            MemoryStream imageStream = new MemoryStream(binaryWriteArray);
            //imageStream.Read(binaryWriteArray, 0, (int)imageStream.Length);
            string strFormat = "";
            try
            {
                Image test = Image.FromStream(imageStream);
                ImageFormat bmpFormat = test.RawFormat;

                if (bmpFormat.Equals(ImageFormat.Bmp)) strFormat = "BMP";
                else if (bmpFormat.Equals(ImageFormat.Emf)) strFormat = "EMF";
                else if (bmpFormat.Equals(ImageFormat.Exif)) strFormat = "EXIF";
                else if (bmpFormat.Equals(ImageFormat.Gif)) strFormat = "GIF";
                else if (bmpFormat.Equals(ImageFormat.Icon)) strFormat = "Icon";
                else if (bmpFormat.Equals(ImageFormat.Jpeg)) strFormat = "JPEG";
                else if (bmpFormat.Equals(ImageFormat.MemoryBmp)) strFormat = "MemoryBMP";
                else if (bmpFormat.Equals(ImageFormat.Png)) strFormat = "PNG";
                else if (bmpFormat.Equals(ImageFormat.Tiff)) strFormat = "TIFF";
                else if (bmpFormat.Equals(ImageFormat.Wmf)) strFormat = "WMF";
            }
            catch (Exception)
            { }


            if (strFormat == "")
                return false;
            else
                return true;
        }

    }
}