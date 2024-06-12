using System;
using System.Collections.Generic;
using System.Linq;
namespace Models
{
    public class ModelProducto
    {
        public ModelProducto()
        {
        }

        public ModelProducto(uint pId, string pNombre)
        {
            Id = pId;
            Nombre = pNombre;
        }

        public uint Id { get; set; }
        public string Nombre { get; set; }
        public IEnumerable<ModelNutrienteProducto> NutrientesProducto { get; set; }
        public double ValorEnergetico { get { return NutrientesProducto.FirstOrDefault(x => x.Nutriente.Nombre == "Calorías").Nutriente.CantidadPorPorcion; } }
        public string NutrientesText { get { return String.Join(", ", NutrientesProducto.Select(x => x.Nutriente.Nombre + ": " + x.Nutriente.CantidadPorPorcion + " g").ToList()); } }
        public uint Porcion { get; set; }
        public ModelTipoPorcion TipoPorcion { get; set; }
        public string PorcionText { get { return Porcion + " (" + TipoPorcion?.Nombre + ")"; } }
        public string Ingredientes { get; set; }
        public List<ModelNutrienteAlerta> NutrienteAlertas { get; set; }
        public List<ModelAlerta> IngredientesAlertas { get; set; }
    }
}