using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;

namespace Mycraft
{
    public class ForumDatabase
    {

        public List<NameValueCollection> GeefAllePosts()
        {
            string query = "SELECT po.postnr, po.datum, po.tekst, po.filelink, pr.profielnr, pr.naam, pr.email, pr.soort_gebruiker ";
            query += "FROM Post po, profiel pr ";
            query += "WHERE po.Profielnr = pr.Profielnr ";
            query += "ORDER BY po.datum DESC";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter());
            OracleDataReader odr = Database.ExecuteQry(query, parameters);
            List<NameValueCollection> Postlijst = new List<NameValueCollection>();

            while (odr.Read())
            {
                NameValueCollection Posts = new NameValueCollection();

                int postnr = Convert.ToInt32(odr["postnr"]);
                DateTime datum = Convert.ToDateTime(odr["datum"]);
                string tekst = Convert.ToString(odr["tekst"]);
                string filelink = Convert.ToString(odr["filelink"]);
                int profielnr = Convert.ToInt32(odr["profielnr"]);
                string naam = Convert.ToString(odr["naam"]);
                string email = Convert.ToString(odr["email"]);
                string soort_gebruiker = Convert.ToString(odr["soort_gebruiker"]);

                Posts.Add("postnr", Convert.ToString(postnr));
                Posts.Add("datum", datum.ToString("dd-MM-yyyy"));
                Posts.Add("tekst", tekst);
                Posts.Add("filelink", filelink);
                Posts.Add("profielnr", Convert.ToString(profielnr));
                Posts.Add("naam", naam);
                Posts.Add("email", email);
                Posts.Add("soort_gebruiker", soort_gebruiker);

                Postlijst.Add(Posts);
            }
            Database.Connection.Close();
            return Postlijst;
        }

        public List<NameValueCollection> HaalAlleTopicsOp()
        {
            string query = "SELECT t.Topicnr, t.Naam AS topicnaam, t.Aanmaak_Datum, t.Aantal_bekeken, p.profielnr, p.naam AS profielnaam, p.email, p.soort_gebruiker ";
            query += "FROM topic t, profiel p ";
            query += "WHERE t.profielnr = p.profielnr ";
            query += "ORDER BY Aanmaak_Datum DESC";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter());
            OracleDataReader odr = Database.ExecuteQry(query, parameters);
            List<NameValueCollection> Topiclijst = new List<NameValueCollection>();

            while (odr.Read())
            {
                NameValueCollection Topics = new NameValueCollection();

                int topicnr = Convert.ToInt32(odr["topicnr"]);
                string topicnaam = Convert.ToString(odr["topicnaam"]);
                DateTime aanmaakdatum = Convert.ToDateTime(odr["Aanmaak_Datum"]);
                int aantalbekeken = Convert.ToInt32(odr["Aantal_bekeken"]);
                int profielnr = Convert.ToInt32(odr["profielnr"]);
                string profielnaam = Convert.ToString(odr["profielnaam"]);
                string email = Convert.ToString(odr["email"]);
                string soort_gebruiker = Convert.ToString(odr["soort_gebruiker"]);

                Topics.Add("topicnr", Convert.ToString(topicnr));
                Topics.Add("topicnaam", topicnaam);
                Topics.Add("Aanmaak_Datum", Convert.ToString(aanmaakdatum));
                Topics.Add("Aantal_bekeken", Convert.ToString(aantalbekeken));
                Topics.Add("profielnr", Convert.ToString(profielnr));
                Topics.Add("profielnaam", profielnaam);
                Topics.Add("email", email);
                Topics.Add("soort_gebruiker", soort_gebruiker);

                Topiclijst.Add(Topics);
            }
            Database.Connection.Close();
            return Topiclijst;
        }

        public List<NameValueCollection> GeefAllePostsBijTopic(string topicnaam)
        {
            string query = "SELECT po.postnr, po.datum, po.tekst, po.filelink, pr.profielnr, pr.naam, pr.email, pr.soort_gebruiker ";
            query += "FROM Post po, profiel pr ";
            query += "WHERE po.Profielnr = pr.Profielnr ";
            query += "AND po.Topicnr = (SELECT topicnr FROM topic WHERE naam = :topicnaam) ";
            query += "ORDER BY po.datum DESC";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":topicnaam", topicnaam));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);
            List<NameValueCollection> TopicPostlijst = new List<NameValueCollection>();

            while (odr.Read())
            {
                NameValueCollection Posts = new NameValueCollection();

                int postnr = Convert.ToInt32(odr["postnr"]);
                DateTime datum = Convert.ToDateTime(odr["datum"]);
                string tekst = Convert.ToString(odr["tekst"]);
                string filelink = Convert.ToString(odr["filelink"]);
                int profielnr = Convert.ToInt32(odr["profielnr"]);
                string naam = Convert.ToString(odr["naam"]);
                string email = Convert.ToString(odr["email"]);
                string soort_gebruiker = Convert.ToString(odr["soort_gebruiker"]);

                Posts.Add("postnr", Convert.ToString(postnr));
                Posts.Add("datum", datum.ToString("dd-MM-yyyy"));
                Posts.Add("tekst", tekst);
                Posts.Add("filelink", filelink);
                Posts.Add("profielnr", Convert.ToString(profielnr));
                Posts.Add("naam", naam);
                Posts.Add("email", email);
                Posts.Add("soort_gebruiker", soort_gebruiker);

                TopicPostlijst.Add(Posts);
            }
            Database.Connection.Close();
            return TopicPostlijst;
        }

        public void PlaatsPost(int postnr, int profielnr, int topicnr, DateTime datum, string tekst)
        {
            string query = "INSERT INTO POST (Postnr, Profielnr, Topicnr, Datum, Tekst, Filelink) ";
            query += "VALUES (:postnr, :profielnr, :topicnr, :datum, :tekst, null)";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":postnr", postnr));
            parameters.Add(new OracleParameter(":profielnr", profielnr));
            parameters.Add(new OracleParameter(":topicnr", topicnr));
            parameters.Add(new OracleParameter(":datum", datum));
            parameters.Add(new OracleParameter(":tekst", tekst));
            Database.ExecuteInsert(query, parameters);
            Database.Connection.Close();
        }

        public void MaakNieuwTopic(int topicnr, int profielnr, string naam, DateTime aanmaak_Datum)
        {
            string query = "INSERT INTO TOPIC (Topicnr, Profielnr, Naam, Aanmaak_Datum, Aantal_bekeken) ";
            query += "VALUES (:topicnr, :profielnr, :naam, :aanmaak_Datum, 0)";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":topicnr", topicnr));
            parameters.Add(new OracleParameter(":profielnr", profielnr));
            parameters.Add(new OracleParameter(":naam", naam));
            parameters.Add(new OracleParameter(":aanmaak_Datum", aanmaak_Datum));
            Database.ExecuteInsert(query, parameters);
            Database.Connection.Close();
        }

        public int HaalposterIdOp(string naam)
        {
            string query = "SELECT profielnr ";
            query += "FROM Profiel ";
            query += "WHERE naam = :naam";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":naam", naam));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            if (odr.Read())
            {
                int profielnr = Convert.ToInt32(odr["profielnr"]);
                Database.Connection.Close();
                return profielnr;
            }
            else
            {
                Database.Connection.Close();
                return 0;
            }
        }

        public int HaalTopicnrPostOp(string topicnaam)
        {
            string query = "SELECT topicnr ";
            query += "FROM Topic ";
            query += "WHERE naam = :topicnaam";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":topicnaam", topicnaam));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            if (odr.Read())
            {
                int topicnr = Convert.ToInt32(odr["topicnr"]);
                Database.Connection.Close();
                return topicnr;
            }
            else
            {
                Database.Connection.Close();
                return 0;
            }
        }

        public int NieuwPostnr()
        {
            string query = "SELECT MAX(Postnr) +1 As postnr ";
            query += "FROM POST ";
            List<OracleParameter> parameters = new List<OracleParameter>();
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            if (odr.Read())
            {
                int postnr = Convert.ToInt32(odr["postnr"]);
                Database.Connection.Close();
                return postnr;
            }
            else
            {
                Database.Connection.Close();
                return 0;
            }
        }

        public int NieuwTopicnr()
        {
            string query = "SELECT MAX(Topicnr) +1 As topicnr ";
            query += "FROM TOPIC ";
            List<OracleParameter> parameters = new List<OracleParameter>();
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            if (odr.Read())
            {
                int topicnr = Convert.ToInt32(odr["topicnr"]);
                Database.Connection.Close();
                return topicnr;
            }
            else
            {
                Database.Connection.Close();
                return 0;
            }
        }

        public void TelViewsOp(string topicnaam)
        {
            string query = "UPDATE TOPIC ";
            query += "SET Aantal_bekeken = Aantal_bekeken+1 ";
            query += "WHERE naam = :topicnaam";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":topicnaam", topicnaam));
            Database.ExecuteInsert(query, parameters);
            Database.Connection.Close();
        }

        public int TelAantalPostsTopic(string topicnaam)
        {
            string query = "SELECT COUNT(p.topicnr)AS aantalposts ";
            query += "FROM POST p, TOPIC t ";
            query += "WHERE t.topicnr = p.topicnr ";
            query += "AND t.naam = :topicnaam ";
            query += "GROUP BY t.topicnr ";
            query += "ORDER BY t.aanmaak_datum ";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":topicnaam", topicnaam));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            if (odr.Read())
            {
                if (odr["aantalposts"] == null)
                {
                    Database.Connection.Close();
                    return 0;
                }
                else
                {
                    int aantalposts = Convert.ToInt32(odr["aantalposts"]);
                    Database.Connection.Close();
                    return aantalposts;
                }
            }
            else
            {
                Database.Connection.Close();
                return 0;
            }
        }

        public List<NameValueCollection> ZoekTopics(string topicnaam)
        {
            string query = "SELECT Naam ";
            query += "FROM topic ";
            query += "WHERE naam LIKE '%"+topicnaam+"%'";
            List<OracleParameter> parameters = new List<OracleParameter>();
            OracleDataReader odr = Database.ExecuteQry(query, parameters);
            List<NameValueCollection> GevondenTopiclijst = new List<NameValueCollection>();

            while (odr.Read())
            {
                NameValueCollection GevondenTopic = new NameValueCollection();

                string naam = Convert.ToString(odr["naam"]);

                GevondenTopic.Add("naam", naam);

                GevondenTopiclijst.Add(GevondenTopic);
            }
            Database.Connection.Close();
            return GevondenTopiclijst;
        }

        public List<NameValueCollection> ZoekProfielen(string profielnaam)
        {
            string query = "SELECT Naam ";
            query += "FROM profiel ";
            query += "WHERE naam LIKE '%"+ profielnaam +"%'";
            List<OracleParameter> parameters = new List<OracleParameter>();
            OracleDataReader odr = Database.ExecuteQry(query, parameters);
            List<NameValueCollection> GevondenProfiellijst = new List<NameValueCollection>();

            while (odr.Read())
            {
                NameValueCollection GevondenProfiel = new NameValueCollection();

                string naam = Convert.ToString(odr["naam"]);

                GevondenProfiel.Add("naam", naam);

                GevondenProfiellijst.Add(GevondenProfiel);
            }
            Database.Connection.Close();
            return GevondenProfiellijst;
        }
    }
}