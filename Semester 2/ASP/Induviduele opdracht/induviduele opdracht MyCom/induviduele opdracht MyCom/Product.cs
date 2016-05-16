using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace induviduele_opdracht_MyCom
{
    public class Product
    {
        public string Naam { get; set; }
        public double Prijs { get; set; }
        public string Beschrijving { get; set; }
        public string Merk { get; set; }
        public Category Cat { get; set; }
        public Specificatie Spec { get; set; }

        public Product (string naam, double prijs, string beschrijving, string merk, Category cat, Specificatie spec)
        {
            Naam = naam;
            Prijs = prijs;
            Beschrijving = beschrijving;
            Merk = merk;
            Cat = cat;
            Spec = spec;
        }
    }
}