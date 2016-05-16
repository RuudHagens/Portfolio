using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class VerlorenKavel:Bieding
    {
        public double WinnendBod { get; set; }
        public double EigenLaatsteBod { get; set; }
        
        public VerlorenKavel(double bod, Gebruiker account, Veiling kavel, double winnendBod, double eigenLaatsteBod) :base(bod, account, kavel)
        {
            WinnendBod = winnendBod;
            EigenLaatsteBod = eigenLaatsteBod;
        }
    }
}