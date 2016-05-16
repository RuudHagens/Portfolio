using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Data;
using System.Data.OleDb;
using Oracle.DataAccess;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace induviduele_opdracht_MyCom
{
    public class DatabaseConnection
    {
        private static OracleConnection connection;

        public DatabaseConnection()
        {

        }

        //legt connectie met de database op de vpn
        private static OracleConnection Connection()
        {
            if (connection == null)
            {
                connection = new OracleConnection();
                String user = "dbi293765";
                String pw = "jLflRRTS9Q";
                connection.ConnectionString = "User Id=" + user + ";Password=" + pw + ";Data Source=" + "//192.168.15.50:1521/fhictora" + ";";
                connection.Open();
            }
            return connection;
        }

        public static void ExecuteQuery(string query)
        {
 
        }

        //voert query uit en maakt connectie
        public static OracleCommand NewCommand(string query)
        {
            return new OracleCommand(query, Connection());
        }

        //Voert stored procedures uit op de database
        public static OracleCommand StoredProcedureCommand(string storedProcedureName)
        {
            if (connection == null)
            {
                connection = Connection();
            }
 
            OracleCommand command = new OracleCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = storedProcedureName;
 
            return command;
        }

        //voert een nonquery uit
        public static void ExecuteNonQuery(OracleCommand command)
        {
            try
            {
                if (connection.State == ConnectionState.Open)
                {
                    command.ExecuteNonQuery();
                }
                else
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
 
            }
            finally
            {
                connection.Close();
            }
        }
    }
}