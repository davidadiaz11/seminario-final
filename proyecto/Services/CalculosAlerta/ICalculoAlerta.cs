using System.Collections.Generic;
using Models;

namespace Services
{
    internal interface ICalculoAlerta
    {
        List<ModelNutrienteProducto> Calcular(ModelProducto producto, ModelNutrienteProducto nutrienteProducto);
    }
}
