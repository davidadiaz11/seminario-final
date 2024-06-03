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

    public static bool Eliminar(uint idPerfil)
    {
        bool res = false;
        try
        {
            res = MySQLRepositoryPerfil.EliminarPerfil(idPerfil, idUsuario);
        }
        catch (Exception ex)
        {
            throw;
        }
        return res;
    }
    public static ModelPerfil ObtenerPerfil(uint idPerfil)
    {
        return ObtenerPerfiles().First(x => x.Id == idPerfil);
    }

    public static Resultado<bool> GuardarPerfil(ModelPerfil perfil, uint idPerfilPersistido)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            ModelPerfil perfilPersistido = ObtenerPerfil(idPerfilPersistido);

            if (perfil.Id > 0 && perfil.Nombre == perfilPersistido.Nombre && perfil.FechaNacimiento == perfilPersistido.FechaNacimiento || perfil.IngredientesProhibidos == perfilPersistido.IngredientesProhibidos)
            {
                resultado.Mensaje = "No hay cambios para guardar.";
                return resultado;
            }
            resultado.Data = MySQLRepositoryPerfil.GuardarPerfil(idUsuario, perfil);
            if (!resultado.Ok)
            {
                throw new Exception("Error al actualizar alerta.");
            }
        }
        catch (Exception ex)
        {
            throw;
        }
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
