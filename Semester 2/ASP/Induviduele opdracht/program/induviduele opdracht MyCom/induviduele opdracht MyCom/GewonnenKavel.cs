using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class GewonnenKavel:Bieding
    {
        public double EigenWinnendBod { get; set; }
        public string Status { get; set; }

        public GewonnenKavel(double bod, Gebruiker account, Veiling kavel, double eigenWinndenBod, string status) :base(bod, account, kavel)
        {
            EigenWinnendBod = eigenWinndenBod;
            Status = status;
        }
    }
}