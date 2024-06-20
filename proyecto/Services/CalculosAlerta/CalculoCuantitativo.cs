using System.Collections.Generic;
using Models;

namespace Services
{
    internal class CalculoCuantitativo : ICalculoAlerta
    {
        public List<ModelNutrienteProducto> Calcular(ModelProducto item, ModelNutrienteProducto item2)
        {
            List<ModelNutrienteProducto> listaAlertas = new List<ModelNutrienteProducto>();
            var multiplicador = 100 / item.Porcion;
            var cantidadX100 = item2.Nutriente.CantidadPorPorcion * multiplicador;
            if (item2.Nutriente.NutrientesAlerta[0].Operador == ">" && cantidadX100 >= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadX100;
                item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;

                listaAlertas.Add(item2);
            }
            else if (item2.Nutriente.NutrientesAlerta[0].Operador == "<" && cantidadX100 <= item2.Nutriente.NutrientesAlerta[0].ValorCritico)
            {
                item2.Nutriente.NutrientesAlerta[0].ValorReal = cantidadX100;
                item2.Nutriente.NutrientesAlerta[0].ValorDiferencial = (item2.Nutriente.NutrientesAlerta[0].ValorReal - item2.Nutriente.NutrientesAlerta[0].ValorCritico) / item2.Nutriente.NutrientesAlerta[0].ValorCritico * 100;
                listaAlertas.Add(item2);
            }
            return listaAlertas;
        }
    }
}
