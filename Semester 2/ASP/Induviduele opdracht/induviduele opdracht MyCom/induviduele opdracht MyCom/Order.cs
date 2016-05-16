using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Order
    {
        public int OrderNr { get; set; }
        public int Aantal { get; set; }
        public double BetaaldBedrag { get; set; }
        public string Status { get; set; }
        public DateTime Datum { get; set; }
        public Product Item { get; set; }
        public Gebruiker User { get; set; }

        public Order (int orderNr, int aantal, double betaaldBedrag, string status, DateTime datum, Product item, Gebruiker user)
        {
            OrderNr = orderNr;
            Aantal = aantal;
            BetaaldBedrag = betaaldBedrag;
            Status = status;
            Datum = datum;
            Item = item;
            User = user;
        }
    }
}