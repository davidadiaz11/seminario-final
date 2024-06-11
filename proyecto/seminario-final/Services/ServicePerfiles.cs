using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

public class ServicePerfiles
{
    public ServicePerfiles()
    {
    }
    private static ushort idUsuario = ServiceSesion.ObtenerUsuario();
    public static List<ModelPerfil> ObtenerPerfiles()
    {
        DataTable dt = MySQLRepositoryPerfil.ObtenerPerfiles(idUsuario);
        List<ModelPerfil> items = new List<ModelPerfil>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelPerfil x = new ModelPerfil()
            {
                Id = Convert.ToUInt16(dr["prf_id"]),
                Nombre = dr["prf_nombre"].ToString(),
                FechaNacimiento = Convert.ToDateTime(dr["prf_fecha_nacimiento"]),
                IngredientesProhibidos = dr["prf_ingredientes_prohibidos"].ToString(),
                EsPrincipal = Convert.ToBoolean(dr["prf_es_principal"])
            };
            items.Add(x);
        }
        return items;
    }

    public static Resultado<bool> Eliminar(uint idPerfil)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            var resPerfil = ObtenerPerfil(idPerfil).Data;

            if (resPerfil.EsPrincipal)
            {
                resultado.ObtenerError("No es posible eliminar el perfil principal");
                return resultado;
            }

            resultado.Data = MySQLRepositoryPerfil.EliminarPerfil(idPerfil, idUsuario);
            if (!resultado.Data)
            {
                resultado.ObtenerError("Error al eliminar perfil");
                return resultado;
            }
        }
        catch (Exception ex)
        {
            resultado.ObtenerError(ex.Message);
            return resultado;
        }
        return resultado;
    }

    public static Resultado<bool> Recuperar(uint idPerfil)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            resultado.Data = MySQLRepositoryPerfil.RecuperarPerfil(idPerfil, idUsuario);
            if (!resultado.Data)
            {
                resultado.ObtenerError("Error al recuperar perfil");
                return resultado;
            }
        }
        catch (Exception ex)
        {
            resultado.ObtenerError(ex.Message);
            return resultado;
        }
        return resultado;
    }
    public static Resultado<ModelPerfil> ObtenerPerfil(uint idPerfil)
    {
        var resultado = new Resultado<ModelPerfil>();
        var resPerfil = ObtenerPerfiles().FirstOrDefault(x => x.Id == idPerfil);
        if (resPerfil == null)
        {
            resultado.ObtenerError("No se encontró el perfil buscado");
            return resultado;
        }
        resultado.Data = resPerfil;
        return resultado;
    }

    public static Resultado<bool> GuardarPerfil(ModelPerfil perfil, uint idPerfilPersistido)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            if (idPerfilPersistido > 0)
            {
                ModelPerfil perfilPersistido = ObtenerPerfil(idPerfilPersistido).Data;
                if (perfil.Id > 0 && perfil.Nombre == perfilPersistido.Nombre && perfil.FechaNacimiento == perfilPersistido.FechaNacimiento && perfil.IngredientesProhibidos == perfilPersistido.IngredientesProhibidos)
                {
                    resultado.Mensaje = "No hay cambios para guardar.";
                    return resultado;
                }
                perfil.Id = idPerfilPersistido;
            }

            resultado.Data = MySQLRepositoryPerfil.GuardarPerfil(idUsuario, perfil);
            if (!resultado.Ok)
            {
                resultado.ObtenerError("Error al actualizar perfil.");
                return resultado;
            }
        }
        catch (Exception ex)
        {
            resultado.ObtenerError(ex.Message);
            return resultado;
        }
        resultado.Data = true;
        return resultado;
    }

    public static List<ModelPerfil> ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, bool eliminados)
    {
        DataTable dt = MySQLRepositoryPerfil.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, idUsuario, eliminados);
        List<ModelPerfil> items = new List<ModelPerfil>();
        List<ModelNutrienteProducto> nutrientes = new List<ModelNutrienteProducto>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelPerfil x = new ModelPerfil()
            {
                Id = Convert.ToUInt16(dr["prf_id"]),
                Nombre = dr["prf_nombre"].ToString(),
                IngredientesProhibidos = dr["prf_ingredientes_prohibidos"].ToString(),
                FechaNacimiento = Convert.ToDateTime(dr["prf_fecha_nacimiento"]),
                EsPrincipal = Convert.ToBoolean(dr["prf_es_principal"])
            };
            items.Add(x);
        }
        return items;
    }
}
