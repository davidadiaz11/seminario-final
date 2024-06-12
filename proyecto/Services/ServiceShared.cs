using System;
using System.Collections.Generic;
using System.Linq;
using Models;

namespace Services
{
    public class ServiceShared
    {
        public ServiceShared()
        {
        }

        static List<ModelColorAlerta> colores = new List<ModelColorAlerta>()
    {
        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.NEGRO.ToString(),
            CodigoHexadecimal = "000000"
        },

        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.AZUL.ToString(),
            CodigoHexadecimal = "094293"
        },

        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.VERDE.ToString(),
            CodigoHexadecimal = "7fe757"
        },

        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.ROJO.ToString(),
            CodigoHexadecimal = "CE2A23"
        },

        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.NARANJA.ToString(),
            CodigoHexadecimal = "E3AB58"
        },


        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.AMARILLO.ToString(),
            CodigoHexadecimal = "FFFF00"
        },

        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.AQUA.ToString(),
            CodigoHexadecimal = "00FFFF"
        },

        new ModelColorAlerta()
        {
            Nombre = ColoresEnum.VIOLETA.ToString(),
            CodigoHexadecimal = "EE82EE"
        }
    };

        static List<ModelFormaAlerta> formas = new List<ModelFormaAlerta>()
    {
        new ModelFormaAlerta()
        {
            Id = 1,
            Nombre = "HEXAGONO"
        },

        new ModelFormaAlerta()
        {
            Id = 2,
            Nombre = "RECTANGULO",
        },

        new ModelFormaAlerta()
        {
            Id = 3,
            Nombre = "CIRCULO"
        },

    };

        public static List<ModelColorAlerta> GetColores()
        {
            return colores;
        }
        public static List<ModelFormaAlerta> GetFormas()
        {
            return formas;
        }
        public static ModelColorAlerta GetColorAlerta(string nombreColor)
        {
            return colores.First(x => x.Nombre == nombreColor.ToUpper());
        }
        public static ModelFormaAlerta GetFormaAlerta(string nombreForma)
        {
            return formas.First(x => x.Nombre == nombreForma.ToUpper());
        }
        public static ModelFormaAlerta GetFormaAlerta(int idForma)
        {
            return formas.First(x => x.Id == idForma);
        }

        public static Resultado<bool> ValidarQueryParam(string idQueryParam)
        {
            Resultado<bool> resultado = new Resultado<bool>(false);
            try
            {
                if (idQueryParam == null)
                {
                    resultado.Data = true;
                    return resultado;
                }
                if (idQueryParam == "")
                {
                    throw new Exception();
                }
                uint parametro = Convert.ToUInt32(idQueryParam);
                if (parametro < 0)
                {
                    throw new Exception();
                }
            }
            catch (Exception ex)
            {
                resultado.ObtenerError("Parámetro incorrecto. Intente ingresar nuevamente desde el listado.");
                return resultado;
            }
            resultado.Data = true;
            return resultado;
        }

        public static Resultado<bool> ValidarPermisos()
        {
            Resultado<bool> resultado = new Resultado<bool>(false);
            ModelUsuario usuarioActual = ServiceUsuario.ObtenerUsuario();
            resultado.Data = usuarioActual.Rol == RolesEnum.Administrador.ToString();
            return resultado;
        }
    }
}
