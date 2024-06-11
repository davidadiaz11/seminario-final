using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
namespace Services
{
    public class ServiceTiposCalculo
    {
        public ServiceTiposCalculo()
        {
        }
        public static List<ModelTipoCalculo> ObtenerTiposCalculo(uint idNutriente)
        {
            DataTable dt = MySQLRepositoryTiposCalculo.ObtenerTiposCalculo();
            List<ModelTipoCalculo> items = new List<ModelTipoCalculo>();
            foreach (DataRow dr in dt.Rows)
            {
                ModelTipoCalculo x = new ModelTipoCalculo()
                {
                    Id = Convert.ToUInt16(dr["tca_id"]),
                    Nombre = dr["tca_nombre"].ToString(),
                    NombreEnum = dr["tca_nombre_enum"].ToString()
                };
                items.Add(x);
            }

            ModelNutriente nutriente = ServiceNutriente.ObtenerNutriente(idNutriente);
            List<ModelTipoCalculo> tiposCalculoFiltrado = new List<ModelTipoCalculo>()
            {
                items.First(x => x.NombreEnum == TiposCalculoEnum.CALCULO_CUANTITATIVO_100G.ToString())
            };

            if (nutriente.TipoNutriente != null)//mostrar los dos tipos de cálculo
            {
                tiposCalculoFiltrado.Add(items.First(x => x.NombreEnum == TiposCalculoEnum.CALCULO_PORCENTUAL.ToString()));
            }
            else if (nutriente.Nombre == "Sodio")
            {
                tiposCalculoFiltrado.Add(items.First(x => x.NombreEnum == TiposCalculoEnum.CALCULO_SOBRE_CALORIAS.ToString()));
            }

            return tiposCalculoFiltrado;
        }
    }
}
