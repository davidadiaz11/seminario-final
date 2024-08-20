using System;
using System.Collections.Generic;
using Models;
using Services;
namespace seminario_final
{
    public partial class ListadoProductos : System.Web.UI.Page
    {
        List<ModelProducto> productos = new List<ModelProducto>();
        private List<ModelFiltro> filtros = new List<ModelFiltro>();
        private ushort _idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Productos";
            if (!IsPostBack)
            {
                ValidarLogin();
                configurarPantalla();
            }
            else
            {
                vista_lista.PageSize = Convert.ToInt16(ddl_cant_filas.SelectedValue);
                if (Request["__EVENTTARGET"] == "eliminar")
                {
                    Eliminar(Convert.ToInt32(Request["__EVENTARGUMENT"]));
                }
                if (Request["__EVENTTARGET"] == "recuperar")
                {
                    Recuperar(Convert.ToInt32(Request["__EVENTARGUMENT"]));
                }
            }
            _idUsuario = ServiceSesion.ObtenerUsuario();
            MostrarCheckEliminados();
            buscar_filtros();
            populate(vista_lista.PageSize);
        }

        private void MostrarCheckEliminados()
        {
            var resValidacion = ServiceShared.ValidarPermisos(_idUsuario);
            if (!resValidacion.Ok || !resValidacion.Data)
            {
                ch_eliminados.Visible = false;
                return;
            }
            ch_eliminados.Visible = true;
        }

        private void configurarPantalla()
        {
            configurarPaginador();
            adaptar_pantalla_mobile();
        }

        private void adaptar_pantalla_mobile()
        {
            if (Page.Request.UserAgent.Contains("Mobile"))
            {
                Ver_tarjetas();
            }
        }

        private void configurarPaginador()
        {
            if (Session["cant_resultados"] == null)
            {
                Session["cant_resultados"] = 5;
            }
            vista_lista.PageSize = Convert.ToInt32(Session["cant_resultados"]);
            ddl_cant_filas.SelectedValue = vista_lista.PageSize.ToString();
        }
        public void mensaje(string msj, string estilo)
        {
            span_mensaje.InnerText = msj;
        }

        private void Eliminar(int idProducto)
        {
            ValidarLogin();
            var master = Master as MasterPage;
            if (idProducto <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al eliminar"), true);
                return;
            }
            var resEliminar = ServiceProducto.Eliminar(_idUsuario, idProducto);
            if (!resEliminar.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resEliminar.Errores), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Eliminado correctamente"), true);
        }

        private void Recuperar(int idProducto)
        {
            var master = Master as MasterPage;
            if (idProducto <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al recuperar"), true);
                return;
            }
            var resRecuperar = ServiceProducto.Recuperar(_idUsuario, idProducto);
            if (!resRecuperar.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error(resRecuperar.Errores), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Recuperado correctamente"), true);
        }

        private void Ver_tarjetas()
        {
            vista_lista.Style.Value = "display:none";
            vista_repeater.Style.Value = "display:block";
            LinkButton2.Attributes["class"] = "text-muted  no-print";
            LinkButton3.Attributes["class"] = "text-primary  no-print";
        }

        private void buscar_filtros()
        {
            filtros = new List<ModelFiltro>();
            ModelFiltro f;
            if (txt_ingrediente.Text != "")
            {
                f = new ModelFiltro();
                f.filtro = "pro_ingredientes";
                f.fecha_inicio = txt_ingrediente.Text;
                filtros.Add(f);
            }
            if (txt_nombre.Text != "")
            {
                f = new ModelFiltro();
                f.filtro = "pro_nombre";
                f.fecha_inicio = txt_nombre.Text;
                filtros.Add(f);
            }
        }

        protected string GetSortLink(string dataField)
        {
            return ServiceSharedFront.GetSortLink(dataField, Request);
        }

        protected string GetPageLink(int noOfPage)
        {
            return ServiceSharedFront.GetPageLink(noOfPage, Request, "productos");
        }

        private void populate(int filasPorPag)
        {
            int pageNo = 0;
            int cantPags = 0;
            int encontrados = 0;
            //Fetch data from URL
            string sortName = string.IsNullOrEmpty(Request.QueryString["sortname"]) ? "nombre" : Request.QueryString["sortname"];
            string sortDir = string.IsNullOrEmpty(Request.QueryString["sortdir"]) ? "asc" : Request.QueryString["sortdir"];
            int.TryParse(Request.QueryString["page"], out pageNo);

            //set current values
            pageNo = pageNo == 0 ? 1 : pageNo;
            hfCurrentPage.Value = pageNo.ToString();
            hfSortName.Value = sortName;
            hfSortDir.Value = sortDir;
            //Fetch data from Server 

            productos = ServiceProducto.ObtenerTodosFiltrados(_idUsuario, out encontrados, filtros, filasPorPag * (pageNo - 1), filasPorPag, sortName, sortDir, ch_eliminados.Checked);
            cantPags = (encontrados / filasPorPag) + ((encontrados % filasPorPag) > 0 ? 1 : 0);
            vista_lista.DataSource = productos;
            vista_lista.DataBind();

            rpt_viajes.DataSource = productos;
            rpt_viajes.DataBind();

            h_nombre.DataBind();
            h_tipo_porcion.DataBind();

            mensaje(encontrados + " productos encontrados", "text-success");
            l1Pagger.Text = GetPageLink(cantPags);
        }
        protected void ddl_cant_filas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["cant_resultados"] = Convert.ToByte(ddl_cant_filas.SelectedValue);
        }

        protected void ch_eliminados_CheckedChanged(object sender, EventArgs e)
        {
            populate(vista_lista.PageSize);
        }

        private void ValidarLogin()
        {
            ushort idUsuario = ServiceSesion.ObtenerUsuario();
            if (idUsuario == 0)
            {
                Response.Redirect("Login");
            }
            _idUsuario = idUsuario;
        }
    }
}