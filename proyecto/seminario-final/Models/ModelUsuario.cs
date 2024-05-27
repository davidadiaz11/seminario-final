using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class ModelUsuario
{
    public ModelUsuario()
    {
    }

    public ModelUsuario(ushort pId, string pNombre, string pEmail)
    {
        id = pId;
        nombre = pNombre;
        email = pEmail;
    }

    public ushort id { get; set; }
    public string pass { get; set; }
    public string nombre { get; set; }
    public string usuario { get; set; }
    public string email { get; set; }
    public List<ModelPerfil> Perfiles { get; set; }

}