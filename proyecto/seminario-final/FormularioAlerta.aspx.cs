using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Models;
using Services;
namespace seminario_final
{
    public partial class FormularioAlerta : Page
    {
        protected ModelNutriente nutrientePersistido;
        protected ModelAlerta alertaPersistida;
        string idNutrienteAlerta = "";
        private ushort idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            idUsuario = ServiceSesion.ObtenerUsuario();
            idNutrienteAlerta = Request.QueryString["anu"];
            if (!IsPostBack)
            {
                CargarColores();
                CargarNutrientes();
                CargarTiposCalculo();
                CargarFormas();

                if (idNutrienteAlerta == null)
                {
                    return;
                }

                var resValidacion = ServiceShared.ValidarQueryParam(idNutrienteAlerta);
                if (!resValidacion.Ok)
                {
                    var master = Master as MasterPage;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resValidacion.Errores), true);
                    return;
                }
                if (ObtenerNutrienteAlertaPorId())
                {
                    CargarAlerta();
                }
            }
        }

        private void CargarColores()
        {
            ddl_color.DataSource = ServiceShared.GetColores();
            ddl_color.DataTextField = "Nombre";
            ddl_color.DataValueField = "CodigoHexadecimal";
            ddl_color.DataBind();
        }
        private void CargarFormas()
        {
            ddl_forma.DataSource = ServiceShared.GetFormas();
            ddl_forma.DataTextField = "Nombre";
            ddl_forma.DataValueField = "Id";
            ddl_forma.DataBind();
            ddl_forma.SelectedValue = "2"; // FormasEnum.RECTANGULO.ToString();
            ddl_forma.DataBind();

            ddl_forma.Enabled = false;
        }
        private void CargarNutrientes()
        {
            ddl_nutriente.DataSource = ServiceNutriente.ObtenerNutrientes();
            ddl_nutriente.DataTextField = "Nombre";
            ddl_nutriente.DataValueField = "Id";
            ddl_nutriente.DataBind();
        }

        private void CargarTiposCalculo()
        {
            if (string.IsNullOrEmpty(ddl_nutriente.SelectedValue))
            {
                return;
            }
            uint idNutriente = Convert.ToUInt32(ddl_nutriente.SelectedValue);
            List<ModelTipoCalculo> tiposCalculo = ServiceTiposCalculo.ObtenerTiposCalculo(idNutriente);
            ddl_tipoCalculo.DataSource = tiposCalculo;
            ddl_tipoCalculo.DataTextField = "Nombre";
            ddl_tipoCalculo.DataValueField = "Id";
            ddl_tipoCalculo.DataBind();
        }

        private bool ObtenerNutrienteAlertaPorId()
        {
            ddl_color.Enabled = false;
            var resNutrientePersistido = ServiceSello.ObtenerNutrienteAlertaPorId(Convert.ToUInt32(idNutrienteAlerta), false);
            if (!resNutrientePersistido.Ok)
            {
                var master = Master as MasterPage;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resNutrientePersistido.Errores), true);
                return false;
            }
            nutrientePersistido = resNutrientePersistido.Data;
            alertaPersistida = resNutrientePersistido.Data.NutrientesAlerta.First().Alerta;
            return true;
        }

        private void CargarAlerta()
        {
            tituloAlerta.InnerText = alertaPersistida.Nombre;
            txt_nombre.Text = alertaPersistida.Nombre;
            txt_leyenda.Text = alertaPersistida.Leyenda;
            ddl_color.SelectedValue = alertaPersistida.TipoAlerta.Color.CodigoHexadecimal;
            ddl_forma.SelectedValue = alertaPersistida.TipoAlerta.Forma.Id.ToString();
            ddl_nutriente.SelectedValue = nutrientePersistido.Id.ToString();
            ddl_tipoCalculo.SelectedValue = nutrientePersistido.NutrientesAlerta.First().TipoCalculo.Id.ToString();
            txt_valor_critico.Text = nutrientePersistido.NutrientesAlerta.First().ValorCritico.ToString();
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

        private ModelNutriente crearObjetoDesdeFormulario()
        {
            ModelNutriente nut = new ModelNutriente()
            {
                Id = Convert.ToUInt32(ddl_nutriente.SelectedValue),
                NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = string.IsNullOrEmpty(idNutrienteAlerta) ? 0 : Convert.ToUInt32(idNutrienteAlerta),
                        ValorCritico = Convert.ToDouble(txt_valor_critico.Text),
                        Operador = ddl_criterio.SelectedValue,
                        TipoCalculo = new ModelTipoCalculo()
                        {
                            Id = Convert.ToUInt32(ddl_tipoCalculo.SelectedValue)
                        },
                        Alerta = new ModelAlerta()
                        {
                            Id = string.IsNullOrEmpty(idNutrienteAlerta) ? 0 : alertaPersistida.Id,
                            Nombre = txt_nombre.Text,
                            Leyenda = txt_leyenda.Text,
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Id = string.IsNullOrEmpty(idNutrienteAlerta) ? 0 : alertaPersistida.TipoAlerta.Id,
                                Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(ddl_forma.SelectedValue)),
                                Color = new ModelColorAlerta()
                                {
                                    Id = string.IsNullOrEmpty(idNutrienteAlerta) ? 0 : alertaPersistida.TipoAlerta.Color.Id,
                                    CodigoHexadecimal = ddl_color.SelectedValue
                                }
                            }
                        }
                    }
                }
            };
            return nut;
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            var resValidacion = ValidarFormulario();
            if (!resValidacion)
            {
                return;
            }
            if (idNutrienteAlerta != null)
            {
                ObtenerNutrienteAlertaPorId();
            }

            ModelNutriente nuevoElemento = crearObjetoDesdeFormulario();

            var resModificacion = ServiceSello.GuardarAlerta(idUsuario, nuevoElemento, nutrientePersistido);
            var master = Master as MasterPage;
            if (!resModificacion.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resModificacion.Errores), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Guardada correctamente."), true);

        }

        protected void ddl_nutriente_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTiposCalculo();
        }
    }
}