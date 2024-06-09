using System;
using System.Web.UI;

namespace seminario_final
{
    public partial class FormularioPerfil : Page
    {
        protected ModelPerfil perfilPersistido;
        string idPerfilstring = "";
        uint idPerfil = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            idPerfilstring = Request.QueryString["prf"];
            if (!IsPostBack)
            {
                if (idPerfilstring == null)
                {
                    return;
                }
                var resValidacion = ServiceShared.ValidarQueryParam(idPerfilstring);
                if (!resValidacion.Ok)
                {
                    var master = Master as MasterPage;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resValidacion.Errores), true);
                    return;
                }
                idPerfil = Convert.ToUInt32(idPerfilstring);
                if (ObtenerPerfil())
                {
                    CargarPerfil();
                }
            }
        }

        private bool ObtenerPerfil()
        {
            var resPerfilPersistido = ServicePerfiles.ObtenerPerfil(idPerfil);
            if (!resPerfilPersistido.Ok)
            {
                var master = Master as MasterPage;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resPerfilPersistido.Errores), true);
                return false;
            }
            perfilPersistido = resPerfilPersistido.Data;
            return true;
        }

        private void CargarPerfil()
        {
            txt_nombre.Text = perfilPersistido.Nombre;
            txt_fecha_nacimiento.Text = perfilPersistido.FechaNacimiento.ToString("yyyy-MM-dd");
            txt_ingredientes_prohibidos.Text = perfilPersistido.IngredientesProhibidos;
        }

        private bool ValidarFormulario()
        {
            var master = Master as MasterPage;
            if (string.IsNullOrEmpty(txt_nombre.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese un nombre"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_fecha_nacimiento.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Seleccione fecha de nacimiento"), true);
                return false;
            }
            return true;
        }

        private ModelPerfil crearObjeto()
        {
            ModelPerfil prof = new ModelPerfil()
            {
                Nombre = txt_nombre.Text,
                FechaNacimiento = Convert.ToDateTime(txt_fecha_nacimiento.Text),
                IngredientesProhibidos = txt_ingredientes_prohibidos.Text
            };
            return prof;
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            var resValidacion = ValidarFormulario();
            if (!resValidacion)
            {
                return;
            }
            ModelPerfil nuevoElemento = crearObjeto();
            var resModificacion = ServicePerfiles.GuardarPerfil(nuevoElemento, Convert.ToUInt32(idPerfilstring));
            var master = Master as MasterPage;
            if (!resModificacion.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message_err", master.generar_js_error(resModificacion.Errores), true);
                return;
            }
            if (string.IsNullOrEmpty(resModificacion.Mensaje))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Guardada correctamente."), true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito(resModificacion.Mensaje), true);
            }
        }
    }
}