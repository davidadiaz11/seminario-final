using System.Collections.Generic;
using System.Linq;
using Models;
namespace Services
{
    public class ServiceTiposNutriente
    {
        public ServiceTiposNutriente()
        {
        }

        private static List<ModelTipoNutriente> valores = new List<ModelTipoNutriente>()
    {
        new ModelTipoNutriente()
        {
            Id = 1,
            Nombre = "Grasas",
            NombreEnum = TiposNutrienteEnum.GRASAS.ToString(),
            CaloriasPorGramo = 9
        },
        new ModelTipoNutriente()
        {
            Id = 2,
            Nombre = "Proteínas",
            NombreEnum = TiposNutrienteEnum.PROTEINAS.ToString(),
            CaloriasPorGramo = 4
        },
        new ModelTipoNutriente()
        {
            Id = 3,
            Nombre = "Carbohidratos",
            NombreEnum = TiposNutrienteEnum.CARBOHIDRATOS.ToString(),
            CaloriasPorGramo = 4
        }
    };

        public static List<ModelTipoNutriente> ObtenerTiposNutrientes()
        {
            return valores;
        }
        public static ModelTipoNutriente ObtenerTipoNutrientes(int idTipoNutriente)
        {
            return valores.First(x => x.Id == idTipoNutriente);
        }
        public static ModelTipoNutriente ObtenerTipoNutrientes(string nombreEnum)
        {
            return valores.First(x => x.NombreEnum == nombreEnum);
        }

    }
}
