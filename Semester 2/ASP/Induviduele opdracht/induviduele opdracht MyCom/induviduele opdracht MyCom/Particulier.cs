using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Particulier:Gebruiker
    {
        public string Nickname { get; set; }

        public Particulier(string user_ID, string email, string naam, string telnr, DateTime geb_Datum, string adres, string land, string social_Account, string nickname) :base (user_ID, email, naam, telnr, geb_Datum, adres, land, social_Account)
        {
            Nickname = nickname;
        }
    }
}