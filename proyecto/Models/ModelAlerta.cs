
using System;

namespace Models
{
    public class ModelAlerta
    {
        public ModelAlerta()
        {
        }
        public ModelAlerta(uint pId, string pNombre)
        {
            Id = pId;
            Nombre = pNombre;
        }
        public uint Id { get; set; }
        public string Nombre { get; set; }
        public string Leyenda { get; set; }
        public ModelTipoAlerta TipoAlerta { get; set; }
        public ModelPerfil Perfil { get; set; }
        public DateTime FechaCreacion { get; set; }

    }
}