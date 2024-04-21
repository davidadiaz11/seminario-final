
/// <summary>
/// Descripción breve de ModelIngrediente
/// </summary>
public class ModelTipoAlerta
{
    public ModelTipoAlerta()
    {
    }
    public ModelTipoAlerta(uint pId, string pNombre)
    {
        Id = pId;
        Nombre = pNombre;
    }
    public uint Id { get; set; }
    public string Nombre { get; set; }

}