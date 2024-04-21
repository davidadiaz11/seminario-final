
/// <summary>
/// Descripción breve de ModelIngrediente
/// </summary>
public class ModelTipoPorcion
{
    public ModelTipoPorcion()
    {
    }
    public ModelTipoPorcion(uint pId, string pNombre)
    {
        Id = pId;
        Nombre = pNombre;
    }
    public uint Id { get; set; }
    public string Nombre { get; set; }

}