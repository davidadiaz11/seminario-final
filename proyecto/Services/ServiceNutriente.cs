using System;
using System.Collections.Generic;
using System.Data;
namespace Services
{
    public class ServiceNutriente
    {
        public ServiceNutriente()
        {
        }
        public static List<ModelNutriente> ObtenerNutrientes()
        {
            DataTable dt = MySQLRepositoryNutriente.ObtenerNutrientes();
            List<ModelNutriente> items = new List<ModelNutriente>();
            foreach (DataRow dr in dt.Rows)
            {
                ModelNutriente x = new ModelNutriente()
                {
                    Id = Convert.ToUInt16(dr["nut_id"]),
                    Nombre = dr["nut_nombre"].ToString(),
                    TipoNutriente = dr["nut_tipo_nutriente"] == DBNull.Value ? null : ServiceTiposNutriente.ObtenerTipoNutrientes(Convert.ToUInt16(dr["nut_tipo_nutriente"]))
                };
                items.Add(x);
            }
            return items;
        }

        public static ModelNutriente ObtenerNutriente(uint idNutriente)
        {
            DataTable dt = MySQLRepositoryNutriente.ObtenerNutrientes();
            foreach (DataRow dr in dt.Rows)
            {
                ModelNutriente x = new ModelNutriente()
                {
                    Id = Convert.ToUInt16(dr["nut_id"]),
                    Nombre = dr["nut_nombre"].ToString(),
                    TipoNutriente = dr["nut_tipo_nutriente"] == DBNull.Value ? null : ServiceTiposNutriente.ObtenerTipoNutrientes(Convert.ToUInt16(dr["nut_tipo_nutriente"]))
                };
                if (x.Id == idNutriente)
                {
                    return x;
                }
            }
            return null;
        }

    }
}
