
/// <summary>
/// Descripción breve de ModelIngrediente
/// </summary>
public class ModelFormaAlerta
{
    public ModelFormaAlerta()
    {
    }
    public ModelFormaAlerta(uint pId, string pNombre)
    {
        Id = pId;
        Nombre = pNombre;
    }
    public ModelFormaAlerta(uint pId)
    {
        Id = pId;
    }

    public uint Id { get; set; }
    public string Nombre { get; set; }

}