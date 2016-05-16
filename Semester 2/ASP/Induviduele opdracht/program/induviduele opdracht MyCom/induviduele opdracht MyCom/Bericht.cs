using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Bericht
    {
        public string Onderwerp { get; set; }
        public string Tekst { get; set; }
        public Gebruiker Account { get; set; }
        public DateTime DatumTijd { get; set; }
        public bool Gelezen { get; set; }

        public Bericht (string onderwerp, string tekst, Gebruiker account, DateTime datumtijd, bool gelezen)
        {
            Onderwerp = onderwerp;
            Tekst = tekst;
            Account = account;
            DatumTijd = datumtijd;
            Gelezen = gelezen;
        }
    }
}