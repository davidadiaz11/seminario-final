public class ModelNutrienteAlerta
{
    public ModelNutrienteAlerta()
    {
    }
    public uint Id { get; set; }
    public ModelAlerta Alerta { get; set; }
    public double ValorCritico { get; set; }
    public double ValorReal { get; set; }
    public double ValorDiferencial { get; set; }
    public ModelTipoCalculo TipoCalculo { get; set; }
    public string Operador { get; set; }

}