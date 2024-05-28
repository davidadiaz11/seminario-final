using System.Collections.Generic;

namespace seminario_final.Models
{
    internal interface ICalculoAlerta
    {
        List<ModelNutrienteProducto> Calcular(ModelProducto producto, ModelNutrienteProducto nutrienteProducto);
    }
}
