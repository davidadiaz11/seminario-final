using System;
using MySql.Data.MySqlClient;
using System.Data;

public class MySQLRepositoryUsuario
{
    public MySQLRepositoryUsuario()
    {
    }

    static string cadena = MySQLRepositoryShared.getConnectionString();
    public static DataTable ObtenerUsuario(ushort idUsuario)
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
            cmd.CommandText = @"SELECT USU_ID, USU_NOMBRE, ROL_ID, ROL_NOMBRE
                                FROM USUARIOS JOIN ROLES ON USU_ROL_ID=ROL_ID
                                WHERE usu_id=@usu_id and usu_fecha_baja is null and rol_fecha_baja is null";
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

}
