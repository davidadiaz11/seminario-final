using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Linq;
using System.Collections.Generic;

public class MySQLRepositoryPerfil
{
    public MySQLRepositoryPerfil()
    {
    }
    static string cadena = MySQLRepositoryShared.getConnectionString();
    public static DataTable ObtenerPerfiles(int idUsuario)
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
            cmd.CommandText = @"SELECT prf_id, prf_nombre, prf_fecha_nacimiento, prf_ingredientes_prohibidos, prf_es_principal
                                FROM perfiles 
                                WHERE prf_usu_id=@usu_id AND prf_fecha_baja is null;";
            cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
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

    public static bool GuardarPerfil(int idUsuario, ModelPerfil perfil)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            bool esEdicion = perfil.Id != 0;
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            if (!esEdicion)
            {
                string cmdPerfilNuevo = @"INSERT INTO PERFILES (prf_nombre, prf_usu_id, prf_fecha_nacimiento, prf_ingredientes_prohibidos, tal_usu_id_modificacion) values (
                                @prf_nombre, @usu_id, @prf_fecha_nacimiento, @prf_ingredientes_prohibidos, @usu_id, @usu_id);";
                cmd.Parameters.Add(new MySqlParameter("@prf_nombre", perfil.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@prf_fecha_nacimiento", perfil.FechaNacimiento));
                cmd.Parameters.Add(new MySqlParameter("@prf_ingredientes_prohibidos", perfil.IngredientesProhibidos));
                cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));

                cmd.CommandText = cmdPerfilNuevo;
                cmd.ExecuteNonQuery();
            }
            else
            {
                
                cmd.CommandText = @"UPDATE PERFILES set prf_nombre=@prf_nombre, prf_fecha_nacimiento=@prf_fecha_nacimiento, prf_usu_id_modificacion=@usu_id 
                                WHERE prf_id=@prf_id and prf_fecha_baja IS NULL;";
                cmd.Parameters.Add(new MySqlParameter("@prf_id", perfil.Id));
                cmd.Parameters.Add(new MySqlParameter("@prf_nombre", perfil.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@prf_fecha_nacimiento", perfil.FechaNacimiento));
                cmd.Parameters.Add(new MySqlParameter("@prf_ingredientes_prohibidos", perfil.IngredientesProhibidos));
                cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
                cmd.ExecuteNonQuery();
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

    public static bool EliminarPerfil(uint idPerfil, ushort idUsuario)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE PERFILES set prf_usu_id_baja=@usu_id, prf_fecha_baja=now(),
                            WHERE prf_id=@prf_id and prf_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@prf_id", idPerfil));
            cmd.Parameters.Add(new MySqlParameter("@usu_id", idUsuario));
            var res = cmd.ExecuteNonQuery();
            return res == 1;
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

    public static DataTable ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        DataTable dt = new DataTable();
        try
        {
            string prefijoTabla = "prf_";
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();

            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;

            cmd.CommandText = @"SELECT COUNT(prf_id) cant 
                                FROM perfiles 
                                WHERE prf_usu_id=@usu_id AND ";

           
            if (!eliminados)
                cmd.CommandText += "prf_fecha_baja IS NULL ";
            else
                cmd.CommandText += "prf_fecha_baja IS NOT NULL ";
            cmd.Parameters.Add(new MySqlParameter("@eliminado", eliminados));
            cmd.Parameters.Add(new MySqlParameter("@usu_id", usuario));
            DataTable dtcan = new DataTable();
            dtcan.Load(cmd.ExecuteReader());
            encontrados = Convert.ToInt32(dtcan.Rows[0]["cant"]);

            cmd.CommandText = @"SELECT prf_id, prf_usu_id, prf_nombre, prf_fecha_nacimiento, prf_es_principal, prf_ingredientes_prohibidos
                                FROM perfiles 
                                WHERE prf_usu_id=@usu_id AND ";

            if (!eliminados)
                cmd.CommandText += "prf_fecha_baja IS NULL ";
            else
                cmd.CommandText += "prf_fecha_baja IS NOT NULL ";
            cmd.CommandText += @" ORDER BY " + prefijoTabla + columna + " " + sort + " LIMIT " + inicio + "," + cant;
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
}
