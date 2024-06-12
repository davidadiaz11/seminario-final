using System.Collections.Generic;
using Models;
namespace Services
{
    internal class CalculoPorcentual: ICalculoAlerta
    {
        public List<ModelNutrienteProducto> Calcular(ModelProducto item, ModelNutrienteProducto item2)
        {
            List<ModelNutrienteProducto> listaAlertas = new List<ModelNutrienteProducto>();
            var multiplicador = ServiceTiposNutriente.ObtenerTipoNutrientes(item2.Nutriente.TipoNutriente.Id).CaloriasPorGramo * 100;

            var cantidadPorcentual = (item2.Nutriente.CantidadPorPorcion * multiplicador) / item.ValorEnergetico;

            if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadPorcentual >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadPorcentual;
                item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                listaAlertas.Add(item2);
            }
            else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadPorcentual <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadPorcentual;
                item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                listaAlertas.Add(item2);
            }
            return listaAlertas;
        }
    }
}
