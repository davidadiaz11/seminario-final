using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

public class ServicePerfiles
{
    public ServicePerfiles()
    {
    }

    //TODO-TESIS: Cambiar
    private static int idUsuario = 2;
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

    public static ModelPerfil ObtenerPerfil(uint idPerfil)
    {
        return ObtenerPerfiles().First(x => x.Id == idPerfil);
    }

    public static bool GuardarPerfil(ModelPerfil perfil, uint idPerfilPersistido)
    {
        var resultado = false;
        try
        {
            ModelPerfil perfilPersistido = ObtenerPerfil(idPerfilPersistido);

            if (perfil.Id > 0 && perfil.Nombre == perfilPersistido.Nombre && perfil.FechaNacimiento == perfilPersistido.FechaNacimiento || perfil.IngredientesProhibidos == perfilPersistido.IngredientesProhibidos)
            {
                return true;
            }
            resultado = MySQLRepositoryPerfil.GuardarPerfil(idUsuario, perfil);
            if (!resultado)
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

    public static List<ModelPerfil> ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
    {
        DataTable dt = MySQLRepositoryPerfil.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, usuario, eliminados);
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
