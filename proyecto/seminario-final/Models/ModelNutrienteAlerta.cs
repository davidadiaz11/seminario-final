public class ModelNutrienteAlerta
{
    public ModelNutrienteAlerta()
    {
    }
    public uint Id { get; set; }
    public ModelAlerta Alerta { get; set; }
    public double ValorCritico { get; set; }
    public ModelTipoCalculo TipoCalculo { get; set; }

}