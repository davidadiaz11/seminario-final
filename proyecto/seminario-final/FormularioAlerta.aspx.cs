using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace seminario_final
{
    public partial class FormularioAlerta : Page
    {
        protected ModelAlerta alerta;
        protected ModelNutriente nutriente;
        string idAlerta = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            idAlerta = Request.QueryString["ale"];
            if (idAlerta == null)
            {
                return;
            }
            if (!IsPostBack)
            {
                CargarColores();
                CargarNutrientes();
                CargarFormas();
                ObtenerAlerta();
                if (alerta != null)
                {
                    CargarAlerta();
                }
                
            }
        }

        private void CargarColores()
        {
            ddl_color.DataSource = ServiceShared.GetColores();
            ddl_color.DataTextField = "Nombre";
            ddl_color.DataValueField = "Nombre";
            ddl_color.DataBind();
        }        
        private void CargarFormas()
        {
            ddl_forma.DataSource = ServiceShared.GetFormas();
            ddl_forma.DataTextField = "Nombre";
            ddl_forma.DataValueField = "Id";
            ddl_forma.DataBind();
        }
        private void CargarNutrientes()
        {
            ddl_nutriente.DataSource = ServiceNutriente.ObtenerNutrientes();
            ddl_nutriente.DataTextField = "Nombre";
            ddl_nutriente.DataValueField = "Id";
            ddl_nutriente.DataBind();
        }

        private void ObtenerAlerta()
        {
            nutriente = ServiceSello.ObtenerPorId(1,Convert.ToInt32(idAlerta));
            alerta = nutriente.NutrientesAlerta.First().Alerta;
        }

        private void CargarAlerta()
        {
            tituloAlerta.InnerText = alerta.Nombre;
            txt_nombre.Text = alerta.Nombre;
            txt_leyenda.Text = alerta.Leyenda;

            if (alerta.Id > 0)
            {
                ddl_nutriente.SelectedValue = nutriente.Id.ToString();
                txt_valor_critico.Text = nutriente.NutrientesAlerta.First().ValorCritico.ToString();
            }
        }

        private bool ValidarFormulario()
        {
            var master = Master as MasterPage;

            if (string.IsNullOrEmpty(txt_nombre.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese un nombre"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_leyenda.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese una leyenda"), true);
                return false;
            }
            if (ddl_nutriente.SelectedValue == "" || ddl_nutriente.SelectedValue == "0")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Seleccione el nutriente"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_valor_critico.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese el porcentaje crítico"), true);
                return false;
            }
            return true;
        }

        private ModelAlerta crearObjetoAlerta()
        {
            ObtenerAlerta();
            ModelAlerta nuevaAlerta = new ModelAlerta();
            nuevaAlerta.Id = alerta.Id;
            nuevaAlerta.Nombre = txt_nombre.Text;
            nuevaAlerta.Leyenda = txt_leyenda.Text;
         

            //List<ModelNutrienteProducto> nuevosNutrientesAlertas = new List<ModelNutrienteProducto>();

            //foreach (ModelNutrienteProducto item in producto.NutrientesProducto)
            //{
            //    ModelNutrienteProducto mnp = new ModelNutrienteProducto()
            //    {
            //        Id = item.Id,
            //        Nutriente = new ModelNutriente()
            //        {
            //            CantidadPorPorcion = item.Nutriente.CantidadPorPorcion
            //        }
            //    };
            //    nuevosNutrientesProductos.Add(mnp);
            //}
            //nuevoProducto.NutrientesProducto = nuevosNutrientesProductos;
            
            return nuevaAlerta;
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            var resValidacion = ValidarFormulario();
            if (!resValidacion)
            {
                return;
            }
            ModelAlerta nuevaAlerta = crearObjetoAlerta();
            var resModificacion = ServiceSello.ModificarAlerta(nuevaAlerta);
            var master = Master as MasterPage;
            if (!resModificacion)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al modificar"), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Modificada correctamente."), true);
        }
    }
}