using System;

namespace seminario_final
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string generar_js_exito(string obj)
        {
            return "iziToast.success({title:'',message:'" + obj + "',timeout:2300});";
        }

        public string generar_js_error(string obj)
        {
            return "iziToast.error({title:'Error',message:'" + obj + "',resetOnHover:true});";
        }

    }
}