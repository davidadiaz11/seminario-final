using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;


public class ServiceShared
{
    public ServiceShared()
    {
    }

    static List<ModelColorAlerta> colores = new List<ModelColorAlerta>()
    {
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.NEGRO.ToString(),
            CodigoHexadecimal = "000000"
        },
        
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.AZUL.ToString(),
            CodigoHexadecimal = "094293"
        },
                
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.VERDE.ToString(),
            CodigoHexadecimal = "226C12"
        },
                
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.ROJO.ToString(),
            CodigoHexadecimal = "CE2A23"
        },
                
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.NARANJA.ToString(),
            CodigoHexadecimal = "E3AB58"
        },

                       
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.AMARILLO.ToString(),
            CodigoHexadecimal = "FFFF00"
        },    
        
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.AQUA.ToString(),
            CodigoHexadecimal = "00FFFF"
        },
         
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.VIOLETA.ToString(),
            CodigoHexadecimal = "EE82EE"
        }
    };

    static List<ModelFormaAlerta> formas = new List<ModelFormaAlerta>()
    {
        new ModelFormaAlerta()
        {
            Id = 1,
            Nombre = "HEXAGONO"
        },

        new ModelFormaAlerta()
        {
            Id = 2,
            Nombre = "RECTANGULO",
        },

        new ModelFormaAlerta()
        {
            Id = 3,
            Nombre = "CIRCULO"
        },

    };

    public static List<ModelColorAlerta> GetColores()
    {
        return colores;
    }
    public static List<ModelFormaAlerta> GetFormas()
    {
        return formas;
    }
    public static ModelColorAlerta GetColorAlerta(string nombreColor)
    {
        return colores.First(x => x.Nombre == nombreColor.ToUpper());
    }
    public static ModelFormaAlerta GetFormaAlerta(string nombreForma)
    {
        return formas.First(x => x.Nombre == nombreForma.ToUpper());
    }
       public static ModelFormaAlerta GetFormaAlerta(int idForma)
    {
        return formas.First(x => x.Id == idForma);
    }

    public static string GetSortLink(string dataField, HttpRequest Request)
    {
        string link = "";
        string sortname = Request.QueryString["sortname"];
        string sortdir = Request.QueryString["sortdir"];
        link += "sortname=" + dataField;

        if (sortname != null && sortname.Equals(dataField, StringComparison.CurrentCultureIgnoreCase))
        {
            if (sortname != null && sortdir.Equals("asc", StringComparison.CurrentCultureIgnoreCase))
                link += "&sortdir=desc";
            else
                link += "&sortdir=asc";
        }
        else
            link += "&sortdir=asc";
        return link;
    }

    public static string GetPageLink(int noOfPage, HttpRequest Request, string nombreItems)
    {
        string link = "";
        StringBuilder sb = new StringBuilder();
        bool hasPage = Request.QueryString["page"] != null ? true : false;
        string currentPage = hasPage ? Request.QueryString["page"] : "1";
        for (int i = 1; i < noOfPage + 1; i++)
        {
            if (currentPage == i.ToString())
            {
                sb.AppendLine(string.Format("<a  class='btn btn-light' >{0}</a>", i));

            }
            else if (hasPage)
            {
                if (Convert.ToInt16(currentPage) + 5 >= i)
                    sb.AppendLine(string.Format("<a class='btn btn-primary' href={0}>{1}</a>", Request.RawUrl.ToLower().Replace("page=" + currentPage, "page=" + i), i));
                else
                {
                    sb.AppendLine(string.Format("<a class='btn btn-primary' style='display:none' href={0}>{1}</a>", Request.RawUrl.ToLower().Replace("page=" + currentPage, "page=" + i), i));

                }
            }
            else
            {
                if (Convert.ToInt16(currentPage) + 5 >= i)
                    sb.AppendLine(string.Format("<a  class='btn btn-primary' href='{0}{1}{2}'>{3}</a>", Request.RawUrl,
                        Request.RawUrl.ToString().Contains("?") ? "&" : "?", ("page=" + i), i));
                else
                {
                    sb.AppendLine(string.Format("<a style='display:none' class='btn btn-primary' href='{0}{1}{2}'>{3}</a>", Request.RawUrl,
                    Request.RawUrl.ToString().Contains("?") ? "&" : "?", ("page=" + i), i));
                }

            }
        }
        if (Convert.ToInt16(currentPage) + 5 <= noOfPage)
            if (Request.RawUrl.ToLower() == "/" + nombreItems)
                sb.AppendLine(string.Format("<a class='btn btn-primary' href={0}>>></a>", Request.RawUrl.ToLower().Replace("/" + nombreItems, "/" + nombreItems + "?page=" + (Convert.ToInt16(currentPage) + 5).ToString()), 1));
            else
                sb.AppendLine(string.Format("<a class='btn btn-primary' href={0}>>></a>", Request.RawUrl.ToLower().Replace("page=" + currentPage, "page=" + (Convert.ToInt16(currentPage) + 5).ToString()), 1));

        link = sb.ToString();
        return link;
    }
}
