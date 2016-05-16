using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klusbeheer_Applicatie
{
    class SorteerPrijsMerkComparer : IComparer<Gereedschap>
    {
        public int Compare(Gereedschap g1, Gereedschap g2) // Vergelijk 2 gereedschappen; als de prijs hetzelfde is dan vergelijk op merk of anders return de laagste prijs.
        {
            if (g1.Prijs == g2.Prijs) return g1.Merk.CompareTo(g2.Merk);
            return g1.Prijs.CompareTo(g2.Prijs);
        }
    }
}
