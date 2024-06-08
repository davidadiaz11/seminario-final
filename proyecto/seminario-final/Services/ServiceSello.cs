using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using seminario_final.Validators;
using FluentValidation.Results;

public class ServiceSello
{
    public ServiceSello()
    {
    }

    private static ushort idUsuario = ServiceSesion.ObtenerUsuario();
    public static List<ModelAlerta> ObtenerAlertas()
    {
        DataTable dt = MySQLRepositorySello.ObtenerSellos();
        List<ModelAlerta> items = new List<ModelAlerta>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelAlerta x = new ModelAlerta()
            {
                Id = Convert.ToUInt16(dr["ale_id"]),
                Nombre = dr["ale_nombre"].ToString()
            };
            items.Add(x);
        }

        return items;
    }

    public static Resultado<bool> Eliminar(uint idNutrienteAlerta)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            var resNutrienteAlerta = ObtenerNutrienteAlertaPorId(idNutrienteAlerta, false);
            ModelNutriente nut = resNutrienteAlerta.Data;

            if (nut.NutrientesAlerta.First().Alerta.TipoAlerta.EsGenerica)
            {
                if (!ServiceShared.ValidarPermisos().Data)
                {
                    resultado.ObtenerError("No posee los permisos para eliminar. Comuníquese con el administrador del software.");
                    return resultado;
                }
            }

            var resEliminar = MySQLRepositorySello.EliminarSello(nut.NutrientesAlerta.First().Id, nut.NutrientesAlerta.First().Alerta.Id, idUsuario);
            if (!resEliminar)
            {
                resultado.ObtenerError("Error al eliminar el sello.");
                return resultado;
            }
        }
        catch (Exception ex)
        {
            throw;
        }
        return resultado;
    }

    public static Resultado<bool> Recuperar(uint idNutrienteAlerta)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            var resNutrienteAlerta = ObtenerNutrienteAlertaPorId(idNutrienteAlerta, true);
            ModelNutriente nut = resNutrienteAlerta.Data;

            if (nut.NutrientesAlerta.First().Alerta.TipoAlerta.EsGenerica)
            {
                if (!ServiceShared.ValidarPermisos().Data)
                {
                    resultado.ObtenerError("No posee los permisos para recuperar. Comuníquese con el administrador del software.");
                    return resultado;
                }
            }

            var resEliminar = MySQLRepositorySello.RecuperarSello(nut.NutrientesAlerta.First().Id, nut.NutrientesAlerta.First().Alerta.Id, idUsuario);
            if (!resEliminar)
            {
                resultado.ObtenerError("Error al recuperar el sello.");
                return resultado;
            }
        }
        catch (Exception ex)
        {
            throw;
        }
        return resultado;
    }

    public static List<ModelNutriente> ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, bool eliminados)
    {
        DataTable dt = MySQLRepositorySello.ObtenerTodosFiltrados(out encontrados, filtros, inicio, cant, columna, sort, idUsuario, eliminados);
        List<ModelNutriente> items = new List<ModelNutriente>();
        foreach (DataRow dr in dt.Rows)
        {
            ModelNutriente x = new ModelNutriente()
            {
                Id = Convert.ToUInt16(dr["nut_id"]),
                Nombre = dr["nut_nombre"].ToString(),
                NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(dr["anu_id"]),
                        Operador = dr["anu_operador"].ToString(),
                        TipoCalculo = new ModelTipoCalculo()
                        {
                            Id = Convert.ToUInt32(dr["anu_tca_id"])
                        },
                        ValorCritico = Convert.ToDouble(dr["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt32(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = dr["ale_leyenda"].ToString(),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Id = Convert.ToUInt32(dr["tal_id"]),
                                EsGenerica = Convert.ToBoolean(dr["tal_es_generica"]),
                                Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(dr["tal_forma"])),
                                Color = new ModelColorAlerta()
                                {
                                    CodigoHexadecimal = dr["tal_color"].ToString()
                                }
                            }
                        }
                    }
                }
            };
            items.Add(x);
        }
        return items;
    }

    public static Resultado<ModelNutriente> ObtenerNutrienteAlertaPorId(uint idNutrienteAlerta, bool eliminado)
    {
        Resultado<ModelNutriente> resultado = new Resultado<ModelNutriente>();
        DataTable dt = MySQLRepositorySello.ObtenerNutrienteAlertaPorId(idNutrienteAlerta, eliminado);

        if (dt.Rows.Count != 1)
        {
            resultado.ObtenerError("No se encontró el sello.");
            return resultado;
        }

        DataRow dr = dt.Rows[0];

        ModelNutriente x = new ModelNutriente()
        {
            Id = Convert.ToUInt16(dr["nut_id"]),
            Nombre = dr["nut_nombre"].ToString(),
            NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(dr["anu_id"]),
                        Operador = dr["anu_operador"].ToString(),
                        TipoCalculo = new ModelTipoCalculo()
                        {
                            Id = Convert.ToUInt32(dr["anu_tca_id"])
                        },
                        ValorCritico = Convert.ToDouble(dr["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt32(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = dr["ale_leyenda"].ToString(),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Id = Convert.ToUInt32(dr["tal_id"]),
                                Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(dr["tal_forma"])),
                                EsGenerica = Convert.ToBoolean(dr["tal_es_generica"]),
                                Color = new ModelColorAlerta()
                                {
                                    CodigoHexadecimal = dr["tal_color"].ToString()
                                }
                            }
                        }
                    }
                }
        };
        resultado.Data = x;
        return resultado;
    }

    public static Resultado<bool> GuardarAlerta(ModelNutriente nutriente, ModelNutriente nutrientePersistido)
    {
        Resultado<bool> resultado = new Resultado<bool>(false);
        try
        {
            if (nutrientePersistido != null && nutrientePersistido.NutrientesAlerta.First().Alerta.TipoAlerta.EsGenerica && !ServiceShared.ValidarPermisos().Data)
            {
                resultado.ObtenerError("No posee los permisos para modificar. Comuníquese con el administrador del sistema.");
                return resultado;
            }

            uint idTipoCalculoSeleccionado = nutriente.NutrientesAlerta.First().TipoCalculo.Id;
            var tipoCalculo = ServiceTiposCalculo.ObtenerTiposCalculo(nutriente.Id);
            nutriente.NutrientesAlerta.First().TipoCalculo = tipoCalculo.Find(x => x.Id == idTipoCalculoSeleccionado);

            var validator = new AlertaValidator();
            ValidationResult result = validator.Validate(nutriente.NutrientesAlerta.First().Alerta);
            if (!result.IsValid)
            {
                resultado.ObtenerError(result.Errors.First().ErrorMessage);
                return resultado;
            }
            var validatorNutrienteAlerta = new NutrienteAlertaValidator();
            ValidationResult resultNutrienteAlerta = validatorNutrienteAlerta.Validate(nutriente.NutrientesAlerta.First());
            if (!resultNutrienteAlerta.IsValid)
            {
                resultado.ObtenerError(resultNutrienteAlerta.Errors.First().ErrorMessage);
                return resultado;
            }

            resultado.Data = MySQLRepositorySello.GuardarSello(idUsuario, nutriente, nutrientePersistido);
            if (!resultado.Ok)
            {
                resultado.ObtenerError("Error al actualizar alerta.");
                return resultado;
            }
        }
        catch (Exception ex)
        {
            throw;
        }
        return resultado;
    }

    public static ModelNutriente ObtenerPorId(int idAlerta)
    {
        DataSet ds = MySQLRepositorySello.ObtenerUno(idUsuario, idAlerta);
        DataTable dt = ds.Tables[0];
        DataTable dt_nutrientes = ds.Tables[1];
        List<ModelNutriente> nutrientes = new List<ModelNutriente>();

        if (dt.Rows.Count != 1)
        {
            //responder que no se encontró
            return null;
        }
        DataRow dr = dt.Rows[0];
        foreach (DataRow drNut in dt_nutrientes.Rows)
        {
            ModelNutriente nut = new ModelNutriente()
            {
                Id = Convert.ToUInt32(drNut["nut_id"]),
                Nombre = drNut["nut_nombre"].ToString(),
                NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(drNut["anu_id"]),
                        ValorCritico = Convert.ToDouble(drNut["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt16(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = drNut["ale_leyenda"].ToString(),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Nombre = dr["tal_nombre"].ToString()
                            }
                        }
                    }
                }
            };
            nutrientes.Add(nut);
        }
        return nutrientes.First();
    }

    public static List<ModelNutriente> ObtenerUltimosSellos()
    {
        List<ModelNutriente> items = new List<ModelNutriente>();
        DataTable dt = MySQLRepositorySello.ObtenerUltimosSellos(idUsuario);
        if(dt.Rows.Count == 0)
        {
            return items;
        }
        DataRow dr = dt.Rows[0];

        ModelNutriente x = new ModelNutriente()
        {
            Id = Convert.ToUInt16(dr["nut_id"]),
            Nombre = dr["nut_nombre"].ToString(),
            NutrientesAlerta = new List<ModelNutrienteAlerta>()
                {
                    new ModelNutrienteAlerta()
                    {
                        Id = Convert.ToUInt32(dr["anu_id"]),
                        Operador = dr["anu_operador"].ToString(),
                        TipoCalculo = new ModelTipoCalculo()
                        {
                            Id = Convert.ToUInt32(dr["anu_tca_id"])
                        },
                        ValorCritico = Convert.ToDouble(dr["anu_valor_critico"]),
                        Alerta = new ModelAlerta()
                        {
                            Id = Convert.ToUInt32(dr["ale_id"]),
                            Nombre = dr["ale_nombre"].ToString(),
                            Leyenda = dr["ale_leyenda"].ToString(),
                            FechaCreacion = Convert.ToDateTime(dr["ale_fecha_alta"]),
                            TipoAlerta = new ModelTipoAlerta()
                            {
                                Id = Convert.ToUInt32(dr["tal_id"]),
                                Forma = ServiceShared.GetFormaAlerta(Convert.ToInt32(dr["tal_forma"])),
                                EsGenerica = Convert.ToBoolean(dr["tal_es_generica"]),
                                Color = new ModelColorAlerta()
                                {
                                    CodigoHexadecimal = dr["tal_color"].ToString()
                                }
                            }
                        }
                    }
                }
        };
        items.Add(x);
        return items;
    }
    
}
