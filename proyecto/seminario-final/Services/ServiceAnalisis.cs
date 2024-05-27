using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using Microsoft.Ajax.Utilities;

public class ServiceAnalisis
{
    public ServiceAnalisis()
    {
    }
    static ushort idUsuario = 2;
    private static ModelProducto Mapper(ushort idUsuario, int idProducto)
    {
        DataSet ds = MySQLRepositoryAnalisis.ObtenerProductoPorId(idUsuario, idProducto);
        DataTable dt = ds.Tables[0];
        DataTable dt_nutrientes = ds.Tables[1];
        List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();

        if (dt.Rows.Count != 1)
        {
            return null;
        }

        DataRow dr = dt.Rows[0];

        ModelProducto item = new ModelProducto()
        {
            Id = Convert.ToUInt16(dr["pro_id"]),
            Nombre = dr["pro_nombre"].ToString(),
            Ingredientes = dr["pro_ingredientes"].ToString(),
            Porcion = Convert.ToUInt32(dr["pro_porcion"]),
            TipoPorcion = new ModelTipoPorcion()
            {
                Nombre = dr["tpo_nombre"].ToString()
            }
        };

        foreach (DataRow drNut in dt_nutrientes.Rows)
        {
            ModelNutrienteProducto y = new ModelNutrienteProducto()
            {
                Id = Convert.ToUInt32(drNut["npr_pro_id"]),
                Nutriente = new ModelNutriente()
                {
                    Nombre = drNut["nut_nombre"].ToString(),
                    TipoNutriente = drNut["NUT_TIPO_NUTRIENTE"] != DBNull.Value ? new ModelTipoNutriente()
                    {
                        Id = Convert.ToUInt16(drNut["NUT_TIPO_NUTRIENTE"])
                    } : null,
                    CantidadPorPorcion = Convert.ToDouble(drNut["NPR_CANTIDAD_POR_PORCION"]),

                    NutrientesAlerta = drNut["ale_leyenda"] == DBNull.Value ? null : new List<ModelNutrienteAlerta>() {
                        new ModelNutrienteAlerta()
                        {
                            ValorCritico = Convert.ToDouble(drNut["ANU_VALOR_CRITICO"]),
                            Operador = drNut["ANU_OPERADOR"].ToString(),
                            TipoCalculo = new ModelTipoCalculo()
                            {
                                //TODO-TESIS: Dio un error la obtención del id.
                                //Id = Convert.ToUInt32(drNut["TCA_ID"]),
                                Nombre = drNut["TCA_NOMBRE"].ToString(),
                                NombreEnum = drNut["TCA_NOMBRE_ENUM"].ToString()
                            },
                            Alerta = new ModelAlerta()
                            {
                                Leyenda = drNut["ale_leyenda"].ToString(),
                                TipoAlerta = new ModelTipoAlerta()
                                {
                                    EsGenerica = Convert.ToBoolean(drNut["TAL_ES_GENERICA"]),
                                    Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(drNut["tal_forma"])),
                                    Color  = new ModelColorAlerta(){
                                        CodigoHexadecimal = drNut["tal_color"].ToString()
                                    }
                                }
                            }
                        }
                    }
                }
            };
            nutrientes.Add(y);
        }
        var dic_nutrientes = nutrientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);
        item.NutrientesProducto = dic_nutrientes[item.Id].ToList();

        return item;
    }

    public static ModelProducto ObtenerPorId(ushort idUsuario, int idProducto)
    {
        ModelProducto item = Mapper(idUsuario, idProducto);

        List<ModelNutrienteProducto> listaAlertas = new List<ModelNutrienteProducto>();
        //TODO-TESIS: SEGUIR ACÁ: está trayendo 12 nutrientes. hay que separar nutrientes de alertas.  es realmente necesario? porque está funcionando bien.
        foreach (var item2 in item.NutrientesProducto)
        {
            if(item2.Nutriente.NutrientesAlerta == null)
            {
                continue;
            }

            bool esCalculoPorcentual = item2.Nutriente.NutrientesAlerta[0].TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_PORCENTUAL.ToString();
            bool esCalculoCuantitativo = item2.Nutriente.NutrientesAlerta[0].TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_CUANTITATIVO_100G.ToString();
            bool esCalculoSobreCalorias = item2.Nutriente.NutrientesAlerta[0].TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_SOBRE_CALORIAS.ToString();

            if (esCalculoCuantitativo)
            {
                var multiplicador = 100 / item.Porcion;
                var cantidadX100 = item2.Nutriente.CantidadPorPorcion * multiplicador;
                if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadX100 >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
                {
                    item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadX100;
                    item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;

                    listaAlertas.Add(item2);
                }
                else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadX100 <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
                {
                    item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadX100;
                    item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                    listaAlertas.Add(item2);
                }
            }

            if (esCalculoPorcentual)
            {
                var multiplicador = ServiceTiposNutriente.ObtenerTipoNutrientes(item2.Nutriente.TipoNutriente.Id).CaloriasPorGramo * 100;

                var cantidadPorcentual = (item2.Nutriente.CantidadPorPorcion * multiplicador) / item.ValorEnergetico;

                if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadPorcentual >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
                {
                    item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadPorcentual;
                    item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                    listaAlertas.Add(item2);
                }
                else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadPorcentual <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
                {
                    item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadPorcentual;
                    item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                    listaAlertas.Add(item2);
                }
            }

            if (esCalculoSobreCalorias)
            {
                var cantidadCalculada = item2.Nutriente.CantidadPorPorcion  / item.ValorEnergetico;

                if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadCalculada >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
                {
                    listaAlertas.Add(item2);
                }
                else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadCalculada <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
                {
                    listaAlertas.Add(item2);
                }

            }
        }
        item.NutrienteAlertas = listaAlertas.Where(x => x.Nutriente.NutrientesAlerta != null).Select(x => x.Nutriente.NutrientesAlerta.First()).ToList();

        //TODO-TESIS: NO funciona cuando busco los perfiles. el cn.Open() se queda pensando indefinidamente.
        //List<ModelPerfil> perfiles = ObtenerPerfiles();
        //TODO-TESIS: Buscar si hay algún ingrediente q deba alertar.

        //ObtenerIngredientesIndeseados
        List<string> ingredientesIndeseados = new List<string>(){"azúcar"};
        item.IngredientesAlertas = new List<ModelAlerta>();
        foreach (var ing in ingredientesIndeseados.Where(x => item.Ingredientes.ToLower().Contains(x.ToLower())).ToList())
        {
            //agregar alerta
            ModelAlerta alert = new ModelAlerta()
            {
                Leyenda = "Contiene " + ing
            };
            item.IngredientesAlertas.Add(alert);
        }

        return item;
    }

    private static List<ModelPerfil> ObtenerPerfiles()
    {
        return ServicePerfiles.ObtenerPerfiles();

    }

    public static bool GuardarAnalisis(int idProducto)
    {
        var resultado = false;
        try
        {
            resultado = MySQLRepositoryAnalisis.GuardarAnalisis(idUsuario, idProducto);
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
}
