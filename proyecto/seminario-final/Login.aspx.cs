using System;
using Services;
namespace seminario_final
{
    public partial class Login : System.Web.UI.Page
    {
        private string email, contrasena;
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

        private void ObtenerDatosDeAcceso()
        {
            email = txt_email.Text;
            contrasena = txt_contrasenia.Text;
        }

        private bool Validar()
        {
            var master = Master as MasterPage;
            if (string.IsNullOrEmpty(email))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'Ingrese email',resetOnHover:true});", true);
                return false;
            }
            if (string.IsNullOrEmpty(contrasena))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'Ingrese contraseña',resetOnHover:true});", true);
                return false;
            }
            return true;
        }

        private void Autenticar()
        {
            ObtenerDatosDeAcceso();
            if (!Validar())
            {
                return;
            }
            var res = ServiceUsuario.Autenticar(email, contrasena);
            if (!res.Ok)
            {
                var master = Master as MasterPage;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'" + res.Errores + "',resetOnHover:true});", true);
                return;
            }
            GuardarUsuarioEnSesion(res.Data.Id.ToString());
        }

        protected void btn_admin_Click(object sender, EventArgs e)
        {
            GuardarUsuarioEnSesion("1");
        }

        protected void btn_ingresar_Click(object sender, EventArgs e)
        {
            Autenticar();
        }

        protected void btn_usu_Click(object sender, EventArgs e)
        {
            GuardarUsuarioEnSesion("2");
        }
    }
}