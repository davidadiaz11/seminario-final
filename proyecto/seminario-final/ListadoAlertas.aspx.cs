using System;
using System.Collections.Generic;


namespace seminario_final
{
    public partial class ListadoAlertas : System.Web.UI.Page
    {
        List<ModelAlerta> alertas = new List<ModelAlerta>();
        List<ModelNutriente> nutrientes = new List<ModelNutriente>();
        private List<ModelFiltro> filtros = new List<ModelFiltro>();
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
                    Eliminar(Convert.ToUInt32(Request["__EVENTARGUMENT"]));
                }
                if (Request["__EVENTTARGET"] == "recuperar")
                {
                    Recuperar(Convert.ToUInt32(Request["__EVENTARGUMENT"]));
                }
            }
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

        private void Eliminar(uint idNutrienteAlerta)
        {
            var master = Master as MasterPage;
            if (idNutrienteAlerta <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al eliminar"), true);
                return;
            }
            var resEliminar = ServiceSello.Eliminar(idNutrienteAlerta);
            if (!resEliminar.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al eliminar"), true);
                return;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_exito("Eliminado correctamente"), true);
        }
        private void Recuperar(uint idNutrienteAlerta)
        {
            var master = Master as MasterPage;
            if (idNutrienteAlerta <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al recuperar"), true);
                return;
            }
            var resRecuperar = ServiceSello.Recuperar(idNutrienteAlerta);
            if (!resRecuperar.Ok)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", master.generar_js_error("Error al recuperar"), true);
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

        protected string GetSortLink(string dataField)
        {
            return ServiceShared.GetSortLink(dataField, Request);
        }

        protected string GetPageLink(int noOfPage)
        {
            return ServiceShared.GetPageLink(noOfPage, Request, "listadoalertas");
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

            nutrientes = ServiceSello.ObtenerTodosFiltrados(out encontrados, filtros, filasPorPag * (pageNo - 1), filasPorPag, sortName, sortDir, ch_eliminados.Checked);
            cantPags = (encontrados / filasPorPag) + ((encontrados % filasPorPag) > 0 ? 1 : 0);
            vista_lista.DataSource = nutrientes;
            vista_lista.DataBind();

            rpt_viajes.DataSource = nutrientes;
            rpt_viajes.DataBind();


            h_nombre.DataBind();
            h_leyenda.DataBind();
            h_nutrientes.DataBind();
            h_operador.DataBind();
            h_valor_critico.DataBind();

            mensaje(encontrados + " alertas encontrados", "text-success");
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
    }
}