using System;
using System.Web.Services;

namespace seminario_final
{
    public partial class AnalisisNuevo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static ModelProducto ObtenerAlertasPorProducto(int idProducto)
        {
            ModelProducto producto = ServiceAnalisis.ObtenerPorId(idProducto);
            if (producto.Nombre == "")
            {
                return null;
            }
            return producto;
        }

        [WebMethod]
        public static bool GuardarAnalisis(uint idProducto)
        {
            bool res = ServiceAnalisis.GuardarAnalisis(idProducto);
            return res;
        }
    }
}