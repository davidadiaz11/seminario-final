using System;

namespace seminario_final
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void GuardarUsuarioEnSesion(string idUsuarioString)
        {
            var res = ServiceSesion.GuardarUsuario(idUsuarioString);
            if (res)
            {
                Response.Redirect("Inicio");
            }
        }

        protected void btn_admin_Click(object sender, EventArgs e)
        {
            GuardarUsuarioEnSesion("1");
        }

        protected void btn_usu_Click(object sender, EventArgs e)
        {
            GuardarUsuarioEnSesion("2");
        }
    }
}