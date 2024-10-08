﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using Models;
using Services.Fabrics;
using Repositories;
namespace Services
{
    public class ServiceAnalisis
    {
        public ServiceAnalisis()
        {
        }
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
            foreach (var item2 in item.NutrientesProducto)
            {
                if (item2.Nutriente.NutrientesAlerta == null)
                {
                    continue;
                }
                ICalculoAlerta calculoAlerta = CalculoAlertaFabric.ObtenerCalculoAlerta(item2);
                listaAlertas.AddRange(calculoAlerta.Calcular(item, item2));
            }
            item.NutrienteAlertas = listaAlertas.Where(x => x.Nutriente.NutrientesAlerta != null).Select(x => x.Nutriente.NutrientesAlerta.First()).ToList();

            item.IngredientesAlertas = new List<ModelAlerta>();
            List<ModelPerfil> perfiles = ObtenerPerfiles(idUsuario);

            foreach (ModelPerfil prf in perfiles)
            {
                List<string> ingredientes = prf.IngredientesProhibidos.Split(';').ToList();

                foreach (var ing in ingredientes.Where(x => item.Ingredientes.ToLower().Contains(x.ToLower())).ToList())
                {
                    ModelAlerta alert = new ModelAlerta()
                    {
                        Leyenda = "Contiene " + ing,
                        Perfil = prf
                    };
                    item.IngredientesAlertas.Add(alert);
                }
            }

            return item;
        }

        private static List<ModelPerfil> ObtenerPerfiles(ushort idUsuario)
        {
            return ServicePerfiles.ObtenerPerfiles(idUsuario);

        }

        public static List<ModelAnalisis> ObtenerTodosFiltrados(ushort idUsuario, out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, bool eliminados)
        {
            DataTable dt = MySQLRepositoryAnalisis.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, idUsuario, eliminados);
            List<ModelAnalisis> items = new List<ModelAnalisis>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new ModelAnalisis()
                {
                    Id = Convert.ToUInt16(dr["ahi_id"]),
                    Fecha = Convert.ToDateTime(dr["ahi_fecha"]),
                    Producto = new ModelProducto()
                    {
                        Id = Convert.ToUInt32(dr["pro_id"]),
                        Nombre = dr["pro_nombre"].ToString()
                    }
                });
            }
            return items;
        }

        public static List<ModelAnalisis> ObtenerUltimosAnalisis(ushort idUsuario)
        {
            DataTable dt = MySQLRepositoryAnalisis.ObtenerUltimosAnalisis(idUsuario);
            List<ModelAnalisis> items = new List<ModelAnalisis>();
            foreach (DataRow dr in dt.Rows)
            {
                items.Add(new ModelAnalisis()
                {
                    Id = Convert.ToUInt16(dr["ahi_id"]),
                    Fecha = Convert.ToDateTime(dr["ahi_fecha"]),
                    Producto = new ModelProducto()
                    {
                        Id = Convert.ToUInt32(dr["pro_id"]),
                        Nombre = dr["pro_nombre"].ToString()
                    }
                });
            }
            return items;
        }

        public static bool VerificarProductoAnalizado(ushort idUsuario, uint idProducto)
        {
            var resultado = false;
            try
            {
                DataTable dt = MySQLRepositoryAnalisis.VerificarProductoAnalizado(idUsuario, idProducto);
                resultado = Convert.ToInt32(dt.Rows[0]["cant"]) > 0;
            }
            catch (Exception ex)
            {
                throw;
            }
            return resultado;
        }

        public static bool GuardarAnalisis(ushort idUsuario, uint idProducto)
        {
            var resultado = false;
            try
            {
                if (VerificarProductoAnalizado(idUsuario, idProducto))
                {
                    resultado = true;
                    return resultado;
                }

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
}
