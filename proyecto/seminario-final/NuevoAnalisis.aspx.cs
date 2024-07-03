using System;
using System.Web.Services;
using Models;
using Services;
namespace seminario_final
{
    public partial class NuevoAnalisis : System.Web.UI.Page
    {
        private static ushort idUsuario = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUsuario = ServiceSesion.ObtenerUsuario();
            if (!IsPostBack)
            {
                ValidarLogin();
            }
        }
        


        [WebMethod]
        public static ModelProducto ObtenerAlertasPorProducto(int idProducto)
        {
            ModelProducto producto = ServiceAnalisis.ObtenerPorId(idUsuario, idProducto);
            if (producto.Nombre == "")
            {
                return null;
            }
            return producto;
        }

        [WebMethod]
        public static bool GuardarAnalisis(uint idProducto)
        {
            bool res = ServiceAnalisis.GuardarAnalisis(idUsuario, idProducto);
            return res;
        }

        private void ValidarLogin()
        {
            ushort idUsuario = ServiceSesion.ObtenerUsuario();
            if (idUsuario == 0)
            {
                Response.Redirect("Login");
            }
        }
    }
}