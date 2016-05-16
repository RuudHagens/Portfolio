using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mycraft
{
    public class Profiel_abonnement:Abonnement
    {
        private Profiel subscriber;
        private Profiel aboman;

        public Profiel_abonnement(Profiel subscriber, Profiel aboman, int abonnementnr, string abonnementSoort) :base(abonnementnr, abonnementSoort)
        {
            this.subscriber = subscriber;
            this.aboman = aboman;
        }

        public Profiel MyProperty
        {
            get { return subscriber; }
            set { subscriber = value; }
        }

        public Profiel Aboman
        {
            get { return aboman; }
            set { aboman = value; }
        }
    }
}