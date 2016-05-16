using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Bieding
    {
        public double Bod { get; set; }
        public Gebruiker Account { get; set; }
        public Veiling Kavel { get; set; }

        public Bieding (double bod, Gebruiker account, Veiling kavel)
        {
            Bod = bod;
            Account = account;
            Kavel = kavel;
        }
    }
}