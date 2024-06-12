using System;
namespace Models
{
    public class Resultado<T>
    {
        public Resultado() { }
        public Resultado(T obj) : this()
        {
            Data = obj;
        }

        public T Data { get; set; }
        public string Errores { get; set; }
        public string Mensaje { get; set; }
        public Exception Exception { get; set; }
        public bool Ok { get { return string.IsNullOrEmpty(Errores); } }
        public void ObtenerError(string message, Exception exception)
        {
            Errores = message;
            this.Exception = exception;
        }
        public void ObtenerError(string message)
        {
            Errores = message;
        }
    }
}