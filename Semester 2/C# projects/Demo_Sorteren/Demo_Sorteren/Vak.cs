using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo_Sorteren
{
    public class Vak : IComparable<Vak>
    {
        private string omschrijving;
        private int aantalStudiepunten;
        private int studieJaar;

        public string Omschrijving { get { return omschrijving; } }
        public int AantalStudiepunten { get { return aantalStudiepunten; } }
        public int StudieJaar { get { return studieJaar; } }

        public Vak(string omschrijving, int aantalStudiepunten, int studieJaar)
        {
            this.omschrijving = omschrijving;
            this.aantalStudiepunten = aantalStudiepunten;
            this.studieJaar = studieJaar;
        }

        public int CompareTo(Vak anderVak)
        {
            if (this.aantalStudiepunten > anderVak.aantalStudiepunten) return 1;
            else if (this.aantalStudiepunten < anderVak.aantalStudiepunten) return -1;
            else return 0;
        }

        public override string ToString()
        {
            return "Vak: " + omschrijving + " - Aantal studiepunten: " + aantalStudiepunten + " - Jaar: " + studieJaar; 
        }
    }
}
