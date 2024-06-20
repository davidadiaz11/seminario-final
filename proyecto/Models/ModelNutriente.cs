
using System.Collections.Generic;

namespace Models
{
    public class ModelNutriente
    {
        public ModelNutriente()
        {
        }
        public ModelNutriente(uint pId, string pNombre)
        {
            Id = pId;
            Nombre = pNombre;
        }
        public uint Id { get; set; }
        public string Nombre { get; set; }
        public ModelTipoNutriente TipoNutriente { get; set; }
        public double CantidadPorPorcion { get; set; }
        public List<ModelNutrienteAlerta> NutrientesAlerta { get; set; }

    }
}