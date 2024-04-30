using System;
using System.Collections.Generic;


namespace seminario_final
{
    public partial class ListadoAlertas : System.Web.UI.Page
    {
        List<ModelAlerta> alertas = new List<ModelAlerta>();
        private List<ModelFiltro> filtros = new List<ModelFiltro>();
        private ushort idUsuario = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                configurarPantalla();
            }
            else
            {
                vista_lista.PageSize = Convert.ToInt16(ddl_cant_filas.SelectedValue);
                if (Request["__EVENTTARGET"] == "eliminar")
                {
                    eliminar(Convert.ToInt32(Request["__EVENTARGUMENT"]));
                }
            }
            buscar_filtros();
            populate(vista_lista.PageSize);
            Page.Title = "Alertas";
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
            if (Session["cant_comp"] == null)
            {
                Session["cant_comp"] = 3;
            }
            vista_lista.PageSize = Convert.ToInt32(Session["cant_comp"]);
            ddl_cant_filas.SelectedValue = vista_lista.PageSize.ToString();
        }


        public void mensaje(string msj, string estilo)
        {
            span_mensaje.InnerText = msj;
        }

        private void eliminar(int idAlerta)
        {
            var master = Master as MasterPage;
            if (idAlerta > 0 && ServiceProducto.Eliminar(idAlerta, idUsuario))
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Eliminado correctamente"), true);
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al eliminar"), true);
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
            if (ddl_sello.SelectedValue != "" && ddl_sello.SelectedValue != "")
            {
                f = new ModelFiltro();
                f.filtro = "sello";
                f.valor = Convert.ToInt32(ddl_sello.SelectedValue);
                filtros.Add(f);
            }
            if (ddl_ingrediente.SelectedValue != "" && ddl_ingrediente.SelectedValue != "")
            {
                f = new ModelFiltro();
                f.filtro = "ingrediente";
                f.valor = Convert.ToInt32(ddl_ingrediente.SelectedValue);
                filtros.Add(f);
            }

            if (txt_nombre.Text != "")
            {
                f = new ModelFiltro();
                f.filtro = "nombre";
                f.fecha_inicio = txt_nombre.Text;
                filtros.Add(f);
            }
        }

        protected string GetSortLink(string dataField)
        {
            return ServiceShared.GetSortLink(dataField, Request);
        }

        protected string GetPageLink(int noOfPage)
        {
            return ServiceShared.GetPageLink(noOfPage, Request, "alertas");
        }

        private void populate(int filasPorPag)
        { 
            int pageNo = 0;
            int cantPags = 0;
            int encontrados = 0;
            //Fetch data from URL
            string sortName = string.IsNullOrEmpty(Request.QueryString["sortname"]) ? "ale_nombre" : Request.QueryString["sortname"];
            string sortDir = string.IsNullOrEmpty(Request.QueryString["sortdir"]) ? "asc" : Request.QueryString["sortdir"];
            int.TryParse(Request.QueryString["page"], out pageNo);

            //set current values
            pageNo = pageNo == 0 ? 1 : pageNo;
            hfCurrentPage.Value = pageNo.ToString();
            hfSortName.Value = sortName;
            hfSortDir.Value = sortDir;
            //Fetch data from Server 

            alertas = ServiceSello.ObtenerTodosFiltrados(out encontrados, filtros, filasPorPag * (pageNo - 1), filasPorPag, sortName, sortDir, idUsuario, ch_eliminados.Checked);
            cantPags = (encontrados / filasPorPag) + ((encontrados % filasPorPag) > 0 ? 1 : 0);
            vista_lista.DataSource = alertas;
            vista_lista.DataBind();

            rpt_viajes.DataSource = alertas;
            rpt_viajes.DataBind();

            h_nombre.DataBind();
            h_tipo_porcion.DataBind();
            h_ingredientes.DataBind();
            h_nutrientes.DataBind();

            mensaje(encontrados + " alertas encontrados", "text-success");
            l1Pagger.Text = GetPageLink(cantPags);
        }
        protected void ddl_cant_filas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["cant_cli"] = Convert.ToByte(ddl_cant_filas.SelectedValue);
        }


    }
}