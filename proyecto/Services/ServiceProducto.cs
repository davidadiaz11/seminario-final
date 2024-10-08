﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using Models;
using Repositories;
namespace Services
{
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
                    Id = Convert.ToUInt16(dr["pro_id"]),
                    Nombre = dr["pro_nombre"].ToString()
                };
                items.Add(x);
            }
            return items;
        }

        public static List<ModelProducto> ObtenerTodosFiltrados(ushort idUsuario, out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, bool eliminados)
        {
            List<ModelProducto> items = new List<ModelProducto>();
            DataSet ds = MySQLRepositoryProducto.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, idUsuario, eliminados);
            if (ds.Tables.Count < 2)
            {
                return items;
            }
            DataTable dt = ds.Tables[0];
            DataTable dt_nutrientes = ds.Tables[1];
            List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();
            foreach (DataRow dr in dt.Rows)
            {
                ModelProducto x = new ModelProducto()
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
                items.Add(x);
            }

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
                };
                nutrientes.Add(y);
            }
            var dic_nutrientes = nutrientes.GroupBy(x => x.Id).ToDictionary(g => g.Key, g => g);


            foreach (ModelProducto item in items)
            {
                item.NutrientesProducto = dic_nutrientes[item.Id].ToList();
            }

            return items;
        }

        public static Resultado<bool> ModificarProducto(ushort idUsuario, ModelProducto nuevoProducto)
        {
            Resultado<bool> resultado = new Resultado<bool>(false);
            try
            {
                if (nuevoProducto.Id <= 0)
                {
                    resultado.ObtenerError("No posee guardar nuevos productos. Comuníquese con el administrador del software.");
                    return resultado;
                }

                if (!ServiceShared.ValidarPermisos(idUsuario).Data)
                {
                    resultado.ObtenerError("No posee los permisos para modificar. Comuníquese con el administrador del software.");
                    return resultado;
                }

                resultado.Data = MySQLRepositoryProducto.ModificarProducto(nuevoProducto);
                if (!resultado.Ok)
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

        public static Resultado<ModelProducto> ObtenerPorId(int idProducto)
        {
            Resultado<ModelProducto> resultado = new Resultado<ModelProducto>();
            DataSet ds = MySQLRepositoryProducto.ObtenerUno(idProducto);
            DataTable dt = ds.Tables[0];
            DataTable dt_nutrientes = ds.Tables[1];
            List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();

            if (dt.Rows.Count != 1)
            {
                resultado.ObtenerError("No se encontró el producto");
                return resultado;
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
                    Id = Convert.ToUInt32(drNut["npr_id"]),
                    IdProducto = Convert.ToUInt32(drNut["npr_pro_id"]),
                    Nutriente = new ModelNutriente()
                    {
                        Nombre = drNut["nut_nombre"].ToString(),
                        CantidadPorPorcion = Convert.ToDouble(drNut["NPR_CANTIDAD_POR_PORCION"])
                    }
                };
                nutrientes.Add(y);
            }
            var dic_nutrientes = nutrientes.GroupBy(x => x.IdProducto).ToDictionary(g => g.Key, g => g);
            item.NutrientesProducto = dic_nutrientes[item.Id].ToList();
            resultado.Data = item;
            return resultado;
        }

        public static Resultado<bool> Eliminar(ushort idUsuario, int idProducto)
        {
            Resultado<bool> resultado = new Resultado<bool>(false);
            try
            {
                if (!ServiceShared.ValidarPermisos(idUsuario).Data)
                {
                    resultado.ObtenerError("No posee los permisos para eliminar. Comuníquese con el administrador del sistema.");
                    return resultado;
                }

                resultado.Data = MySQLRepositoryProducto.Eliminar(idProducto, idUsuario);
                if (!resultado.Data)
                {
                    resultado.ObtenerError("Error al eliminar el producto. Reintente o comuníquese con el administrador del software.");
                    return resultado;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return resultado;
        }
        public static Resultado<bool> Recuperar(ushort idUsuario, int idProducto)
        {
            Resultado<bool> resultado = new Resultado<bool>(false);
            try
            {
                if (!ServiceShared.ValidarPermisos(idUsuario).Data)
                {
                    resultado.ObtenerError("No posee los permisos para recuperar. Comuníquese con el administrador del sistema.");
                    return resultado;
                }

                resultado.Data = MySQLRepositoryProducto.Recuperar(idProducto, idUsuario);
                if (!resultado.Data)
                {
                    resultado.ObtenerError("Error al recuperar el producto. Reintente o comuníquese con el administrador del software.");
                    return resultado;
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