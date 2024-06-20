using System.Collections.Generic;

namespace Models
{
    public class ModelUsuario
    {
        public ModelUsuario()
        {
        }

        public ushort Id { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Contrasena { get; set; }
        public string Rol { get; set; }
        public List<ModelPerfil> Perfiles { get; set; }

    }
}