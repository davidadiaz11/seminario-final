using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;

public class MySQLRepositoryProducto
{
    public MySQLRepositoryProducto()
    {
    }

    static string cadena = "";
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
            cmd.CommandText = @"SELECT id, nombre, usuario, email FROM usuario
                                WHERE habilitado=1";

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
