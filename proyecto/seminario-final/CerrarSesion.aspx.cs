﻿using System;
namespace seminario_final
{
    public partial class CerrarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServiceSesion.CerrarSesion();
            Response.Redirect("/");
        }

    }
}