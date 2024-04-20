using System;
using System.Collections.Generic;


namespace seminario_final
{
    public partial class ListadoProductos : System.Web.UI.Page
    {
        List<ModelProducto> productos = new List<ModelProducto>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


        private void ObtenerProductos()
        {
            productos = ServiceProducto.ObtenerProductos();
        }
        private void CargarProductos()
        {
            //tabla.datasource = productos
        }
    }
}