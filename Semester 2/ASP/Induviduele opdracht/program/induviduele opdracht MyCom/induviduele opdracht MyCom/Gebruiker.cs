using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace induviduele_opdracht_MyCom
{
    public partial class Gebruiker
    {
        public string User_ID { get; set; }
        public string Email { get; set; }
        public string Naam { get; set; }
        public string Wachtwoord { get; set; }
        public string Telnr { get; set; }
        public DateTime Geb_Datum { get; set; }
        public string Adres { get; set; }
        public string Land { get; set; }
        public string Social_Account { get; set; }

        public Gebruiker (string user_ID, string email, string naam, string wachtwoord, string telnr, DateTime geb_Datum, string adres, string land, string social_Account)
        {
            User_ID = user_ID;
            Email = email;
            Naam = naam;
            Wachtwoord = wachtwoord;
            Telnr = telnr;
            Geb_Datum = geb_Datum;
            Adres = adres;
            Land = land;
            Social_Account = social_Account;
        }
    }
}