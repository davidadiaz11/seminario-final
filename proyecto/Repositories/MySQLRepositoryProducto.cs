﻿using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;
using Models;
namespace Repositories
{
    public class MySQLRepositoryProducto
    {
        public MySQLRepositoryProducto()
        {
        }

        static string cadena = MySQLRepositoryShared.getConnectionString();
        public static DataTable ObtenerProductos()
        {
            MySqlConnection cn = new MySqlConnection(cadena);
            DataTable dt = new DataTable();
            try
            {
                cn.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = cn;
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.CommandText = @"SELECT pro_id, pro_nombre, pro_porcion, tpo_nombre
                                FROM productos 
                                JOIN tipos_porcion on tpo_id=pro_tpo_id
                                WHERE tpo_fecha_baja is null and pro_fecha_baja is null";
                dt.Load(cmd.ExecuteReader());
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return dt;
        }

        public static DataSet ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
        {
            MySqlConnection cn = new MySqlConnection(cadena);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataTable dt_nutrientes = new DataTable();
            try
            {
                string prefijoTabla = "pro_";
                cn.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.CommandText = @"SELECT COUNT(pro_id) cant 
                                FROM productos 
                                WHERE ";
                foreach (ModelFiltro filtro in filtros)
                {
                    switch (filtro.filtro)
                    {
                        case "pro_nombre":
                            cmd.CommandText += filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                            cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.fecha_inicio));
                            break;
                        case "pro_ingredientes":
                            cmd.CommandText += filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                            cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.fecha_inicio));
                            break;
                        default: break;
                    }
                }

                if (!eliminados)
                    cmd.CommandText += "pro_fecha_baja IS NULL ";
                else
                    cmd.CommandText += "pro_fecha_baja IS NOT NULL ";
                DataTable dtcan = new DataTable();
                dtcan.Load(cmd.ExecuteReader());
                encontrados = Convert.ToInt32(dtcan.Rows[0]["cant"]);
                cmd.CommandText = @"SELECT pro_id, pro_nombre, pro_porcion, pro_ingredientes, tpo_nombre
                                FROM productos 
                                JOIN tipos_porcion on tpo_id=pro_tpo_id
                                WHERE tpo_fecha_baja is null AND ";
                foreach (ModelFiltro filtro in filtros)
                {
                    switch (filtro.filtro)
                    {
                        case "pro_nombre":
                            cmd.CommandText += filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                            break;
                        case "pro_ingredientes":
                            cmd.CommandText += filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                            break;
                        default: break;
                    }
                }

                if (!eliminados)
                    cmd.CommandText += "pro_fecha_baja IS NULL ";
                else
                    cmd.CommandText += "pro_fecha_baja IS NOT NULL ";
                cmd.CommandText += @" ORDER BY " + prefijoTabla + columna + " " + sort + " LIMIT " + inicio + "," + cant;
                dt.Load(cmd.ExecuteReader());

                List<int> ids = new List<int>();
                string idsString = "";

                foreach (DataRow item in dt.Rows)
                {
                    ids.Add(Convert.ToInt32(item["pro_id"]));
                    idsString = idsString + "," + item["pro_id"].ToString();
                }

                if (idsString == "")
                {
                    return ds;
                }

                idsString = idsString.Substring(1, idsString.Length - 1);

                string terceraQuery = @"SELECT npr_pro_id, nut_nombre, NPR_CANTIDAD_POR_PORCION from
                                nutrientes_x_productos
                                join nutrientes on npr_nut_id=nut_id
								LEFT JOIN alertas_x_nutriente on npr_nut_id=anu_nut_id
                                where FIND_IN_SET(npr_pro_id, @pro_id) AND anu_fecha_baja is null ";

                if (!eliminados)
                    cmd.CommandText += "AND npr_fecha_baja IS NULL ";
                else
                    cmd.CommandText += "AND npr_fecha_baja IS NOT NULL ";
                cmd.Parameters.Add(new MySqlParameter("@pro_id", idsString));

                cmd.CommandText = terceraQuery;

                dt_nutrientes.Load(cmd.ExecuteReader());

            }
            catch (Exception ex)
            {
                throw;
            }

            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Close();
            }

            ds.Tables.Add(dt);
            ds.Tables.Add(dt_nutrientes);
            return ds;
        }

        public static DataSet ObtenerUno(int idProducto)
        {
            MySqlConnection cn = new MySqlConnection(cadena);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            //DataTable dt_detalles = new DataTable();
            DataTable dt_nutrientes = new DataTable();
            try
            {
                cn.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = cn;
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.CommandText = @"SELECT pro_id, pro_nombre, pro_porcion, pro_ingredientes, tpo_nombre
                                FROM productos 
                                JOIN tipos_porcion on tpo_id=pro_tpo_id
                                WHERE tpo_fecha_baja is null AND pro_id=@pro_id and pro_fecha_baja IS NULL;";
                cmd.Parameters.Add(new MySqlParameter("@pro_id", idProducto));

                dt.Load(cmd.ExecuteReader());
                string terceraQuery = @"SELECT npr_id, npr_pro_id, nut_nombre, NPR_CANTIDAD_POR_PORCION from
                                nutrientes_x_productos
                                join nutrientes on npr_nut_id=nut_id
								LEFT JOIN alertas_x_nutriente on npr_nut_id=anu_nut_id
                                where npr_pro_id=@pro_id AND 
                                npr_fecha_baja is null AND anu_fecha_baja is null;";

                cmd.CommandText = terceraQuery;
                dt_nutrientes.Load(cmd.ExecuteReader());
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Close();
            }

            ds.Tables.Add(dt);
            ds.Tables.Add(dt_nutrientes);
            return ds;
        }



        public static bool ModificarProducto(ModelProducto nuevoProducto)
        {
            MySqlConnection cn = new MySqlConnection(cadena);
            try
            {
                cn.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = cn;
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.CommandText = @"UPDATE productos set pro_nombre=@pro_nombre, pro_porcion=@pro_porcion,
                                pro_tpo_id=@pro_tpo_id, pro_fecha_modificacion=now()
                                WHERE pro_id=@pro_id and pro_fecha_baja IS NULL;";
                cmd.Parameters.Add(new MySqlParameter("@pro_id", nuevoProducto.Id));
                cmd.Parameters.Add(new MySqlParameter("@pro_nombre", nuevoProducto.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@pro_porcion", nuevoProducto.Porcion));
                cmd.Parameters.Add(new MySqlParameter("@pro_tpo_id", nuevoProducto.TipoPorcion.Id));
                cmd.ExecuteNonQuery();
                foreach (ModelNutrienteProducto nutriente in nuevoProducto.NutrientesProducto)
                {
                    var sssql = "update nutrientes_x_productos set NPR_CANTIDAD_POR_PORCION=@NPR_CANTIDAD_POR_PORCION, npr_fecha_modificacion=now() where npr_id=@npr_id;";
                    cmd.Parameters.Add(new MySqlParameter("@NPR_CANTIDAD_POR_PORCION", nutriente.Nutriente.CantidadPorPorcion));
                    cmd.Parameters.Add(new MySqlParameter("@npr_id", nutriente.Id));
                    cmd.CommandText = sssql;
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return true;
        }

        public static bool Eliminar(int idProducto, ushort idUsuario)
        {
            MySqlTransaction trans = null;
            MySqlConnection cn = new MySqlConnection(cadena);
            try
            {
                cn.Open();
                trans = cn.BeginTransaction();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.Transaction = trans;
                cmd.CommandText = @"UPDATE PRODUCTOS set pro_usu_id_baja=@usu_id, pro_fecha_baja=now()
                            WHERE pro_id=@pro_id and pro_fecha_baja IS NULL;";
                cmd.Parameters.Add(new MySqlParameter("@pro_id", idProducto));
                cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
                var res = cmd.ExecuteNonQuery();

                if (res == 0)
                {
                    trans.Rollback();
                    return false;
                }

                cmd.CommandText = @"UPDATE NUTRIENTES_X_PRODUCTOS set npr_usu_id_baja=@usu_id, npr_fecha_baja=now()
                            WHERE npr_pro_id=@pro_id and npr_fecha_baja IS NULL;";
                var res2 = cmd.ExecuteNonQuery();
                if (res2 == 0)
                {
                    trans.Rollback();
                    return false;
                }
                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
            }
            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return true;
        }

        public static bool Recuperar(int idProducto, ushort idUsuario)
        {
            MySqlTransaction trans = null;
            MySqlConnection cn = new MySqlConnection(cadena);
            try
            {
                cn.Open();
                trans = cn.BeginTransaction();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.Transaction = trans;
                cmd.CommandText = @"UPDATE PRODUCTOS set pro_usu_id_baja=null, pro_fecha_baja=null, pro_fecha_modificacion=now(), pro_usu_id_modificacion=@usu_id
                            WHERE pro_id=@pro_id and pro_fecha_baja IS NOT NULL;";
                cmd.Parameters.Add(new MySqlParameter("@pro_id", idProducto));
                cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
                var res = cmd.ExecuteNonQuery();

                if (res == 0)
                {
                    trans.Rollback();
                    return false;
                }

                cmd.CommandText = @"UPDATE NUTRIENTES_X_PRODUCTOS set npr_usu_id_baja=null, npr_fecha_baja=null, npr_fecha_modificacion=now(), npr_usu_id_modificacion=@usu_id
                            WHERE npr_pro_id=@pro_id and npr_fecha_baja IS NOT NULL;";
                var res2 = cmd.ExecuteNonQuery();
                if (res2 == 0)
                {
                    trans.Rollback();
                    return false;
                }
                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
            }
            finally
            {
                if (cn != null && cn.State == ConnectionState.Open)
                    cn.Close();
            }
            return true;
        }
    }
}
