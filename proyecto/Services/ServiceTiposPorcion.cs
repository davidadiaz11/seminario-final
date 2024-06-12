using System;
using System.Collections.Generic;
using System.Data;
using Models;
using Repositories;
namespace Services
{
    public class ServiceTiposPorcion
    {
        public ServiceTiposPorcion()
        {
        }
        public static List<ModelTipoPorcion> ObtenerTiposPorcion()
        {
            DataTable dt = MySQLRepositoryTiposPorcion.ObtenerTiposPorcion();
            List<ModelTipoPorcion> items = new List<ModelTipoPorcion>();
            foreach (DataRow dr in dt.Rows)
            {
                ModelTipoPorcion x = new ModelTipoPorcion()
                {
                    Id = Convert.ToUInt16(dr["tpo_id"]),
                    Nombre = dr["tpo_nombre"].ToString()
                };
                items.Add(x);
            }
            return items;
        }

    }
}
