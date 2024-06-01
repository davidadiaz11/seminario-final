
/// <summary>
/// Descripción breve de ModelIngrediente
/// </summary>
public class ModelColorAlerta
{
    public ModelColorAlerta()
    {
    }
    public ModelColorAlerta(uint pId, string pNombre)
    {
        Id = pId;
        Nombre = pNombre;
    }
    public ModelColorAlerta(string pCodigoHexadecimal)
    {
        CodigoHexadecimal = pCodigoHexadecimal;
    }

    public uint Id { get; set; }
    public string Nombre { get; set; }
    public string CodigoHexadecimal { get; set; }

}