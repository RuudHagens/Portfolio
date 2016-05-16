using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Specificatie
    {

        public string SpecNaam { get; set; }
        public string SpecWaarde { get; set; }
        public string SpecGroep { get; set; }

        public Specificatie (string specNaam, string specWaarde, string specGroep)
        {
            SpecNaam = specNaam;
            SpecWaarde = specWaarde;
            SpecGroep = specGroep;
        }
    }
}