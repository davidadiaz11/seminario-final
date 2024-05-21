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

    public static ModelNutriente ObtenerPorId( ushort usuario, int idAlerta)
    {
        DataSet ds = MySQLRepositorySello.ObtenerUno(usuario, idAlerta);
        DataTable dt = ds.Tables[0];
        DataTable dt_nutrientes = ds.Tables[1];
        List<ModelNutriente> nutrientes = new List<ModelNutriente>();

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


        foreach (DataRow drNut in dt_nutrientes.Rows)
        {

            ModelNutriente nut = new ModelNutriente()
            {
                Id = Convert.ToUInt32(drNut["nut_id"]),
                Nombre = drNut["nut_nombre"].ToString(),
                NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(drNut["anu_id"]),
                        ValorCritico = Convert.ToDouble(drNut["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt16(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = drNut["ale_leyenda"].ToString(),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Nombre = dr["tal_nombre"].ToString()
                            }
                        }
                    }
                }
            };
            nutrientes.Add(nut);
        }
        return nutrientes.First();
    }
}
