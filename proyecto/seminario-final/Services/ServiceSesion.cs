using System;
using System.Web;

public class ServiceSesion
{
    public ServiceSesion()
    {
    }

    public static bool GuardarUsuario(string idString)
    {
        bool resultado = false;
        try
        {
            if (string.IsNullOrEmpty(idString))
            {
                return resultado;
            }

            HttpContext.Current.Session["usuID"] = idString;
            resultado = true;
        }
        catch (Exception ex)
        {
            resultado = false;
        }
        
        return resultado;
    }
    public static ushort ObtenerUsuario()
    {
        string idString = HttpContext.Current.Session["usuID"].ToString();
        return Convert.ToUInt16(idString);
    }

}
