using System;

namespace Models
{
    public class ModelPerfil
    {
        public ModelPerfil()
        {
        }

        public uint Id { get; set; }
        public string Nombre { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public int Edad { get { return FechaNacimiento != null ? (int.Parse(DateTime.UtcNow.AddHours(-3).ToString("yyyyMMdd")) - int.Parse(FechaNacimiento?.ToString("yyyyMMdd"))) / 10000 : 0; } }
        public string IngredientesProhibidos { get; set; }
        public bool EsPrincipal { get; set; }


    }
}