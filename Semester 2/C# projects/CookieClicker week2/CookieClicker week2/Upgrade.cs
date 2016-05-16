using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookieClicker_week2
{
    class Upgrade
    {
        private string naam;
        private int kps;
        private int prijs;
        private int prijsinterval;
        private int aantal;

        public string Naam { get { return naam; } set { naam = value; } }
        public int Kps { get { return kps; } set { kps = value; } }
        public int Prijs { get { return prijs; } set { prijs = value; } }
        public int Prijsinterval { get { return prijsinterval; } set { prijsinterval = value; } }
        public int Aantal { get { return aantal; } set { aantal = value; } }

        public Upgrade(string naam, int kps, int prijs, int prijsinterval)
        {
            Naam = naam;
            Kps = kps;
            Prijs = prijs;
            Prijsinterval = prijsinterval;
        }
    }
}
