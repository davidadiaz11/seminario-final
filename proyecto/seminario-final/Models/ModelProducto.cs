using System.Collections.Generic;

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
    public IEnumerable<ModelIngrediente> Ingredientes { get; set; }
    public IEnumerable<ModelNutriente> Nutrientes { get; set; }
    public string Porcion { get; set; }
    public ModelTipoPorcion TipoPorcion { get; set; }
    public IEnumerable<ModelAlerta> Alertas { get; set; }
}