using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Review
    {
        public int Score { get; set; }
        public string Beschrijving { get; set; }
        public DateTime Datum { get; set; }
        public Product Item { get; set; }
        public Gebruiker Account { get; set; }

        public Review (int score, string beschrijving, DateTime datum, Product item, Gebruiker account)
        {
            Score = score;
            Beschrijving = beschrijving;
            Datum = datum;
            Item = item;
            Account = account;
        }
    }
}