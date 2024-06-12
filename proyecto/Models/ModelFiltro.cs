namespace Models
{
    public class ModelFiltro
    {
        public ModelFiltro()
        {
            signo = "=@";
        }

        public ModelFiltro(string filtro, int valor)
        {
            signo = "=@";
            this.filtro = filtro;
            this.valor = valor;
        }
        public string filtro { get; set; }
        public string fecha_inicio { get; set; }
        public string fecha_fin { get; set; }
        public string signo { get; set; }
        public int valor { get; set; }
    }
}
