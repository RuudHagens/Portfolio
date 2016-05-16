using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace Klusbeheer_Applicatie
{
    [Serializable]
    class Machine : Gereedschap
    {
        private bool accu;
        private DateTime keuringsDatum;
        private string vermogen;

        public bool Accu
        {
            get { return accu; }
        }
        public DateTime KeuringsDatum
        {
            get { return keuringsDatum; }
        }
        public string Vermogen
        {
            get { return vermogen; }
        }

        public Machine(DateTime aankoopDatum, int artikelNummer, string beschrijving, int gewicht, string merk, string naam, Image plaatje, decimal prijs, bool accu, DateTime keuringsDatum, string vermogen)
            :base(aankoopDatum, artikelNummer, beschrijving, gewicht, merk, naam, plaatje, prijs)
        {
            this.accu = accu;
            this.keuringsDatum = keuringsDatum;
            this.vermogen = vermogen;
        }
        public override string ToString()
        {
            return string.Format("Artikkelnummer: {0} \nNaam: {1} \nMerk {2} \nPrijs: {3} \nBeschrijving: {4} \nAankoop datum: {5} \nVermogen: {6} \nAccu: {7} \nDatum keuring: {8}", this.ArtikelNummer, this.Naam, this.Merk, this.Prijs, this.Beschrijving, this.AankoopDatum.ToShortDateString(), this.Vermogen, this.Accu, this.KeuringsDatum.ToShortDateString());
        }
    }
}
