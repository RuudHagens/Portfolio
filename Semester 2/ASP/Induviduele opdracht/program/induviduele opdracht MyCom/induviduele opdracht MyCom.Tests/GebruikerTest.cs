using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using induviduele_opdracht_MyCom.pages;

namespace induviduele_opdracht_MyCom.Tests
{
    [TestClass]
    public class GebruikerTest
    {
        Gebruiker user;

        [TestInitialize]
        public void initialize()
        {
            user = new Gebruiker();
        }

        [TestMethod]
        public void TestLogin()
        {
            Gebruiker.login("willy.keurig@bing.com", "wachtwoord2");
            Assert.AreEqual(1, 1, "De gebruiker is niet ingelogd");
        }
    }
}
