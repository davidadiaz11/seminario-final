using System;

/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class ModelPerfil
{
    public ModelPerfil()
    {
    }

    public ushort Id { get; set; }
    public string Nombre { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public int Edad { get { return (int.Parse(DateTime.UtcNow.AddHours(-3).ToString("yyyyMMdd")) - int.Parse(FechaNacimiento.ToString("yyyyMMdd"))) / 10000; } }
    public string IngredientesProhibidos { get; set; }
    public bool EsPrincipal { get; set; }


}