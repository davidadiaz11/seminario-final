using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;

public class MySQLRepositoryAnalisis
{
    public MySQLRepositoryAnalisis()
    {
    }

    static string cadena = MySQLRepositoryShared.getConnectionString();


    public static DataSet ObtenerProductoPorId(ushort usuario, int idProducto)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtNutrientesYAlertas = new DataTable();
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
           
            string terceraQuery = @"SELECT npr_pro_id, nut_nombre, NUT_TIPO_NUTRIENTE, NPR_CANTIDAD_POR_PORCION, ale_leyenda, ANU_VALOR_CRITICO, ANU_OPERADOR, TCA_NOMBRE, TCA_NOMBRE_ENUM, TAL_ES_GENERICA, TAL_COLOR, TAL_FORMA
                                from nutrientes_x_productos
                                join nutrientes on npr_nut_id=nut_id
								LEFT JOIN alertas_x_nutriente on npr_nut_id=anu_nut_id AND anu_fecha_baja is null
                                LEFT JOIN tipos_calculo on anu_tca_id=tca_id
								LEFT JOIN alertas on anu_ale_id=ale_id
                                LEFT JOIN tipos_alerta on ale_tal_id=tal_id
                                where npr_pro_id=@pro_id AND 
                                npr_fecha_baja is null AND tal_fecha_baja is null AND ale_fecha_baja is null AND tca_fecha_baja is null;";

            cmd.CommandText = terceraQuery;
            dtNutrientesYAlertas.Load(cmd.ExecuteReader());
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
        ds.Tables.Add(dtNutrientesYAlertas);
        return ds;
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

            cmd.CommandText = @"SELECT COUNT(ahi_id) cant 
                                FROM analisis_historicos where ahi_usu_id_alta=@usu_id";

            
            cmd.Parameters.Add(new MySqlParameter("@usu_id", usuario));
            DataTable dtcan = new DataTable();
            dtcan.Load(cmd.ExecuteReader());
            encontrados = Convert.ToInt32(dtcan.Rows[0]["cant"]);

            cmd.CommandText = @"SELECT ahi_id, ahi_fecha, pro_id, pro_nombre
                                FROM analisis_historicos join productos on ahi_pro_id=pro_id where ahi_usu_id_alta=@usu_id ";

            cmd.CommandText += @" ORDER BY " + columna + " " + sort + " LIMIT " + inicio + "," + cant;
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
    public static DataTable VerificarProductoAnalizado(ushort idUsuario, uint idProducto)
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

            cmd.CommandText = @"SELECT COUNT(ahi_id) cant 
                                FROM analisis_historicos where ahi_usu_id_alta=@usu_id and ahi_pro_id=@pro_id and DATEDIFF(ahi_fecha, now()) <= 0";

            cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
            cmd.Parameters.Add(new MySqlParameter("@pro_id", idProducto));
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

    public static bool GuardarAnalisis(ushort idUsuario, uint idProducto)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"INSERT INTO ANALISIS_HISTORICOS(AHI_PRO_ID, AHI_USU_ID_ALTA, AHI_USU_ID_MODIFICACION)
                                values (@AHI_PRO_ID, @USUARIO_ID, @USUARIO_ID);";
            cmd.Parameters.Add(new MySqlParameter("@AHI_PRO_ID", idProducto));
            cmd.Parameters.Add(new MySqlParameter("@USUARIO_ID", idUsuario));

            var res = cmd.ExecuteNonQuery();

            return res == 1;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
    }
}
