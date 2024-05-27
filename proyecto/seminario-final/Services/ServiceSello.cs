using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using seminario_final;
using System.Web.Services.Description;

public class ServiceSello
{
    public ServiceSello()
    {
    }

    //TODO-TESIS: buscar los idUsuario
    private static ushort idUsuario = 2;
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

    public static List<ModelNutriente> ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
    {
        DataTable dt = MySQLRepositorySello.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, usuario, eliminados);
        List<ModelNutriente> items = new List<ModelNutriente>();
        foreach (DataRow dr in dt.Rows)
        {
            //armar desde nutriente y hacia abajo.


            ModelNutriente x = new ModelNutriente()
            {
                Id = Convert.ToUInt16(dr["nut_id"]),
                Nombre = dr["nut_nombre"].ToString(),
                NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(dr["anu_id"]),
                        Operador = dr["anu_operador"].ToString(),
                        TipoCalculo = new ModelTipoCalculo()
                        {
                            Id = Convert.ToUInt32(dr["anu_tca_id"])
                        },
                        ValorCritico = Convert.ToDouble(dr["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt32(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = dr["ale_leyenda"].ToString(),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Id = Convert.ToUInt32(dr["tal_id"]),
                                EsGenerica = Convert.ToBoolean(dr["tal_es_generica"]),
                                Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(dr["tal_forma"])),
                                Color = new ModelColorAlerta()
                                {
                                    CodigoHexadecimal = dr["tal_color"].ToString()
                                }
                            }
                        }
                    }
                }
            };
            items.Add(x);
        }
        return items;
    }

    public static ModelNutriente ObtenerNutrienteAlertaPorId(uint idNutrienteAlerta)
    {
        DataTable dt = MySQLRepositorySello.ObtenerNutrienteAlertaPorId(idNutrienteAlerta);
        DataRow dr = dt.Rows[0];
                
            ModelNutriente x = new ModelNutriente()
            {
                Id = Convert.ToUInt16(dr["nut_id"]),
                Nombre = dr["nut_nombre"].ToString(),
                NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(dr["anu_id"]),
                        Operador = dr["anu_operador"].ToString(),
                        TipoCalculo = new ModelTipoCalculo()
                        {
                            Id = Convert.ToUInt32(dr["anu_tca_id"])
                        },
                        ValorCritico = Convert.ToDouble(dr["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt32(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = dr["ale_leyenda"].ToString(),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Id = Convert.ToUInt32(dr["tal_id"]),
                                Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(dr["tal_forma"])),
                                Color = new ModelColorAlerta()
                                {
                                    CodigoHexadecimal = dr["tal_color"].ToString()
                                }
                            }
                        }
                    }
                }
            };
        return x;
    }

    public static bool GuardarAlerta(ModelNutriente nutriente, ModelNutriente nutrientePersistido)
    {
        var resultado = false;
        try
        {
            resultado = MySQLRepositorySello.GuardarSello(idUsuario, nutriente, nutrientePersistido);
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
