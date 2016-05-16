using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klusbeheer_Applicatie
{
    class GereedschapsKist
    {
        private List<Gereedschap> gereedschapsLijst = new List<Gereedschap>();
        public List<Gereedschap> GereedschapsLijst
        {
            get { return gereedschapsLijst; }
        }
        public GereedschapsKist()
        {

        }
        public void VoegToe (Gereedschap gereedschap)
        {
            gereedschapsLijst.Add(gereedschap);
        }
    }
}
