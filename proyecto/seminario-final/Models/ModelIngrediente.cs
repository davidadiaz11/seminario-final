
/// <summary>
/// Descripción breve de ModelIngrediente
/// </summary>
public class ModelIngrediente
{
    public ModelIngrediente()
    {
    }
    public ModelIngrediente(uint pId, string pNombre)
    {
        Id = pId;
        Nombre = pNombre;
    }
    public uint Id { get; set; }
    public string Nombre { get; set; }

}