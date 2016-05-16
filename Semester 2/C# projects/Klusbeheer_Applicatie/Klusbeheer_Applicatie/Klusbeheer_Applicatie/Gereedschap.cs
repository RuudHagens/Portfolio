using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace Klusbeheer_Applicatie
{
    [Serializable]
    class Gereedschap : IComparable<Gereedschap>
    {
        private DateTime aankoopDatum;
        private int artikelNummer;
        private string beschrijving;
        private int gewicht;
        private string merk;
        private string naam;
        private Image plaatje;
        private decimal prijs;

        public int MyProperty { get; set; }

        public DateTime AankoopDatum
        {
            get { return aankoopDatum; }
        }
        public int ArtikelNummer
        {
            get { return artikelNummer; }
        }
        public string Beschrijving
        {
            get { return beschrijving; }
        }
        public int Gewicht
        {
            get { return gewicht; }
        }
        public string Merk
        {
            get { return merk; }
        }
        public string Naam
        {
            get { return naam; }
        }
        public decimal Prijs
        {
            get { return prijs; }
        }

        public Gereedschap(DateTime aankoopDatum, int artikelNummer, string beschrijving, int gewicht, string merk, string naam, Image plaatje, decimal prijs)
        {
            this.aankoopDatum = aankoopDatum;
            this.artikelNummer = artikelNummer;
            this.beschrijving = beschrijving;
            this.gewicht = gewicht;
            this.merk = merk;
            this.naam = naam;
            this.plaatje = plaatje;
            this.prijs = prijs;
        }
        public int CompareTo(Gereedschap anderGereedschap)
        {
            return this.AankoopDatum.CompareTo(anderGereedschap.AankoopDatum);
        }
    }
}
