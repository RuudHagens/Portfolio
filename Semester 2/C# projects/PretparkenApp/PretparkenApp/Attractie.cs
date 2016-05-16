using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PretparkenApp
{
    class Attractie
    {
        private string naam;
        private int bouwjaar;
        private string type;
        private int minimalelengte;

        public string Naam { get { return naam; } }
        public int Bouwjaar { get { return bouwjaar; } }
        public string Type { get { return type; } }
        public int Minimalelengte { get { return minimalelengte; } }

        public Attractie (string naam, int bouwjaar, string type, int minimalelengte)
        {
            this.naam = naam;
            this.bouwjaar = bouwjaar;
            this.type = type;
            this.minimalelengte = minimalelengte;
        }
    }
}
