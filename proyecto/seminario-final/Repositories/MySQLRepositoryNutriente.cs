using System;
using MySql.Data.MySqlClient;
using System.Data;

public class MySQLRepositoryNutriente
{
    public MySQLRepositoryNutriente()
    {
    }

    static string cadena = MySQLRepositoryShared.getConnectionString();
    public static DataTable ObtenerNutrientes()
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
            cmd.CommandText = @"SELECT nut_id, nut_nombre, nut_tipo_nutriente
                                FROM nutrientes 
                                WHERE nut_fecha_baja is null;";

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
