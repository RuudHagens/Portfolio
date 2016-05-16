using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace Klusbeheer_Applicatie
{
    [Serializable]
    class HandGereedschap : Gereedschap
    {
        public HandGereedschap (DateTime aankoopDatum, int artikelNummer, string beschrijving, int gewicht, string merk, string naam, Image plaatje, decimal prijs)
            :base(aankoopDatum, artikelNummer, beschrijving, gewicht, merk, naam, plaatje, prijs)
        {

        }
        public override string ToString()
        {
            return string.Format("Artikkelnummer: {0} \nNaam: {1} \nMerk {2} \nPrijs: {3} \nBeschrijving: {4} \nAankoop datum: {5}", this.ArtikelNummer, this.Naam, this.Merk, this.Prijs, this.Beschrijving, this.AankoopDatum.ToShortDateString());
        }
    }
}
