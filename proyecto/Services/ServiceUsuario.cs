using System;
using System.Data;
using Models;
using Repositories;
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
    }
}
