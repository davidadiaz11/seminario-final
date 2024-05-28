using System.Collections.Generic;

namespace seminario_final.Models
{
    internal class CalculoSobreCalorias : ICalculoAlerta
    {
        public List<ModelNutrienteProducto> Calcular(ModelProducto item, ModelNutrienteProducto item2)
        {
            List<ModelNutrienteProducto> listaAlertas = new List<ModelNutrienteProducto>();
            var cantidadCalculada = item2.Nutriente.CantidadPorPorcion / item.ValorEnergetico;

            if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadCalculada >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                listaAlertas.Add(item2);
            }
            else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadCalculada <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                listaAlertas.Add(item2);
            }
            return listaAlertas;
        }
    }
}
