using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klusbeheer_Applicatie
{
    class Adres
    {
        private string huisnummer;
        private string plaats;
        private string straat;

        public string Huisnummer
        {
            get { return huisnummer; }
        }
        public string Plaats
        {
            get { return plaats; }
        }
        public string Straat
        {
            get { return straat; }
        }
        
        public Adres(string huisnummer, string plaats, string straat)
        {
            this.huisnummer = huisnummer;
            this.plaats = plaats;
            this.straat = straat;
        }
    }
}
