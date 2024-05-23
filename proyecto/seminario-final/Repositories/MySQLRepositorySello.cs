using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;

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

            cmd.CommandText = @"SELECT COUNT(ale_id) cant 
                                FROM alertas 
                                WHERE ";

            foreach (ModelFiltro filtro in filtros)
            {

                switch (filtro.filtro)
                {
                    case "nombre":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.fecha_inicio));
                        break;
                    case "condicion":
                        cmd.CommandText += "d." + filtro.filtro + " " + filtro.signo + filtro.filtro + " AND ";
                        cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.valor));
                        break;
                    case "doc":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.fecha_inicio));
                        break;
                    default: break;
                }

            }

            if (!eliminados)
                cmd.CommandText += "ale_fecha_baja IS NULL ";
            else
                cmd.CommandText += "ale_fecha_baja IS NOT NULL ";
            cmd.Parameters.Add(new MySqlParameter("@eliminado", eliminados));
            DataTable dtcan = new DataTable();
            dtcan.Load(cmd.ExecuteReader());
            encontrados = Convert.ToInt32(dtcan.Rows[0]["cant"]);

            cmd.CommandText = @"SELECT ale_id, ale_nombre, ale_leyenda, tal_id, tal_nombre, tal_forma, tal_color
                                FROM alertas 
                                JOIN tipos_alerta on tal_id=ale_tal_id
                                
                                WHERE tal_fecha_baja is null AND ";

            foreach (ModelFiltro filtro in filtros)
            {
                switch (filtro.filtro)
                {
                    case "nombre":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        break;
                    case "condicion":
                        cmd.CommandText += "d." + filtro.filtro + " " + filtro.signo + filtro.filtro + " AND ";
                        break;
                    case "doc":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        break;
                    default: break;
                }
            }

            if (!eliminados)
                cmd.CommandText += "ale_fecha_baja IS NULL ";
            else
                cmd.CommandText += "ale_fecha_baja IS NOT NULL ";
            cmd.CommandText += @" ORDER BY " + columna + " " + sort + " LIMIT " + inicio + "," + cant;
            dt.Load(cmd.ExecuteReader());

            List<int> ids = new List<int>();
            string idsString = "";

            foreach (DataRow item in dt.Rows)
            {
                ids.Add(Convert.ToInt32(item["ale_id"]));
                idsString = idsString + "," + item["ale_id"].ToString();
            }
            idsString = idsString.Substring(1, idsString.Length - 1);

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

    public static bool ModificarSello(ModelAlerta alerta)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
       
        try
        {
            bool esEdicion = alerta.Id != 0;


            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ale set ale_nombre=@ale_nombre, ale_leyenda=@ale_leyenda, ale_tal_id=@ale_tal_id
                                WHERE ale_id=@ale_id and ale_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@ale_id", alerta.Id));
            cmd.Parameters.Add(new MySqlParameter("@ale_nombre", alerta.Nombre));
            cmd.Parameters.Add(new MySqlParameter("@ale_leyenda", alerta.Leyenda));
            cmd.Parameters.Add(new MySqlParameter("@ale_tal_id", alerta.TipoAlerta.Id));


            cmd.ExecuteNonQuery();

            if (esEdicion)
            {
                //TODO-TESIS: Hay que ver, cuáles relaciones borrar y cuáles relaciones dejar
                //foreach (ModelNutrienteAlerta nutriente in alerta.NutrientesAlerta)
                //{
                //    var sssql = "update ALERTAS_X_NUTRIENTE set anu_valor_critico=@anu_valor_critico where anu_id=@anu_id;";
                //    cmd.Parameters.Add(new MySqlParameter("@anu_valor_critico", nutriente.ValorCritico));
                //    cmd.Parameters.Add(new MySqlParameter("@anu_id", nutriente.Id));
                //    cmd.CommandText = sssql;
                //    cmd.ExecuteNonQuery();
                //    cmd.Parameters.Clear();
                //}
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
}
