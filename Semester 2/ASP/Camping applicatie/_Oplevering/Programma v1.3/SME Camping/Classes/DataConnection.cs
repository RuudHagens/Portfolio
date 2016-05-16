using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.DataAccess;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace SME_Camping.Classes
{
    public class DataConnection
    {
        private OracleConnection connection;
        private static DataConnection instance;

        protected DataConnection()
        {
            string connectionstring;
            String user = "dbi291696"; // zie email voor logingegevens
            String pw = "ikYcyPxmWA";
            connectionstring = "User Id=" + user + ";Password=" + pw + ";Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.15.50)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=fhictora)));";
            ;
            connection = new OracleConnection(connectionstring);
        }

        public static DataConnection GetInstance()
        {
            if(instance == null)
            {
                instance = new DataConnection();
            }
            return instance;
        }

        public User LogIn(String userName, String password)
        {
            String dbUsername;
            string dbEmail;
            int dbType;
            User loggedInUser = null;
            OracleCommand command = new OracleCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "fillcursor";

            command.Parameters.Add("username", OracleDbType.Varchar2).Value = userName;
            command.Parameters.Add("password", OracleDbType.Varchar2).Value = password;
            command.Parameters.Add("t", OracleDbType.Varchar2, 100).Direction = ParameterDirection.Output;
            command.Parameters.Add("t1", OracleDbType.Varchar2, 100).Direction = ParameterDirection.Output;
            command.Parameters.Add("t2", OracleDbType.Int32).Direction = ParameterDirection.Output;

            connection.Open();
            command.ExecuteNonQuery();

            dbUsername = Convert.ToString(command.Parameters["t"].Value.ToString());
            dbEmail = Convert.ToString(command.Parameters["t1"].Value.ToString());
            dbType = Convert.ToInt32(command.Parameters["t2"].Value.ToString());
            loggedInUser = new User(dbUsername, dbEmail, dbType);
           
            connection.Close();
            return loggedInUser;
        }

        public List<Item> GetAllItems()
        {
            List<Item> allItems = new List<Item>();

            OracleCommand command = new OracleCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "getProducts";

            OracleParameter itemCursor = new OracleParameter();
            itemCursor.OracleDbType = OracleDbType.RefCursor;
            itemCursor.ParameterName = "productCursor";
            itemCursor.Direction = ParameterDirection.Output;
            command.Parameters.Add(itemCursor);

            try
            {
                connection.Open();
                OracleDataReader r = command.ExecuteReader();

                while(r.Read())
                {
                    allItems.Add(new Item(Convert.ToInt32(r["ID"]), r["merk"].ToString(), r["serie"].ToString(), Convert.ToDecimal(r["prijs"])));
                }
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
            return allItems;
        }

        public List<Item_Edition> GetAllItemEditions()
        {
            List<Item_Edition> allItemEditions = new List<Item_Edition>();

            OracleCommand command = new OracleCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "getProductEditions";

            OracleParameter itemCursor = new OracleParameter();
            itemCursor.OracleDbType = OracleDbType.RefCursor;
            itemCursor.ParameterName = "productCursor";
            itemCursor.Direction = ParameterDirection.Output;
            command.Parameters.Add(itemCursor);

            try
            {
                connection.Open();
                OracleDataReader r = command.ExecuteReader();

                while (r.Read())
                {
                    allItemEditions.Add(new Item_Edition(Convert.ToInt32(r["product_id"]), Convert.ToInt32(r["ID"]), ""));
                }
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
            return allItemEditions;
        }

        public List<Specification> GetSpecifications()
        {
            List<Specification> allSpecs = new List<Specification>();

            OracleCommand command = new OracleCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "getSpecs";

            OracleParameter specificationCursor = new OracleParameter();
            specificationCursor.OracleDbType = OracleDbType.RefCursor;
            specificationCursor.ParameterName = "specCursor";
            specificationCursor.Direction = ParameterDirection.Output;
            command.Parameters.Add(specificationCursor);

            try
            {
                connection.Open();
                OracleDataReader r = command.ExecuteReader();

                while (r.Read())
                {
                    allSpecs.Add(new Specification(Convert.ToInt32(r["plek_id"]), Convert.ToInt32(r["specificatie_id"]), r["waarde"].ToString()));
                }
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
            return allSpecs;
        }

        public List<Spot> GetFreeSpots()
        {
            List<Spot> freeSpots = new List<Spot>();

            OracleCommand command = new OracleCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "getFreeSpots";

            OracleParameter spotCursor = new OracleParameter();
            spotCursor.OracleDbType = OracleDbType.RefCursor;
            spotCursor.ParameterName = "spotCursor";
            spotCursor.Direction = ParameterDirection.Output;
            command.Parameters.Add(spotCursor);

            try
            {
                connection.Open();
                OracleDataReader r = command.ExecuteReader();

                while(r.Read())
                {
                    freeSpots.Add(new Spot(Convert.ToInt32(r["Nummer"]), 0, ""));
                }
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
            return freeSpots;
        }
    }
}