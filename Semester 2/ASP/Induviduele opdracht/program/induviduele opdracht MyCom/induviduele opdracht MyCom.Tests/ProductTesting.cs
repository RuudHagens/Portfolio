using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace induviduele_opdracht_MyCom.Tests
{
    [TestClass]
    public class ProductTesting
    {
        Product product;

        [TestInitialize]
        public void initialize()
        {
            product = new Product();
        }

        [TestMethod]
        public void TestGetProductsByMerk()
        {
            product.GetProductsByMerk("asus");
            Assert.AreEqual("SELECT af.afbeelding_url, ar.artikelnr, ar.naam, ar.prijs, ar.beschrijving, ar.merk FROM artikel ar, afbeelding af WHERE ar.artikelnr = af.artikelnr AND ar.Merk ='asus'", product.Query, "De merknaam is niet opgenomen in de sql string");
        }

        [TestMethod]
        public void TestZoekProduct()
        {
            product.ZoekProduct("Chrome");
            Assert.AreEqual("SELECT af.afbeelding_url, ar.artikelnr, ar.naam, ar.prijs, ar.beschrijving, ar.merk FROM artikel ar, afbeelding af WHERE ar.artikelnr = af.artikelnr AND ar.naam LIKE'%Chrome%'", product.Query, "De zoek opdracht is niet correct");
        }
    }
}
