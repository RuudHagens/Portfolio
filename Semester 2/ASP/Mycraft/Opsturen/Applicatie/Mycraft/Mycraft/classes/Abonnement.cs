using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mycraft
{
    public abstract class Abonnement
    {
        private int abonnementnr;
        private string abonnementSoort;

        public Abonnement(int abonnementnr, string abonnementSoort)
        {
            this.abonnementnr = abonnementnr;
            this.abonnementSoort = abonnementSoort;
        }

        public int Abonnementnr
        {
            get { return abonnementnr; }
            set { abonnementnr = value; }
        }

        public string AbonnementSoort
        {
            get { return abonnementSoort; }
            set { abonnementSoort = value; }
        }
    }
}
