using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

public class ServiceSello
{
    public ServiceSello()
    {
    }

    public static List<ModelAlerta> ObtenerAlertas()
    {
        DataTable dt = MySQLRepositorySello.ObtenerSellos();
        List<ModelAlerta> items = new List<ModelAlerta>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelAlerta x = new ModelAlerta()
            {
                Id = Convert.ToUInt16(dr["ale_id"]),
                Nombre = dr["ale_nombre"].ToString()
            };
            items.Add(x);
        }

        return items;
    }

    public static bool Eliminar(int idAlerta, int idUsuario)
    {
        DataTable dt = MySQLRepositoryProducto.ObtenerProductos();
        List<ModelProducto> items = new List<ModelProducto>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelProducto x = new ModelProducto()
            {
                Id = Convert.ToUInt16(dr["id"]),
                Nombre = dr["nombre"].ToString()
            };
            items.Add(x);
        }

        return true;
    }

    public static List<ModelAlerta> ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
    {
        DataTable dt = MySQLRepositorySello.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, usuario, eliminados);
        List<ModelAlerta> items = new List<ModelAlerta>();
        List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelAlerta x = new ModelAlerta()
            {
                Id = Convert.ToUInt16(dr["ale_id"]),
                Nombre = dr["ale_nombre"].ToString(),
                Leyenda = dr["ale_leyenda"].ToString(),
                TipoAlerta = new ModelTipoAlerta()
                {
                    Nombre = dr["tal_nombre"].ToString(),
                    Forma = dr["tal_forma"].ToString(),
                    Color  = dr["tal_color"].ToString()
                }
            };
            items.Add(x);
        }
        return items;
    }

    public static bool ModificarAlerta(ModelAlerta alerta)
    {
        var resultado = false;
        try
        {
            resultado = MySQLRepositorySello.ModificarSello(alerta);
            if (!resultado)
            {
                throw new Exception("Error al actualizar alerta.");
            }
        }
        catch (Exception ex)
        {
            throw;
        }
        return resultado;
    }

    public static ModelAlerta ObtenerPorId( ushort usuario, int idAlerta)
    {
        DataTable dt = MySQLRepositorySello.ObtenerUno(usuario, idAlerta);
        List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();

        if (dt.Rows.Count != 1)
        {
            //responder que no se encontró
            return null;
        }

        DataRow dr = dt.Rows[0];

        ModelAlerta item = new ModelAlerta()
        {
            Id = Convert.ToUInt16(dr["ale_id"]),
            Nombre = dr["ale_nombre"].ToString(),
            Leyenda = dr["ale_leyenda"].ToString(),
            TipoAlerta = new ModelTipoAlerta()
            {
                Nombre = dr["tal_nombre"].ToString()
            }
        };

        
        //foreach (DataRow drNut in dt_nutrientes.Rows)
        //{

        //    ModelNutrienteProducto y = new ModelNutrienteProducto()
        //    {
        //        Id = Convert.ToUInt32(drNut["npr_pro_id"]),
        //        Nutriente = new ModelNutriente()
        //        {
        //            Nombre = drNut["nut_nombre"].ToString(),
        //            CantidadPorPorcion = Convert.ToDouble(drNut["NPR_CANTIDAD_POR_PORCION"])
        //        }
        //    };
        //    nutrientes.Add(y);
        //}
        //var dic_nutrientes = nutrientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);

        //    item.IngredientesProducto = dic_ingredientes[item.Id].ToList();
        //    item.NutrientesProducto = dic_nutrientes[item.Id].ToList();

        return item;
    }



}
