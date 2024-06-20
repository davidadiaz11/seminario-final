
using System;

namespace Models
{
    public class ModelAnalisis
    {
        public ModelAnalisis()
        {
        }
        public uint Id { get; set; }
        public ModelProducto Producto { get; set; }
        public DateTime Fecha { get; set; }
    }
}