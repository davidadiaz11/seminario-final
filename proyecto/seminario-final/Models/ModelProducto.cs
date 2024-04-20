using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ModelProducto
/// </summary>
public class ModelProducto
{
    public ModelProducto()
    {
    }

    public ModelProducto(ushort pId, string pNombre)
    {
        id = pId;
        nombre = pNombre;
    }

    public ushort id { get; set; }
    public string nombre { get; set; }
    public string usuario { get; set; }

}