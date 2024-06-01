using System;
using System.Collections.Generic;

namespace seminario_final
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ObtenerUltimosAnalisis();
                ObtenerUltimosSellos();
            }
        }

        private void ObtenerUltimosAnalisis()
        {
            List<ModelAnalisis> lista = ServiceAnalisis.ObtenerUltimosAnalisis();
            rpt_ultimos.DataSource = lista;
            rpt_ultimos.DataBind();
        }
        private void ObtenerUltimosSellos()
        {
            List<ModelAlerta> lista = ServiceSello.ObtenerUltimosSellos();
            rpt_ultimos_sellos.DataSource = lista;
            rpt_ultimos_sellos.DataBind();
        }
    }
}