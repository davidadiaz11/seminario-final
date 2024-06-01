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

    public ushort Id { get; set; }
    public string Nombre { get; set; }
    public string Email { get; set; }
    public string Rol { get; set; }
    public List<ModelPerfil> Perfiles { get; set; }

}