using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;

namespace Mycraft
{
    public class ProfielDatabase
    {
        public bool Login(string mail, string wachtwoord)
        {
            bool check = false;

            string query = "SELECT Email ";
            query += "FROM PROFIEL ";
            query += "WHERE Email = :mail AND Wachtwoord = :wachtwoord";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":mail", mail));
            parameters.Add(new OracleParameter(":wachtwoord", wachtwoord));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            if (odr != null)
            {
                if (odr.Read())
                {
                    check = true;
                    Database.Connection.Close();
                    return check;
                }
                else
                {
                    Database.Connection.Close();
                    return check;
                }
            }
            else
            {
                Database.Connection.Close();
                return check;
            }
        }

        public NameValueCollection HaalPersoonsGegevensOp(string mail)
        {
            NameValueCollection persoon;
            string query = "SELECT  Profielnr, Naam, Email, Wachtwoord, Soort_Gebruiker ";
            query += "FROM PROFIEL ";
            query += "WHERE Email = :mail";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":mail", mail));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            persoon = new NameValueCollection();

            if (odr.Read())
            {
                int profielnr = Convert.ToInt32(odr["profielnr"]);
                string naam = Convert.ToString(odr["naam"]);
                string email = Convert.ToString(odr["email"]);
                string soort_gebruiker = Convert.ToString(odr["soort_gebruiker"]);

                persoon.Add("profielnr", Convert.ToString(profielnr));
                persoon.Add("naam", naam);
                persoon.Add("email", email);
                persoon.Add("soort_gebruiker", soort_gebruiker);
                Database.Connection.Close();
                return persoon;
            }
            else
            {
                Database.Connection.Close();
                return null;
            }
        }

        public void RegistreerNieuweGebruiker(int profielnr, string naam, string email, string wachtwoord)
        {
            string query = "INSERT INTO PROFIEL (Profielnr, Naam, Email, Wachtwoord, Soort_Gebruiker) ";
            query += "values (:profielnr, :naam, :email, :wachtwoord, 'Gebruiker')";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":profielnr", profielnr));
            parameters.Add(new OracleParameter(":naam", naam));
            parameters.Add(new OracleParameter(":email", email));
            parameters.Add(new OracleParameter(":wachtwoord", wachtwoord));
            Database.ExecuteInsert(query, parameters);
            Database.Connection.Close();
        }

        public int NieuwProfielnr()
        {
            string query = "SELECT MAX(Profielnr) +1 As profielnr ";
            query += "FROM PROFIEL ";
            List<OracleParameter> parameters = new List<OracleParameter>();
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

        public NameValueCollection HaalProfielGegevensOp(string profielnaam)
        {
            NameValueCollection persoon;
            string query = "SELECT  Profielnr, Naam, Email, Wachtwoord, Soort_Gebruiker ";
            query += "FROM PROFIEL ";
            query += "WHERE Naam = :profielnaam";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":profielnaam", profielnaam));
            OracleDataReader odr = Database.ExecuteQry(query, parameters);

            persoon = new NameValueCollection();

            if (odr.Read())
            {
                int profielnr = Convert.ToInt32(odr["profielnr"]);
                string naam = Convert.ToString(odr["naam"]);
                string email = Convert.ToString(odr["email"]);
                string soort_gebruiker = Convert.ToString(odr["soort_gebruiker"]);

                persoon.Add("profielnr", Convert.ToString(profielnr));
                persoon.Add("naam", naam);
                persoon.Add("email", email);
                persoon.Add("soort_gebruiker", soort_gebruiker);
                Database.Connection.Close();
                return persoon;
            }
            else
            {
                Database.Connection.Close();
                return null;
            }
        }

        public List<NameValueCollection> GeefAllePostsBijProfiel(string profielnaam)
        {
            string query = "SELECT po.postnr, po.datum, po.tekst, po.filelink, pr.profielnr, pr.naam, pr.email, pr.soort_gebruiker ";
            query += "FROM Post po, profiel pr ";
            query += "WHERE po.Profielnr = pr.Profielnr ";
            query += "AND po.profielnr = (SELECT profielnr FROM profiel WHERE naam = :profielnaam) ";
            query += "ORDER BY po.datum DESC";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":profielnaam", profielnaam));
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

        public List<NameValueCollection> HaalAlleTopicsProfielOp(string naamprofiel)
        {
            string query = "SELECT t.Topicnr, t.Naam AS topicnaam, t.Aanmaak_Datum, t.Aantal_bekeken, p.profielnr, p.naam AS profielnaam, p.email, p.soort_gebruiker ";
            query += "FROM topic t, profiel p ";
            query += "WHERE t.profielnr = p.profielnr ";
            query += "AND t.profielnr = (SELECT profielnr FROM profiel WHERE naam = :naamprofiel) ";
            query += "ORDER BY Aanmaak_Datum DESC";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":naamprofiel", naamprofiel));
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

        public void VeranderWachtwoord(string email, string wachtwoord)
        {
            string query = "UPDATE Profiel ";
            query += "SET Wachtwoord = :wachtwoord ";
            query += "WHERE email = :email";
            List<OracleParameter> parameters = new List<OracleParameter>();
            parameters.Add(new OracleParameter(":email", email));
            parameters.Add(new OracleParameter(":wachtwoord", wachtwoord));
            Database.ExecuteInsert(query, parameters);
            Database.Connection.Close();
        }
    }
}