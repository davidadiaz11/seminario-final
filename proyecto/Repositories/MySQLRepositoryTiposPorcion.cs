using System;
using MySql.Data.MySqlClient;
using System.Data;
namespace Repositories
{
    public class MySQLRepositoryTiposPorcion
    {
        public MySQLRepositoryTiposPorcion()
        {
        }

        static string cadena = MySQLRepositoryShared.getConnectionString();
        public static DataTable ObtenerTiposPorcion()
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
                cmd.CommandText = @"SELECT TPO_ID, TPO_NOMBRE FROM TIPOS_PORCION
                                WHERE tpo_fecha_baja is null";

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
}
