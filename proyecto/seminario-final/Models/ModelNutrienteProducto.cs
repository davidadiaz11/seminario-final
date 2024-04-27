
/// <summary>
/// Descripción breve de ModelIngrediente
/// </summary>
public class ModelNutrienteProducto
{
    public ModelNutrienteProducto()
    {
    }
    
    public uint Id { get; set; }
    public ModelNutriente Nutriente { get; set; }

}