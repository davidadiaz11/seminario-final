using System;
using System.Data;

public class ServiceUsuario
{
    public ServiceUsuario()
    {
    }
    static ushort idUsuario = 2;
   
    public static ModelUsuario ObtenerUsuario()
    {
        DataTable dt = MySQLRepositoryUsuario.ObtenerUsuario(idUsuario);
        DataRow dr = dt.Rows[0];
        ModelUsuario item = new ModelUsuario()
            {
                Id = Convert.ToUInt16(dr["usu_id"]),
                Nombre = dr["usu_nombre"].ToString(),
                Rol = dr["rol_nombre"].ToString(),
                Perfiles = ServicePerfiles.ObtenerPerfiles()
        };
        return item;
    }
}
