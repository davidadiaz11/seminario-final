﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Models;
using Services;
namespace seminario_final
{
    public partial class FormularioProducto : Page
    {
        protected ModelProducto producto;
        string idProducto = "";
        private ushort idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            idUsuario = ServiceSesion.ObtenerUsuario();
            idProducto = Request.QueryString["pro"];
            if (!IsPostBack)
            {
                ValidarLogin();
                CargarTiposPorcion();
                if (idProducto == null)
                {
                    return;
                }
                var resValidacion = ServiceShared.ValidarQueryParam(idProducto);
                if (!resValidacion.Ok)
                {
                    var master = Master as MasterPage;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resValidacion.Errores), true);
                    return;
                }
                if (ObtenerProducto())
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

        private bool ObtenerProducto()
        {
            if(idProducto == null)
            {
                return false;
            }
            var resProducto = ServiceProducto.ObtenerPorId(Convert.ToInt32(idProducto));
            if (!resProducto.Ok)
            {
                var master = Master as MasterPage;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resProducto.Errores), true);
                return false;
            }
            producto = resProducto.Data;
            return true;
        }

        private void CargarProducto()
        {
            tituloProducto.InnerText = producto.Nombre;
            txt_nombre.Text = producto.Nombre;
            ddl_tipo_porcion.SelectedValue = producto.TipoPorcion.Id.ToString();
            txt_porcion.Text = producto.Porcion.ToString();
            txt_azucares.Text = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Azúcares añadidos")?.Nutriente?.CantidadPorPorcion.ToString();
            txt_carbohidratos.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Carbohidratos").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_fibra.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Fibra").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_grasas_saturadas.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Grasas saturadas").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_grasas_totales.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Grasas totales").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_grasas_trans.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Grasas trans").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_proteinas.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Proteínas").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
            txt_sodio.Text = producto.NutrientesProducto.First(x => x.Nutriente.Nombre == "Sodio").Nutriente.CantidadPorPorcion.ToString().Replace(",", ".");
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
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Ingrese cantidad de azúcares añadidos por porción"), true);
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

        private ModelProducto crearObjetoProducto()
        {
            ObtenerProducto();
            if (producto == null)
            {
                return null;
            }
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

            var azucares = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Azúcares añadidos");
            azucares.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_azucares.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(azucares);

            var carbohidratos = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Carbohidratos");
            carbohidratos.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_carbohidratos.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(carbohidratos);
            
            var fibra = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Fibra");
            fibra.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_fibra.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(fibra);

            var grasas_saturadas = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Grasas saturadas");
            grasas_saturadas.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_grasas_saturadas.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(grasas_saturadas);
            
            var grasas_totales = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Grasas totales");
            grasas_totales.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_grasas_totales.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(grasas_totales);
                  
            var grasas_trans = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Grasas trans");
            grasas_trans.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_grasas_trans.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(grasas_trans);
                  
            var proteinas = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Proteínas");
            proteinas.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_proteinas.Text.Replace(".", ","));
            nuevosNutrientesProductos.Add(proteinas);
            
            var sodio = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Sodio");
            sodio.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_sodio.Text.Replace(",", "."));
            nuevosNutrientesProductos.Add(sodio);
                       
            var valor_energetico = producto.NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Calorías");
            valor_energetico.Nutriente.CantidadPorPorcion = Convert.ToDouble(txt_valor_energetico.Text.Replace(",", "."));
            nuevosNutrientesProductos.Add(valor_energetico);

            nuevoProducto.NutrientesProducto = nuevosNutrientesProductos;
            return nuevoProducto;
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            var resValidacion = ValidarFormulario();
            if (!resValidacion)
            {
                return;
            }
            var master = Master as MasterPage;

            ModelProducto nuevoProducto = crearObjetoProducto();
            if (nuevoProducto == null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("No es posible generar nuevos productos."), true);
                return;
            }

            var resModificacion = ServiceProducto.ModificarProducto(idUsuario, nuevoProducto);
            if (!resModificacion.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resModificacion.Errores), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Modificado correctamente."), true);
        }

        private void ValidarLogin()
        {
            ushort idUsuario = ServiceSesion.ObtenerUsuario();
            if (idUsuario == 0)
            {
                Response.Redirect("Login");
            }
        }
    }
}