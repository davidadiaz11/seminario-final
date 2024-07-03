using System;
using System.Collections.Generic;
using Services;
using Models;
namespace seminario_final
{
    public partial class Inicio : System.Web.UI.Page
    {

        private ushort idUsuario = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUsuario = ServiceSesion.ObtenerUsuario();

            if (!IsPostBack)
            {
                ValidarLogin();
                ObtenerUltimosAnalisis();
                ObtenerUltimosSellos();
            }
        }

        private void ValidarLogin()
        {
            ushort idUsuario = ServiceSesion.ObtenerUsuario();
            if (idUsuario == 0)
            {
                Response.Redirect("Login");
            }
        }

        private void ObtenerUltimosAnalisis()
        {
            List<ModelAnalisis> lista = ServiceAnalisis.ObtenerUltimosAnalisis(idUsuario);
            rpt_ultimos.DataSource = lista;
            rpt_ultimos.DataBind();
        }
        private void ObtenerUltimosSellos()
        {
            List<ModelNutriente> lista = ServiceSello.ObtenerUltimosSellos(idUsuario);
            rpt_ultimos_sellos.DataSource = lista;
            rpt_ultimos_sellos.DataBind();
        }
    }
}