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
                Id = Convert.ToUInt16(dr["id"]),
                Nombre = dr["nombre"].ToString()
            };
            items.Add(x);
        }

        return items;
    }

    public static bool Eliminar(int idProducto, int idUsuario)
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

    public static List<ModelProducto> ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
    {
        DataSet ds = MySQLRepositoryProducto.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, usuario, eliminados);
        DataTable dt = ds.Tables[0];
        DataTable dt_ingredientes = ds.Tables[1];
        DataTable dt_nutrientes = ds.Tables[2];
        List<ModelProducto> items = new List<ModelProducto>();
        List<ModelIngredienteProducto> ingredientes = new List<ModelIngredienteProducto>();
        List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelProducto x = new ModelProducto()
            {
                Id = Convert.ToUInt16(dr["pro_id"]),
                Nombre = dr["pro_nombre"].ToString(),
                Porcion = Convert.ToUInt32(dr["pro_porcion"]),
                ValorEnergetico = Convert.ToUInt32(dr["pro_valor_energetico"]),
                TipoPorcion = new ModelTipoPorcion()
                {
                    Nombre = dr["tpo_nombre"].ToString()
                }
            };
            items.Add(x);
        }

       

        foreach (DataRow dr in dt_ingredientes.Rows)
        {
            ModelIngredienteProducto y = new ModelIngredienteProducto()
            {
                Id = Convert.ToUInt32(dr["ipr_pro_id"]),
                Ingrediente = new ModelIngrediente()
                {
                    Nombre = dr["ing_nombre"].ToString()
                }
            };
            ingredientes.Add(y);
        }

        var dic_ingredientes = ingredientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);


        foreach (DataRow dr in dt_nutrientes.Rows)
        {

            ModelNutrienteProducto y = new ModelNutrienteProducto()
            {
                Id = Convert.ToUInt32(dr["npr_pro_id"]),
                Nutriente = new ModelNutriente()
                {
                    Nombre = dr["nut_nombre"].ToString(),
                    CantidadPorPorcion = Convert.ToDouble(dr["NPR_CANTIDAD_POR_PORCION"])
                }
            } ;
            nutrientes.Add(y);
        }
        var dic_nutrientes = nutrientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);


        foreach (ModelProducto item in items)
        {
            item.IngredientesProducto = dic_ingredientes[item.Id].ToList();
            item.NutrientesProducto = dic_nutrientes[item.Id].ToList();
        }

        return items;
    }

    public static bool ModificarProducto(ModelProducto nuevoProducto)
    {
        var resultado = false;
        try
        {
            resultado = MySQLRepositoryProducto.ModificarProducto(nuevoProducto);
            if (!resultado)
            {
                throw new Exception("Error al actualizar producto.");
            }
        }
        catch (Exception ex)
        {
            throw;
        }
        return resultado;
    }

    public static ModelProducto ObtenerPorId( ushort usuario, int idProducto)
    {
        DataSet ds = MySQLRepositoryProducto.ObtenerUno(usuario, idProducto);
        DataTable dt = ds.Tables[0];
        DataTable dt_ingredientes = ds.Tables[1];
        DataTable dt_nutrientes = ds.Tables[2];
        List<ModelIngredienteProducto> ingredientes = new List<ModelIngredienteProducto>();
        List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();

        if (dt.Rows.Count != 1)
        {
            //responder que no se encontró
            return null;
        }

        DataRow dr = dt.Rows[0];

        ModelProducto item = new ModelProducto()
        {
            Id = Convert.ToUInt16(dr["pro_id"]),
            Nombre = dr["pro_nombre"].ToString(),
            Ingredientes = dr["pro_ingredientes"].ToString(),
            Porcion = Convert.ToUInt32(dr["pro_porcion"]),
            ValorEnergetico = Convert.ToUInt32(dr["pro_valor_energetico"]),
            TipoPorcion = new ModelTipoPorcion()
            {
                Nombre = dr["tpo_nombre"].ToString()
            }
        };

        foreach (DataRow drIng in dt_ingredientes.Rows)
        {
            ModelIngredienteProducto y = new ModelIngredienteProducto()
            {
                Id = Convert.ToUInt32(drIng["ipr_pro_id"]),
                Ingrediente = new ModelIngrediente()
                {
                    Nombre = drIng["ing_nombre"].ToString()
                }
            };
            ingredientes.Add(y);
        }

        var dic_ingredientes = ingredientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);


        foreach (DataRow drNut in dt_nutrientes.Rows)
        {

            ModelNutrienteProducto y = new ModelNutrienteProducto()
            {
                Id = Convert.ToUInt32(drNut["npr_pro_id"]),
                Nutriente = new ModelNutriente()
                {
                    Nombre = drNut["nut_nombre"].ToString(),
                    CantidadPorPorcion = Convert.ToDouble(drNut["NPR_CANTIDAD_POR_PORCION"])
                }
            };
            nutrientes.Add(y);
        }
        var dic_nutrientes = nutrientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);

            item.IngredientesProducto = dic_ingredientes[item.Id].ToList();
            item.NutrientesProducto = dic_nutrientes[item.Id].ToList();

        return item;
    }



}
