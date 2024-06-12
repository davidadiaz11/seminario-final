﻿using System;
using System.Collections.Generic;
using Services;
using Models;
namespace seminario_final
{
    public partial class Inicio : System.Web.UI.Page
    {

        private ushort idUsuario = ServiceSesion.ObtenerUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ValidarLogin())
                {
                    Response.Redirect("Login");
                }
                ObtenerUltimosAnalisis();
                ObtenerUltimosSellos();
            }
        }

        private bool ValidarLogin()
        {
            ushort idUsuario = ServiceSesion.ObtenerUsuario();
            return idUsuario == 0;
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