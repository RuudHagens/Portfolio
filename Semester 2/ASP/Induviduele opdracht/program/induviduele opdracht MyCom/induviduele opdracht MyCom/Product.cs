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
        public string Query { get; private set; }

        public Product (string naam, double prijs, string beschrijving, string merk, Category cat, Specificatie spec)
        {
            Naam = naam;
            Prijs = prijs;
            Beschrijving = beschrijving;
            Merk = merk;
            Cat = cat;
            Spec = spec;
        }

        public Product ()
        {

        }

        public string GetProductsByMerk (string merkNaam)
        {
            Query = "SELECT af.afbeelding_url, ar.artikelnr, ar.naam, ar.prijs, ar.beschrijving, ar.merk FROM artikel ar, afbeelding af WHERE ar.artikelnr = af.artikelnr AND ar.Merk ='"+ merkNaam +"'";
            return Query;
        }

        public string ZoekProduct (string ZoekTekst)
        {
            Query = "SELECT af.afbeelding_url, ar.artikelnr, ar.naam, ar.prijs, ar.beschrijving, ar.merk FROM artikel ar, afbeelding af WHERE ar.artikelnr = af.artikelnr AND ar.naam LIKE'%" + ZoekTekst + "%'";
            return Query;
        }
    }
}