using System;
using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Descripción breve de ModelProducto
/// </summary>
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
    public IEnumerable<ModelIngredienteProducto> IngredientesProducto { get; set; }
    public string IngredientesText { get { return String.Join(", ", IngredientesProducto.Select(x => x.Ingrediente.Nombre).ToList()); } }
    public IEnumerable<ModelNutrienteProducto> NutrientesProducto { get; set; }
    public double ValorEnergetico { get; set; }
    public string NutrientesText { get { return String.Join(", ", NutrientesProducto.Select(x => x.Nutriente.Nombre + ": " + x.Nutriente.CantidadPorPorcion + " g").ToList()); } }
    public uint Porcion { get; set; }
    public ModelTipoPorcion TipoPorcion { get; set; }
    public string PorcionText { get { return Porcion + " (" + TipoPorcion?.Nombre + ")"; } }
    public string Ingredientes { get; set; }
    public IEnumerable<ModelAlerta> Alertas { get; set; }
}