using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace seminario_final
{
    public partial class FormularioProducto : Page
    {
        protected ModelProducto producto;
        string idProducto = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            idProducto = Request.QueryString["pro"];
            if (idProducto == null)
            {
                return;
            }
            if (!IsPostBack)
            {
                CargarTiposPorcion();
                ObtenerProducto();
                if (producto != null)
                {
                    CargarProducto();
                }
                
            }
        }

        private void CargarTiposPorcion()
        {
            ddl_tipo_porcion.DataSource = ServiceTiposPorcion.ObtenerTiposPorcion();
            ddl_tipo_porcion.DataTextField = "Nombre";
            ddl_tipo_porcion.DataValueField = "Id";
            ddl_tipo_porcion.DataBind();
        }

        private void ObtenerProducto()
        {
            producto = ServiceProducto.ObtenerPorId(1,Convert.ToInt32(idProducto));
        }

        private void CargarProducto()
        {
            tituloProducto.InnerText = producto.Nombre;
            txt_nombre.Text = producto.Nombre;
            ddl_tipo_porcion.SelectedValue = producto.TipoPorcion.Id.ToString();
            txt_porcion.Text = producto.Porcion.ToString();
            txt_azucares.Text = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Azúcares")?.Nutriente?.CantidadPorPorcion.ToString();
            txt_carbohidratos.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Carbohidratos").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_fibra.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Fibra").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_grasas_saturadas.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Grasas saturadas").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_grasas_totales.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Grasas totales").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_grasas_trans.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Grasas trans").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_proteinas.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Proteínas").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_sodio.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Sodio").Nutriente.CantidadPorPorcion.ToString().Replace(",",".");
            txt_valor_energetico.Text = producto.ValorEnergetico.ToString().Replace(",", ".");
            txt_ingredientes.Text = producto.Ingredientes;
        }

        private bool ValidarFormulario()
        {
            var master = Master as MasterPage;

            if (string.IsNullOrEmpty(txt_nombre.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese un nombre"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_valor_energetico.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese el valor energético"), true);
                return false;
            }
            if (ddl_tipo_porcion.SelectedValue == "" || ddl_tipo_porcion.SelectedValue == "0")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Seleccione el tipo de porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_porcion.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_azucares.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de azúcares por porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_carbohidratos.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de carbohidratos por porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_fibra.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de fibra por porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_grasas_saturadas.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de grasas saturadas por porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_grasas_totales.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de grasas totales por porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_grasas_trans.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de grasas trans por porción"), true);
                return false;
            }                      
            if (string.IsNullOrEmpty(txt_proteinas.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de proteínas por porción"), true);
                return false;
            }      
            if (string.IsNullOrEmpty(txt_sodio.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de sodio por porción"), true);
                return false;
            }
            if (string.IsNullOrEmpty(txt_ingredientes.Text))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese los ingredientes"), true);
                return false;
            }

            return true;
        }

        private  ModelProducto crearObjetoProducto()
        {
            ObtenerProducto();
            ModelProducto nuevoProducto = new ModelProducto();
            nuevoProducto.Id = producto.Id;
            nuevoProducto.Nombre = txt_nombre.Text;
            nuevoProducto.Porcion = Convert.ToUInt32(txt_porcion.Text);
            nuevoProducto.Ingredientes = txt_ingredientes.Text;
            nuevoProducto.TipoPorcion = new ModelTipoPorcion()
            {
                Id = Convert.ToUInt32(ddl_tipo_porcion.SelectedValue)
            };

            List<ModelNutrienteProducto> nuevosNutrientesProductos = new List<ModelNutrienteProducto>();

            foreach (ModelNutrienteProducto item in producto.NutrientesProducto)
            {
                ModelNutrienteProducto mnp = new ModelNutrienteProducto()
                {
                    Id = item.Id,
                    Nutriente = new ModelNutriente()
                    {
                        CantidadPorPorcion = item.Nutriente.CantidadPorPorcion
                    }
                };
                nuevosNutrientesProductos.Add(mnp);
            }
            nuevoProducto.NutrientesProducto = nuevosNutrientesProductos;
            
            //buscar los ingredientes, ver cuáles dar de baja, cuáles mantener y cuáles dar de alta?
            //o simplemente guardar los ingredientes como un string 
            return nuevoProducto;
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            var resValidacion = ValidarFormulario();
            if (!resValidacion)
            {
                return;
            }
            ModelProducto nuevoProducto = crearObjetoProducto();
            var resModificacion = ServiceProducto.ModificarProducto(nuevoProducto);
            var master = Master as MasterPage;
            if (!resModificacion.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resModificacion.Errores), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Modificado correctamente."), true);
        }
    }
}