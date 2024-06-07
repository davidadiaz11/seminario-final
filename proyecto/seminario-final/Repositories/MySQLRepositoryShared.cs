using System;
public class MySQLRepositoryShared
{
    private static string cadena = Environment.GetEnvironmentVariable("CONNECTION_STRING_TESIS_TEST");
    public static string getConnectionString()
    {
        //return cadena;
        return @"server=127.0.0.1;user id=root;database=sem-final-test-0;password=794685789;";
    }
}
