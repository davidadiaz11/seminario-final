using seminario_final.Models;
namespace Services.Fabrics
{
    internal class CalculoAlertaFabric
    {
        public static ICalculoAlerta ObtenerCalculoAlerta(ModelNutrienteProducto nutrienteProducto)
        {
            if (nutrienteProducto.Nutriente.NutrientesAlerta[0].TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_PORCENTUAL.ToString())
            {
                return new CalculoPorcentual();
            }
            if (nutrienteProducto.Nutriente.NutrientesAlerta[0].TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_CUANTITATIVO_100G.ToString())
            {
                return new CalculoCuantitativo();
            }
            if (nutrienteProducto.Nutriente.NutrientesAlerta[0].TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_SOBRE_CALORIAS.ToString())
            {
                return new CalculoSobreCalorias();
            }
            return null;
        }
    }
}
