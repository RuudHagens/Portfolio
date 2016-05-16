using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.DataAccess;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace induviduele_opdracht_MyCom
{
    public partial class Gebruiker
    {
        //voert stored procedure uit in database om in te kunnen loggen
        public static int login(string email, string password)
        {
            int result = 0;

            OracleCommand cmd = DatabaseConnection.StoredProcedureCommand("Login");
            cmd.Parameters.Add("p_email", OracleDbType.Varchar2).Value = email;
            cmd.Parameters.Add("p_password", OracleDbType.Varchar2).Value = password;
            cmd.Parameters.Add("p_result", OracleDbType.Int32).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("p_cID", OracleDbType.Int32).Direction = ParameterDirection.Output;

            DatabaseConnection.ExecuteNonQuery(cmd);

            result = Convert.ToInt32(cmd.Parameters["p_result"].Value.ToString());
            return result;
        }

        //voert stored procedure uit in database om te registreren
        public static void Register(string email, string gebruiker_naam, string wachtwoord, int telnr, string geb_datum, string adres, string land, string social_account, string klant_soort, string bedrijfsnaam, int ondernemingsnr, string btwnr, string nickname)
        {
            OracleCommand cmd = DatabaseConnection.StoredProcedureCommand("createUser");
            cmd.Parameters.Add("p_email", OracleDbType.Varchar2).Value = email;
            cmd.Parameters.Add("p_gebruiker_naam", OracleDbType.Varchar2).Value = gebruiker_naam;
            cmd.Parameters.Add("p_wachtwoord", OracleDbType.Varchar2).Value = wachtwoord;
            cmd.Parameters.Add("p_telnr", OracleDbType.Int32).Value = telnr;
            cmd.Parameters.Add("p_geb_datum", OracleDbType.Varchar2).Value = geb_datum;
            cmd.Parameters.Add("p_adres", OracleDbType.Varchar2).Value = adres;
            cmd.Parameters.Add("p_land", OracleDbType.Varchar2).Value = land;
            cmd.Parameters.Add("p_social_account", OracleDbType.Varchar2).Value = social_account;
            cmd.Parameters.Add("p_klant_soort", OracleDbType.Varchar2).Value = klant_soort;
            cmd.Parameters.Add("p_bedrijfsnaam", OracleDbType.Varchar2).Value = bedrijfsnaam;
            cmd.Parameters.Add("p_ondernemingsnr", OracleDbType.Int32).Value = ondernemingsnr;
            cmd.Parameters.Add("p_btwnr", OracleDbType.Varchar2).Value = btwnr;
            cmd.Parameters.Add("p_nickname", OracleDbType.Varchar2).Value = nickname;

            DatabaseConnection.ExecuteNonQuery(cmd);
        }
        public Gebruiker()
        { 

}
    }
}