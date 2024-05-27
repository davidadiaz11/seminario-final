using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;

public class MySQLRepositoryTiposCalculo
{
    public MySQLRepositoryTiposCalculo()
    {
    }

    static string cadena = MySQLRepositoryShared.getConnectionString();
    public static DataTable ObtenerTiposCalculo()
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
            cmd.CommandText = @"SELECT TCA_ID, TCA_NOMBRE, TCA_NOMBRE_ENUM FROM TIPOS_CALCULO
                                WHERE tca_fecha_baja is null";

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
