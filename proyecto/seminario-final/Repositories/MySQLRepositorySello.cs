using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;
using System.Linq;

public class MySQLRepositorySello
{
    public MySQLRepositorySello()
    {
    }

    static string cadena = MySQLRepositoryShared.getConnectionString();
    public static DataTable ObtenerSellos()
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
            cmd.CommandText = @"SELECT ale_id, ale_nombre, ale_leyenda, ale_tal_id
                                FROM alertas 
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                WHERE tal_fecha_baja is null and ale_fecha_baja is null";

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


    public static DataTable ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
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

            cmd.CommandText = @"SELECT COUNT(anu_id) cant 
                                FROM ALERTAS_X_NUTRIENTE 
                                JOIN nutrientes on anu_nut_id=nut_id
                                JOIN alertas on anu_ale_id=ale_id
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                WHERE tal_fecha_baja is null AND ";

            if (!eliminados)
                cmd.CommandText += "ale_fecha_baja IS NULL ";
            else
                cmd.CommandText += "ale_fecha_baja IS NOT NULL ";
            DataTable dtcan = new DataTable();
            dtcan.Load(cmd.ExecuteReader());
            encontrados = Convert.ToInt32(dtcan.Rows[0]["cant"]);

            cmd.CommandText = @"SELECT anu_id, nut_id, nut_nombre, anu_tca_id, anu_operador, anu_valor_critico, ale_id, ale_nombre, ale_leyenda, tal_id, tal_forma, tal_color, tal_es_generica
                                FROM ALERTAS_X_NUTRIENTE 
                                JOIN nutrientes on anu_nut_id=nut_id
                                JOIN alertas on anu_ale_id=ale_id
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                WHERE tal_fecha_baja is null AND ";

            if (!eliminados)
                cmd.CommandText += "ale_fecha_baja IS NULL AND anu_fecha_baja is null ";
            else
                cmd.CommandText += "ale_fecha_baja IS NOT NULL AND anu_fecha_baja is NOT NULL ";
            cmd.CommandText += @" ORDER BY " +  columna + " " + sort + " LIMIT " + inicio + "," + cant;
            dt.Load(cmd.ExecuteReader());
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

        return dt;
    }

    public static DataSet ObtenerUno(ushort usuario, int idSello)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt_nutrientes = new DataTable();
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT ale_id, ale_nombre, ale_leyenda, tal_id, tal_nombre
                                FROM alertas 
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                WHERE tal_fecha_baja is null AND ale_id=@ale_id and ale_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@ale_id", idSello));

            dt.Load(cmd.ExecuteReader());


            cmd.CommandText = @"SELECT anu_id, nut_id, nut_nombre, anu_valor_critico, tca_id, tca_nombre
                                FROM ALERTAS_X_NUTRIENTE 
                                JOIN nutrientes on anu_nut_id=nut_id
                                JOIN tipos_calculo on anu_tca_id=tca_id
                                WHERE anu_ale_id=@ale_id AND anu_fecha_baja is null AND nut_fecha_baja IS NULL AND tca_fecha_baja is null;";
            dt_nutrientes.Load(cmd.ExecuteReader());


            ds.Tables.Add(dt);
            ds.Tables.Add(dt_nutrientes);
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

        return ds;
    }

    public static DataTable ObtenerNutrienteAlertaPorId(uint idNutrienteAlerta, bool eliminado)
    {
        DataTable dt = new DataTable();
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT anu_id, nut_id, nut_nombre, anu_tca_id, anu_operador, anu_valor_critico, ale_id, ale_nombre, ale_leyenda, tal_id, tal_color, tal_forma, tal_es_generica
                                FROM ALERTAS_X_NUTRIENTE 
                                JOIN nutrientes on anu_nut_id=nut_id
                                JOIN alertas on anu_ale_id=ale_id
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                WHERE tal_fecha_baja is null AND anu_id=@anu_id ";

            if (!eliminado)
            {
                cmd.CommandText = cmd.CommandText + "and ale_fecha_baja IS NULL AND anu_fecha_baja is null";
            }
            else
            {
                cmd.CommandText = cmd.CommandText + "and ale_fecha_baja IS NOT NULL AND anu_fecha_baja is NOT null";
            }
            cmd.Parameters.Add(new MySqlParameter("@anu_id", idNutrienteAlerta));

            dt.Load(cmd.ExecuteReader());
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
        return dt;

    }

    public static bool GuardarSello(int idUsuario, ModelNutriente nutriente, ModelNutriente nutrientePersistido)
    {
        MySqlTransaction trans = null;
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            bool esEdicion = nutriente.NutrientesAlerta.First().Alerta.Id != 0;
            cn.Open();
            trans = cn.BeginTransaction();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Transaction = trans;
            cmd.Parameters.Clear();
            cmd.Connection = cn;

            if (!esEdicion)
            {
                ModelAlerta nuevaAlerta = nutriente.NutrientesAlerta.First().Alerta;
                string cmdTipoAlertaNuevo = @"INSERT INTO TIPOS_ALERTA (tal_nombre, tal_forma, tal_color, tal_usu_id_alta, tal_usu_id_modificacion) values (
                                @ale_nombre, @tal_forma, @tal_color, @usu_id, @usu_id);";
                cmd.Parameters.Add(new MySqlParameter("@ale_nombre", nuevaAlerta.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@tal_forma", nuevaAlerta.TipoAlerta.Forma.Id));
                cmd.Parameters.Add(new MySqlParameter("@tal_color", nuevaAlerta.TipoAlerta.Color.CodigoHexadecimal));
                cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));

                cmd.CommandText = cmdTipoAlertaNuevo;
                cmd.ExecuteNonQuery();

                uint idTipoAlertaNueva = 0;
                string selectTipoAlerta = @"SELECT max(TAL_ID) max_id FROM TIPOS_ALERTA WHERE tal_nombre=@ale_nombre and tal_fecha_baja is null;";
                cmd.CommandText = selectTipoAlerta;

                MySqlDataReader drSelect = cmd.ExecuteReader();
                while (drSelect.Read())
                {
                    idTipoAlertaNueva = (uint)drSelect["max_id"];
                }
                drSelect.Close();

                if (idTipoAlertaNueva <= 0)
                {
                    trans.Rollback();
                }

                nuevaAlerta.TipoAlerta.Id = idTipoAlertaNueva;

                string cmdNuevo = @"INSERT INTO ALERTAS (ale_nombre, ale_leyenda, ale_tal_id,
                                ale_usu_id_alta, ale_usu_id_modificacion) VALUES (@ale_nombre, @ale_leyenda, @ale_tal_id, @usu_id, @usu_id);";
                cmd.Parameters.Add(new MySqlParameter("@ale_leyenda", nuevaAlerta.Leyenda));
                cmd.Parameters.Add(new MySqlParameter("@ale_tal_id", nuevaAlerta.TipoAlerta.Id));

                cmd.CommandText = cmdNuevo;
                cmd.ExecuteNonQuery();


                //Hay que agregar en Alertas_x_nutrientes
                uint idAlertaNutrientesNuevo = 0;
                string selectUltimaAlerta = @"SELECT max(ALE_ID) max_id FROM ALERTAS WHERE ale_nombre=@ale_nombre and ale_fecha_baja is null;";
                cmd.CommandText = selectUltimaAlerta;

                MySqlDataReader drSelectAlerta = cmd.ExecuteReader();
                while (drSelectAlerta.Read())
                {
                    idAlertaNutrientesNuevo = (uint)drSelectAlerta["max_id"];
                }
                drSelectAlerta.Close();

                if (idAlertaNutrientesNuevo <= 0)
                {
                    trans.Rollback();
                }

                string insertRelacion = @"INSERT INTO ALERTAS_X_NUTRIENTE (anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
                                anu_usu_id_alta, anu_usu_id_modificacion) VALUES (@anu_ale_id, @anu_nut_id, @anu_tca_id, @anu_operador, @anu_valor_critico, @usu_id, @usu_id);";
                cmd.CommandText = insertRelacion;
                cmd.Parameters.Add(new MySqlParameter("@anu_ale_id", idAlertaNutrientesNuevo));
                cmd.Parameters.Add(new MySqlParameter("@anu_nut_id", nutriente.Id));
                cmd.Parameters.Add(new MySqlParameter("@anu_tca_id", nutriente.NutrientesAlerta.First().TipoCalculo.Id));
                cmd.Parameters.Add(new MySqlParameter("@anu_operador", nutriente.NutrientesAlerta.First().Operador));
                cmd.Parameters.Add(new MySqlParameter("@anu_valor_critico", nutriente.NutrientesAlerta.First().ValorCritico));

                cmd.ExecuteNonQuery();

            }
            else
            {
                ModelAlerta alerta = nutriente.NutrientesAlerta.First().Alerta;
                ModelAlerta alertaPersistida = nutrientePersistido.NutrientesAlerta.First().Alerta;

                if (alerta.TipoAlerta.Color.CodigoHexadecimal != alertaPersistida.TipoAlerta.Color.CodigoHexadecimal)
                {
                    //dar de baja el tipo de alerta usada pre-existente, guardar el nuevo tipo_alerta y actualizar la alerta usando el nuevo tipo_alerta guardado
                    //alerta.TipoAlerta.Id = nuevoId
                }


                cmd.CommandText = @"UPDATE alertas set ale_nombre=@ale_nombre, ale_leyenda=@ale_leyenda, ale_tal_id=@ale_tal_id, ale_usu_id_modificacion=@usu_id 
                                WHERE ale_id=@ale_id and ale_fecha_baja IS NULL;";
                cmd.Parameters.Add(new MySqlParameter("@ale_id", alerta.Id));
                cmd.Parameters.Add(new MySqlParameter("@ale_nombre", alerta.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@ale_leyenda", alerta.Leyenda));
                cmd.Parameters.Add(new MySqlParameter("@ale_tal_id", alertaPersistida.TipoAlerta.Id));
                cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
                cmd.ExecuteNonQuery();

                //analizar si se está usando el mismo nutriente que antes.
                //si el nutriente cambió, hay que hacer lo mismo q el comentario anterior
                if (nutriente.Id != nutrientePersistido.Id)
                {
                    //dar de baja la relación usada y generar una nueva.
                    string cmdBajaRelacion = @"UPDATE ALERTAS_X_NUTRIENTE SET ANU_FECHA_BAJA=now(), ANU_USU_ID_BAJA=@usu_id WHERE ANU_ID=@anu_id;";
                    cmd.CommandText = cmdBajaRelacion;
                    cmd.Parameters.Add(new MySqlParameter("@anu_id", nutrientePersistido.NutrientesAlerta.First().Id));
                    cmd.ExecuteNonQuery();

                    string cmdAltaRelacion = @"INSERT INTO ALERTAS_X_NUTRIENTE (ANU_ALE_ID, ANU_NUT_ID, ANU_TCA_ID, ANU_OPERADOR, ANU_VALOR_CRITICO, ANU_USU_ID_ALTA, ANU_USU_ID_MODIFICACION) values
                                                (@ale_id, @nut_id, @ANU_TCA_ID, @ANU_OPERADOR, @ANU_VALOR_CRITICO, @usu_id, @usu_id);";
                    cmd.CommandText = cmdAltaRelacion;
                    cmd.Parameters.Add(new MySqlParameter("@nut_id", nutriente.Id));
                    cmd.Parameters.Add(new MySqlParameter("@ANU_TCA_ID", nutriente.NutrientesAlerta.First().TipoCalculo.Id));
                    cmd.Parameters.Add(new MySqlParameter("@ANU_OPERADOR", nutriente.NutrientesAlerta.First().Operador));
                    cmd.Parameters.Add(new MySqlParameter("@ANU_VALOR_CRITICO", nutriente.NutrientesAlerta.First().ValorCritico));
                    cmd.ExecuteNonQuery();


                }
                else if (nutriente.NutrientesAlerta.First().ValorCritico != nutrientePersistido.NutrientesAlerta.First().ValorCritico
                        || nutriente.NutrientesAlerta.First().Operador != nutrientePersistido.NutrientesAlerta.First().Operador
                        || nutriente.NutrientesAlerta.First().TipoCalculo.Id != nutrientePersistido.NutrientesAlerta.First().TipoCalculo.Id
                        )
                {
                    string cmdUpdateRelacion = @"UPDATE ALERTAS_X_NUTRIENTE set ANU_TCA_ID=@ANU_TCA_ID, ANU_OPERADOR=@ANU_OPERADOR, ANU_VALOR_CRITICO=@ANU_VALOR_CRITICO,
                                                ANU_USU_ID_MODIFICACION=@usu_id WHERE anu_id=@anu_id;";
                    cmd.CommandText = cmdUpdateRelacion;
                    cmd.Parameters.Add(new MySqlParameter("@anu_id", nutriente.NutrientesAlerta.First().Id));
                    cmd.Parameters.Add(new MySqlParameter("@ANU_TCA_ID", nutriente.NutrientesAlerta.First().TipoCalculo.Id));
                    cmd.Parameters.Add(new MySqlParameter("@ANU_OPERADOR", nutriente.NutrientesAlerta.First().Operador));
                    cmd.Parameters.Add(new MySqlParameter("@ANU_VALOR_CRITICO", nutriente.NutrientesAlerta.First().ValorCritico));
                    cmd.ExecuteNonQuery();
                }
            }
            trans.Commit();

        }
        catch (Exception ex)
        {
            if (trans != null)
            {
                trans.Rollback();
            }
            throw;
        }
        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
        return true;
    }

    public static DataTable ObtenerUltimosSellos(ushort idUsuario)
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
            cmd.CommandText = @"SELECT anu_id, nut_id, nut_nombre, anu_tca_id, anu_operador, anu_valor_critico, ale_id, ale_nombre, ale_leyenda, ale_fecha_alta, tal_id, tal_color, tal_forma, tal_es_generica
                                FROM ALERTAS_X_NUTRIENTE 
                                JOIN nutrientes on anu_nut_id=nut_id
                                JOIN alertas on anu_ale_id=ale_id
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                WHERE tal_fecha_baja is null and ale_usu_id_alta=@usu_id and anu_fecha_baja is null AND ale_fecha_baja IS NULL ORDER BY ale_id desc LIMIT 0,3;";
            cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
            dt.Load(cmd.ExecuteReader());
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
        return dt;
    }

    public static bool EliminarSello(uint idNutrienteAlerta, uint idAlerta, ushort idUsuario)
    {
        MySqlTransaction trans = null;
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            cn.Open();
            trans = cn.BeginTransaction();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Transaction = trans;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ALERTAS_X_NUTRIENTE set anu_usu_id_baja=@usu_id, anu_fecha_baja=now()
                            WHERE anu_id=@anu_id and anu_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@anu_id", idNutrienteAlerta));
            cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
            var res = cmd.ExecuteNonQuery();
            if (res == 0)
            {
                trans.Rollback();
                return false;
            }
            cmd.CommandText = @"UPDATE ALERTAS set ale_usu_id_baja=@usu_id, ale_fecha_baja=now()
                            WHERE ale_id=@ale_id and ale_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@ale_id", idAlerta));
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
            throw;
        }
        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
        return true;
    }


    public static bool RecuperarSello(uint idNutrienteAlerta, uint idAlerta, ushort idUsuario)
    {
        MySqlTransaction trans = null;
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            cn.Open();
            trans = cn.BeginTransaction();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Transaction = trans;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ALERTAS_X_NUTRIENTE set anu_usu_id_baja=null, anu_usu_id_modificacion=@usu_id, anu_fecha_baja=null, anu_fecha_modificacion=now()
                            WHERE anu_id=@anu_id and anu_fecha_baja IS NOT NULL;";
            cmd.Parameters.Add(new MySqlParameter("@anu_id", idNutrienteAlerta));
            cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
            var res = cmd.ExecuteNonQuery();
            if (res == 0)
            {
                trans.Rollback();
                return false;
            }
            cmd.CommandText = @"UPDATE ALERTAS set ale_usu_id_baja=null, ale_usu_id_modificacion=@usu_id, ale_fecha_baja=null, ale_fecha_modificacion=now()
                            WHERE ale_id=@ale_id and ale_fecha_baja IS NOT NULL;";
            cmd.Parameters.Add(new MySqlParameter("@ale_id", idAlerta));
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
            throw;
        }
        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
        return true;
    }

}
