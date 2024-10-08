﻿using System;
using System.Web;
namespace seminario_final
{
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
            ushort resultado = 0;
            try
            {
                string idString = HttpContext.Current.Session["usuID"].ToString();
                return Convert.ToUInt16(idString);
            }
            catch (Exception)
            {
                return resultado;
                throw;
            }
        }

        public static bool CerrarSesion()
        {
            bool resultado = false;
            try
            {
                ushort idUsuario = ObtenerUsuario();
                if (idUsuario == 0)
                {
                    return true;
                }
                HttpContext.Current.Session["usuID"] = "";
                resultado = true;
            }
            catch (Exception ex)
            {
                resultado = false;
            }
            return resultado;
        }

    }
}
