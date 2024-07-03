using System;
using System.Web.UI;
using Models;
using Services;
namespace seminario_final
{
    public partial class FormularioUsuario : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private bool ValidarFormulario()
        {
            var master = Master as MasterPage;
            if (string.IsNullOrEmpty(txt_nombre.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'Ingrese nombre',resetOnHover:true});", true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_email.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'Ingrese email',resetOnHover:true});", true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_contrasenia.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'Ingrese contraseña',resetOnHover:true});", true);
                return false;
            }
            return true;
        }

        private ModelUsuario crearObjetoDesdeFormulario()
        {
            return new ModelUsuario()
            {
                Nombre = txt_nombre.Text,
                Email = txt_email.Text,
                Contrasena = txt_contrasenia.Text
            };
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            var resValidacion = ValidarFormulario();
            if (!resValidacion)
            {
                return;
            }
            ModelUsuario nuevoElemento = crearObjetoDesdeFormulario();
            var resRegistrar = ServiceUsuario.Guardar(nuevoElemento);
            if (!resRegistrar.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.error({title:'Error',message:'" + resRegistrar.Errores + "',resetOnHover:true});", true);
                return;
            }
            ServiceSesion.GuardarUsuario(resRegistrar.Data.ToString());
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "iziToast.success({title:'', onClosing: function(instance, toast, closedBy){ if(closedBy == 'drag' || closedBy == 'overlay' || closedBy == 'button') { window.location = 'Inicio'; } } ,message:'Creado correctamente, Bienvenidos!',timeout:20000});", true);
        }
    }
}