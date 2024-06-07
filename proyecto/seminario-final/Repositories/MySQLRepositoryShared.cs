using System;
public class MySQLRepositoryShared
{
    //private static string cadena = Environment.GetEnvironmentVariable("CONNECTION_STRING_TESIS_TEST");
    private static string cadena = Environment.GetEnvironmentVariable("CONNECTION_STRING_TESIS_LOCAL");
    public static string getConnectionString()
    {
        return cadena;
    }
}
