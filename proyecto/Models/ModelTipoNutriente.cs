
namespace Models
{
    public class ModelTipoNutriente
    {
        public ModelTipoNutriente()
        {
        }
        public ushort Id { get; set; }
        public string Nombre { get; set; }
        public string NombreEnum { get; set; }
        public double CaloriasPorGramo { get; set; }
    }
}