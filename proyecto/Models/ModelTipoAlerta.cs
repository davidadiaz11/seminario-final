
namespace Models
{
    public class ModelTipoAlerta
    {
        public ModelTipoAlerta()
        {
        }
        public ModelTipoAlerta(uint pId, string pNombre)
        {
            Id = pId;
            Nombre = pNombre;
        }
        public uint Id { get; set; }
        public string Nombre { get; set; }
        public ModelFormaAlerta Forma { get; set; }
        public ModelColorAlerta Color { get; set; }
        public bool EsGenerica { get; set; }
    }
}