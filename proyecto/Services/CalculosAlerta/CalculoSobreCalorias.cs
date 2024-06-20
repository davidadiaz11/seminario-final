using System.Collections.Generic;
using Models;

namespace Services
{
    internal class CalculoSobreCalorias : ICalculoAlerta
    {
        public List<ModelNutrienteProducto> Calcular(ModelProducto item, ModelNutrienteProducto item2)
        {
            List<ModelNutrienteProducto> listaAlertas = new List<ModelNutrienteProducto>();
            var cantidadCalculada = item2.Nutriente.CantidadPorPorcion / item.ValorEnergetico;

            if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadCalculada >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadCalculada;
                item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                listaAlertas.Add(item2);
            }
            else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadCalculada <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadCalculada;
                item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                listaAlertas.Add(item2);
            }
            return listaAlertas;
        }
    }
}
