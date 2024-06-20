
namespace Models
{
    public class ModelTipoCalculo
    {
        public ModelTipoCalculo()
        {
        }
        public ModelTipoCalculo(uint pId, string pNombre)
        {
            Id = pId;
            Nombre = pNombre;
        }
        public uint Id { get; set; }
        public string Nombre { get; set; }
        public string NombreEnum { get; set; }
    }
}