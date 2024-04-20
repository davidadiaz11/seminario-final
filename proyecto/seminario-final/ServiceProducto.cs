using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

public class ServiceProducto
{
    public ServiceProducto()
    {
    }

    public static List<ModelProducto> ObtenerProductos()
    {
        DataTable dt = MySQLRepositoryProducto.ObtenerProductos();
        List<ModelProducto> items = new List<ModelProducto>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelProducto x = new ModelProducto()
            {
                id = Convert.ToUInt16(dr["id"]),
                nombre = dr["nombre"].ToString(),
                usuario = dr["usuario"].ToString()
            };
            items.Add(x);
        }

        return items;
    }
}
