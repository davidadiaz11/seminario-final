public class ModelNutrienteAlerta
{
    public ModelNutrienteAlerta()
    {
    }
    public uint Id { get; set; }
    public ModelNutriente Nutriente { get; set; }
    public double ValorCritico { get; set; }


}