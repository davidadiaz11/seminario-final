using System;
using System.Data;
using System.Linq;
using Models;
using Repositories;
using Validators;
namespace Services
{
    public class ServiceUsuario
    {
        public ServiceUsuario()
        {
        }
        public static ModelUsuario ObtenerUsuario(ushort idUsuario)
        {
            DataTable dt = MySQLRepositoryUsuario.ObtenerUsuario(idUsuario);
            DataRow dr = dt.Rows[0];
            ModelUsuario item = new ModelUsuario()
            {
                Id = Convert.ToUInt16(dr["usu_id"]),
                Nombre = dr["usu_nombre"].ToString(),
                Rol = dr["rol_nombre"].ToString(),
                Perfiles = ServicePerfiles.ObtenerPerfiles(idUsuario)
            };
            return item;
        }

        public static Resultado<uint> Guardar(ModelUsuario usuario)
        {
            Resultado<uint> resultado = new Resultado<uint>(0);
            try
            {
                if (!MySQLRepositoryUsuario.ValidarEmailExistente(usuario.Email))
                {
                    resultado.ObtenerError("Ya existe un usuario con ese email, utilice otro.");
                    return resultado;
                }
                resultado.Data = MySQLRepositoryUsuario.Guardar(usuario);
                if (!resultado.Ok)
                {
                    resultado.ObtenerError("Error al guardar un nuevo usuario.");
                    return resultado;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return resultado;
        }

        public static Resultado<ModelUsuario> Autenticar(string email, string contrasena)
        {
            Resultado<ModelUsuario> resultado = new Resultado<ModelUsuario>();
            try
            {
                DataTable dt = MySQLRepositoryUsuario.Autenticar(email, contrasena);

                if (dt.Rows.Count == 0)
                {
                    resultado.ObtenerError("Usuario no encontrado, los datos de acceso son incorrectos.");
                    return resultado;
                }

                DataRow dr = dt.Rows[0];
                if (dr["usu_fecha_baja"] != DBNull.Value)
                {
                    resultado.ObtenerError("Usuario dado de baja, genere un nuevo usuario.");
                    return resultado;
                }

                ModelUsuario item = new ModelUsuario()
                {
                    Id = Convert.ToUInt16(dr["usu_id"]),
                    Nombre = dr["usu_nombre"].ToString()
                };
                resultado.Data = item;
            }
            catch (Exception ex)
            {
                throw;
            }
            return resultado;
        }
    }
}
