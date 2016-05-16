using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mycraft
{
    public class Topic_Abonnement:Abonnement
    {
        private int topicAbonnementNr;

        public Topic_Abonnement(int topicAbonnementNr, int abonnementnr, string abonnementSoort) : base(abonnementnr, abonnementSoort)
        {
            this.topicAbonnementNr = topicAbonnementNr;
        }

        public int TopicAbonnementNr
        {
            get { return topicAbonnementNr; }
            set { topicAbonnementNr = value; }
        }
        
    }
}