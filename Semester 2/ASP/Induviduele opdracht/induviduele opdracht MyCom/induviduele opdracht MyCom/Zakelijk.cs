using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Zakelijk:Gebruiker
    {
        public string Bedrijfsnaam { get; set; }
        public int OndernemingsNr { get; set; }
        public int BtwNr { get; set; }

        public Zakelijk(string user_ID, string email, string naam, string telnr, DateTime geb_Datum, string adres, string land, string social_Account, string bedrijfsnaam, int ondernemingsNr, int btwNr) :base(user_ID, email, naam, telnr, geb_Datum, adres, land, social_Account)
        {
            Bedrijfsnaam = bedrijfsnaam;
            OndernemingsNr = ondernemingsNr;
            BtwNr = btwNr;
        }
    }
}