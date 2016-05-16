using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PretparkenApp
{
    class Pretpark
    {
        private string naam;
        private List<Attractie> atracties;
        private int aantalbezoekers;
        private double toegangsprijs;

        public string Naam { get { return naam; } }
        public List<Attractie> Atracties { get { return atracties; } }
        public int Aantalbezoekers { get { return aantalbezoekers; } set { aantalbezoekers = value; } }
        public double Toegangsprijs { get { return toegangsprijs; } }

        public Pretpark (string naam,  double toegangsprijs)
        {
            this.naam = naam;
            this.toegangsprijs = toegangsprijs;
            this.aantalbezoekers = 0;
            atracties = new List<Attractie>();
        }

        public bool VoegAttractieToe(Attractie atractie)
        {
            foreach (Attractie a in atracties)
            {
                if (a.Naam == atractie.Naam)
                {
                    System.Windows.Forms.MessageBox.Show("de atratie is al in het park aanwezig");
                    return false;
                }
            }
            atracties.Add(atractie);
            return true;
        }

        public Attractie GetAtractieByType(string type)
        {
            foreach (Attractie a in atracties)
            {
                if (a.Type == type)
                {
                    return a;
                }
            }
            return null;
        }

        public Attractie GetAtractieByLengte(int lengte)
        {
            foreach (Attractie a in atracties)
            {
                if (lengte >= a.Minimalelengte)
                {
                    return a;
                }
            }
            return null;
        }

        public double BerekenInkomstenToegang(int aantalbezoekers)
        {
            double inkomsten;
            inkomsten = this.Toegangsprijs * aantalbezoekers;
            return inkomsten;
        }
    }
}
