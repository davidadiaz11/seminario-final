using System;
using System.Collections.Generic;
using System.Data;

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
                Nombre = dr["nut_nombre"].ToString()
            };
            items.Add(x);
        }
        return items;
    }

}
