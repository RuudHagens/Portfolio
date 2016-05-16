namespace Mycraft
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Data;
    using System.Threading.Tasks;
    using Oracle.DataAccess.Client;
    using Oracle.DataAccess.Types;

    internal class Database
    {
        private static string connectionString = "Data Source=//localhost:1521/xe;User Id=system;Password=system;";

        private static OracleConnection conn;

        public static OracleConnection Connection
        {
            get
            {
                if (conn == null)
                {
                    conn = new OracleConnection(connectionString);
                    conn.Open();
                }
                return conn;
            }
        }

        /// <summary>
        /// Voert een query uit
        /// </summary>
        /// <param name="query">Geef hierin de query die uitgevoerd moet worden</param>
        /// <returns>ODReader</returns>
        public static OracleDataReader ExecuteQry(string query, List<OracleParameter> parameters)
        {
            OracleDataReader oDReader;
            //OracleConnection conn = new OracleConnection(connectionString);
            //conn.Open();

            try
            {
                if (Connection.State == ConnectionState.Closed)
                {
                    Connection.Open();
                }
                OracleCommand command = new OracleCommand(query, Connection);

                if (parameters != null)
                {
                    foreach (OracleParameter p in parameters)
                    {
                        command.Parameters.Add(p);
                    }
                }
                oDReader = command.ExecuteReader();

            }
            catch (Exception ex)
            {
                return null;
            }
            //finally
            //{
            //    conn.Close();
            //}
            return oDReader;
        }

        /// <summary>
        /// Voert een stored procedure uit
        /// </summary>
        /// <param name="storedprocedure">Geef hierin de naam van de stored procedure</param>
        /// <returns>OracleCommand</returns>
        public static OracleCommand ExecuteSP(string storedprocedure)
        {
            if (Connection.State == ConnectionState.Closed)
            {
                Connection.Open();
            }
            OracleCommand command = new OracleCommand(storedprocedure, Connection);

            command.CommandType = CommandType.StoredProcedure;

            return command;
        }

        /// <summary>
        /// Voert een Insert, Update of Delete query uit
        /// </summary>
        /// <param name="insert">Insert, Update of Delete Query</param>
        /// <returns>OracleCommand</returns>
        public static void ExecuteInsert(string insert, List<OracleParameter> parameters)
        {
            if (Connection.State == ConnectionState.Closed)
            {
                Connection.Open();
            }
            OracleCommand Cmd = new OracleCommand();
            Cmd.Connection = Connection;
            Cmd.CommandText = insert;
            Cmd.BindByName = true;

            if (parameters != null)
            {
                Cmd.Parameters.AddRange(parameters.ToArray()); //voeg parameters aan de query toe. deze worden op sqlinjectie gefilterd
            }

            try
            {
                Cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            Cmd.Parameters.Clear();
            Cmd.CommandText = "COMMIT"; //commit veranderingen

            try
            {
                Cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message); ;
            }
        }
    }
}