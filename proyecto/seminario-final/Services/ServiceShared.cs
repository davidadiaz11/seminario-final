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
