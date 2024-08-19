
namespace Models
{
    public class ModelNutrienteProducto
    {
        public ModelNutrienteProducto()
        {
        }

        public uint Id { get; set; }
        public uint IdProducto { get; set; }

        public ModelNutriente Nutriente { get; set; }

    }
}