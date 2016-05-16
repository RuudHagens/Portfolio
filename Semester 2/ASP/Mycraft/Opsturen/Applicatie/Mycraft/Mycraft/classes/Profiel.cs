using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mycraft
{
    public class Profiel
    {
        private int profielNr;
        private string naam;
        private string email;
        private string soortGebruiker;

        public Profiel(int profielNr, string naam, string email, string soortGebruiker)
        {
            this.profielNr = profielNr;
            this.naam = naam;
            this.email = email;
            this.soortGebruiker = soortGebruiker;
        }

        public int ProfielNr
        {
            get { return profielNr; }
            set { profielNr = value; }
        }

        public string Naam
        {
            get { return naam; }
            set { naam = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string SoortGebruiker
        {
            get { return soortGebruiker; }
            set { soortGebruiker = value; }
        }
    }
}
