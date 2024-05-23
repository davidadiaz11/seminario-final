using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;

public class MySQLRepositoryProducto
{
    public MySQLRepositoryProducto()
    {
    }

    static string cadena = MySQLRepositoryShared.getConnectionString();
    public static DataTable ObtenerProductos()
    {


        MySqlConnection cn = new MySqlConnection(cadena);
        DataTable dt = new DataTable();

        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();

            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT pro_id, pro_nombre, pro_porcion, tpo_nombre
                                FROM productos 
                                JOIN tipos_porcion on tpo_id=pro_tpo_id
                                WHERE tpo_fecha_baja is null and pro_fecha_baja is null";

            dt.Load(cmd.ExecuteReader());


        }
        catch (Exception)
        {
            throw;
        }

        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
        return dt;
    }


    public static DataSet ObtenerTodosFiltrados(out int encontrados, List<ModelFiltro> filtros, int inicio, int cant, string columna, string sort, ushort usuario, bool eliminados)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt_detalles = new DataTable();
        DataTable dt_nutrientes = new DataTable();
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();

            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;

            cmd.CommandText = @"SELECT COUNT(pro_id) cant 
                                FROM productos 
                                WHERE ";

            foreach (ModelFiltro filtro in filtros)
            {

                switch (filtro.filtro)
                {
                    case "nombre":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.fecha_inicio));
                        break;
                    case "condicion":
                        cmd.CommandText += "d." + filtro.filtro + " " + filtro.signo + filtro.filtro + " AND ";
                        cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.valor));
                        break;
                    case "doc":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        cmd.Parameters.Add(new MySqlParameter("@" + filtro.filtro, filtro.fecha_inicio));
                        break;
                    default: break;
                }

            }

            if (!eliminados)
                cmd.CommandText += "pro_fecha_baja IS NULL ";
            else
                cmd.CommandText += "pro_fecha_baja IS NOT NULL ";
            cmd.Parameters.Add(new MySqlParameter("@eliminado", eliminados));
            DataTable dtcan = new DataTable();
            dtcan.Load(cmd.ExecuteReader());
            encontrados = Convert.ToInt32(dtcan.Rows[0]["cant"]);

            cmd.CommandText = @"SELECT pro_id, pro_nombre, pro_porcion, tpo_nombre
                                FROM productos 
                                JOIN tipos_porcion on tpo_id=pro_tpo_id
                                
                                WHERE tpo_fecha_baja is null AND ";

            foreach (ModelFiltro filtro in filtros)
            {
                switch (filtro.filtro)
                {
                    case "nombre":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        break;
                    case "condicion":
                        cmd.CommandText += "d." + filtro.filtro + " " + filtro.signo + filtro.filtro + " AND ";
                        break;
                    case "doc":
                        cmd.CommandText += "c." + filtro.filtro + " LIKE '%" + filtro.fecha_inicio + "%' AND ";
                        break;
                    default: break;
                }
            }

            if (!eliminados)
                cmd.CommandText += "pro_fecha_baja IS NULL ";
            else
                cmd.CommandText += "pro_fecha_baja IS NOT NULL ";
            cmd.CommandText += @" ORDER BY " + columna + " " + sort + " LIMIT " + inicio + "," + cant;
            dt.Load(cmd.ExecuteReader());

            List<int> ids = new List<int>();
            string idsString = "";

            foreach (DataRow item in dt.Rows)
            {
                ids.Add(Convert.ToInt32(item["pro_id"]));
                idsString = idsString + "," + item["pro_id"].ToString();
            }
            idsString = idsString.Substring(1, idsString.Length - 1);


            string segundaQuery =
            @"SELECT ipr_pro_id , ing_nombre
                                    from  ingredientes_x_productos
                                JOIN ingredientes on ing_id=ipr_ing_id
                                where ipr_pro_id in (@pro_id) and ipr_fecha_Baja is null and ing_fecha_baja is null;";
            cmd.Parameters.Add(new MySqlParameter("@pro_id", idsString));

            cmd.CommandText = segundaQuery;

            dt_detalles.Load(cmd.ExecuteReader());


            string terceraQuery = @"SELECT npr_pro_id, nut_nombre, NPR_CANTIDAD_POR_PORCION from
                                nutrientes_x_productos
                                join nutrientes on npr_nut_id=nut_id
								LEFT JOIN alertas_x_nutriente on npr_nut_id=anu_nut_id
                                where npr_pro_id in (@pro_id) AND 
                                npr_fecha_baja is null AND anu_fecha_baja is null;";

            cmd.CommandText = terceraQuery;

            dt_nutrientes.Load(cmd.ExecuteReader());

        }
        catch (Exception ex)
        {
            throw;
        }

        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }

        ds.Tables.Add(dt);
        ds.Tables.Add(dt_detalles);
        ds.Tables.Add(dt_nutrientes);
        return ds;
    }

    public static DataSet ObtenerUno(ushort usuario, int idProducto)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        //DataTable dt_detalles = new DataTable();
        DataTable dt_nutrientes = new DataTable();
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT pro_id, pro_nombre, pro_porcion, pro_ingredientes, tpo_nombre
                                FROM productos 
                                JOIN tipos_porcion on tpo_id=pro_tpo_id
                                WHERE tpo_fecha_baja is null AND pro_id=@pro_id and pro_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@pro_id", idProducto));

            dt.Load(cmd.ExecuteReader());
            //string segundaQuery =
            //@"SELECT ipr_pro_id , ing_nombre
            //                        from  ingredientes_x_productos
            //                    JOIN ingredientes on ing_id=ipr_ing_id
            //                    where ipr_pro_id=@pro_id and ipr_fecha_Baja is null and ing_fecha_baja is null;";

            //cmd.CommandText = segundaQuery;
            //dt_detalles.Load(cmd.ExecuteReader());
            string terceraQuery = @"SELECT npr_pro_id, nut_nombre, NPR_CANTIDAD_POR_PORCION from
                                nutrientes_x_productos
                                join nutrientes on npr_nut_id=nut_id
								LEFT JOIN alertas_x_nutriente on npr_nut_id=anu_nut_id
                                where npr_pro_id=@pro_id AND 
                                npr_fecha_baja is null AND anu_fecha_baja is null;";

            cmd.CommandText = terceraQuery;
            dt_nutrientes.Load(cmd.ExecuteReader());
        }
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }

        ds.Tables.Add(dt);
        //ds.Tables.Add(dt_detalles);
        ds.Tables.Add(dt_nutrientes);
        return ds;
    }



    public static bool ModificarProducto(ModelProducto nuevoProducto)
    {
        MySqlConnection cn = new MySqlConnection(cadena);
       
        try
        {
            cn.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = cn;
            cmd.Parameters.Clear();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE productos set pro_nombre=@pro_nombre, pro_porcion=@pro_porcion,
                                pro_tpo_id=@pro_tpo_id
                                WHERE pro_id=@pro_id and pro_fecha_baja IS NULL;";
            cmd.Parameters.Add(new MySqlParameter("@pro_id", nuevoProducto.Id));
            cmd.Parameters.Add(new MySqlParameter("@pro_nombre", nuevoProducto.Nombre));
            cmd.Parameters.Add(new MySqlParameter("@pro_porcion", nuevoProducto.Porcion));
            cmd.Parameters.Add(new MySqlParameter("@pro_tpo_id", nuevoProducto.TipoPorcion.Id));

            cmd.ExecuteNonQuery();

            //ACÁ HAY Q EVALUAR CUÁLES DAR DE BAJA Y CUÁLES DAR DE ALTA

            //foreach (ModelIngredienteProducto ingredienteProducto in nuevoProducto.IngredientesProducto)
            //{
            //    var sssql = "update ingredientes_x_productos set NPR_CANTIDAD_POR_PORCION=@NPR_CANTIDAD_POR_PORCION where npr_id=@npr_id;";
            //    cmd.Parameters.Add(new MySqlParameter("@NPR_CANTIDAD_POR_PORCION", nutriente.Nutriente.CantidadPorPorcion));
            //    cmd.Parameters.Add(new MySqlParameter("@npr_id", nutriente.Id));
            //    cmd.CommandText = sssql;
            //    cmd.ExecuteNonQuery();
            //    cmd.Parameters.Clear();
            //}


            foreach (ModelNutrienteProducto nutriente in nuevoProducto.NutrientesProducto)
            {
                var sssql = "update nutrientes_x_productos set NPR_CANTIDAD_POR_PORCION=@NPR_CANTIDAD_POR_PORCION where npr_id=@npr_id;";
                cmd.Parameters.Add(new MySqlParameter("@NPR_CANTIDAD_POR_PORCION", nutriente.Nutriente.CantidadPorPorcion));
                cmd.Parameters.Add(new MySqlParameter("@npr_id", nutriente.Id));
                cmd.CommandText = sssql;
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
        }
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            if (cn != null && cn.State == ConnectionState.Open)
                cn.Close();
        }
        return true;
    }
}
