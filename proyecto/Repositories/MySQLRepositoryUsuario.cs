using System;
using MySql.Data.MySqlClient;
using System.Data;
using Models;
using System.Collections.Generic;
namespace Repositories
{
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

        public static uint Guardar(ModelUsuario usuario)
        {
            uint idUsuarioNuevo = 0;
            MySqlTransaction trans = null;
            MySqlConnection cn = new MySqlConnection(cadena);
            try
            {
                cn.Open();
                trans = cn.BeginTransaction();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = cn;
                cmd.Parameters.Clear();
                cmd.Connection = cn;
                cmd.Transaction = trans;
                cmd.Parameters.Add(new MySqlParameter("@usu_nombre", usuario.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@usu_email", usuario.Email));
                cmd.Parameters.Add(new MySqlParameter("@usu_contrasena", usuario.Contrasena));
                string cmdUsuarioNuevo = @"INSERT INTO USUARIOS (USU_NOMBRE, USU_EMAIL, USU_CONTRASENA, USU_ROL_ID, USU_ID_ALTA, USU_ID_MODIFICACION) values (
                                @usu_nombre, @usu_email, @usu_contrasena, (select rol_id from roles where rol_nombre='Usuario consumidor'), 1, 1);";
                cmd.CommandText = cmdUsuarioNuevo;
                cmd.ExecuteNonQuery();
                
                string selectNuevoUsuario = @"SELECT max(USU_ID) max_id FROM USUARIOS;";
                cmd.CommandText = selectNuevoUsuario;
                MySqlDataReader drSelect = cmd.ExecuteReader();
                while (drSelect.Read())
                {
                    idUsuarioNuevo = (uint)drSelect["max_id"];
                }
                drSelect.Close();
                if (idUsuarioNuevo <= 0)
                {
                    trans.Rollback();
                }
                ModelPerfil nuevoPerfil = new ModelPerfil()
                {
                    Nombre = usuario.Nombre
                };
                usuario.Perfiles = new List<ModelPerfil>() { nuevoPerfil };
                string cmdNuevo = @"INSERT INTO PERFILES (PRF_NOMBRE, PRF_USU_ID, PRF_ES_PRINCIPAL, PRF_USU_ID_ALTA, PRF_USU_ID_MODIFICACION) 
                                                  VALUES (@PRF_NOMBRE, @PRF_USU_ID, 1, @PRF_USU_ID_ALTA, @PRF_USU_ID_MODIFICACION);";
                cmd.Parameters.Add(new MySqlParameter("@PRF_NOMBRE", usuario.Nombre));
                cmd.Parameters.Add(new MySqlParameter("@PRF_USU_ID", idUsuarioNuevo));
                cmd.Parameters.Add(new MySqlParameter("@PRF_USU_ID_ALTA", idUsuarioNuevo));
                cmd.Parameters.Add(new MySqlParameter("@PRF_USU_ID_MODIFICACION", idUsuarioNuevo));
                cmd.CommandText = cmdNuevo;
                cmd.ExecuteNonQuery();

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
            return idUsuarioNuevo;
        }

        public static bool ValidarEmailExistente(string email)
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
                cmd.Parameters.Add(new MySqlParameter("@usu_email", email));
                string cmdUsuario = @"SELECT USU_ID FROM USUARIOS WHERE USU_EMAIL=@usu_email AND USU_FECHA_BAJA IS NULL;";
                cmd.CommandText = cmdUsuario;
                dt.Load(cmd.ExecuteReader());

                if (dt.Rows.Count > 0)
                {
                    return false;
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

        public static DataTable Autenticar(string email, string contrasena)
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
                cmd.Parameters.Add(new MySqlParameter("@usu_email", email));
                cmd.Parameters.Add(new MySqlParameter("@usu_contrasena", contrasena));
                string cmdUsuario = @"SELECT USU_ID, USU_NOMBRE, usu_email, USU_FECHA_BAJA FROM USUARIOS WHERE USU_EMAIL=@usu_email AND USU_CONTRASENA=@usu_contrasena;";
                cmd.CommandText = cmdUsuario;
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
}
