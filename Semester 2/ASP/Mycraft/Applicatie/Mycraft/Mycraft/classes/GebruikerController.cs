using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Specialized;
using System.Web;

namespace Mycraft
{
    public class GebruikerController
    {
        private ProfielDatabase profieldatabase;
        private List<Post> postlijst;
        private List<Topic> topiclijst;

        public GebruikerController()
        {
            profieldatabase = new ProfielDatabase();
            this.postlijst = new List<Post>();
            this.topiclijst = new List<Topic>();
        }

        public Profiel Login(string mail, string wachtwoord)
        {
            bool inlogGegevens;
            if (string.IsNullOrEmpty(mail) || string.IsNullOrEmpty(wachtwoord))
            {
                throw new Exception("Vul alle velden in!");
            }

            inlogGegevens = this.profieldatabase.Login(mail, wachtwoord);

            if (inlogGegevens)
            {
                NameValueCollection persoonsgegevens = this.profieldatabase.HaalPersoonsGegevensOp(mail);

                int profielnr = Convert.ToInt32(persoonsgegevens["profielnr"]);
                string naam = persoonsgegevens["naam"];
                string email = persoonsgegevens["email"];
                string soort_gebruiker = persoonsgegevens["soort_gebruiker"];

                Profiel persoon = new Profiel (profielnr, naam, email, soort_gebruiker);
                return persoon;
            }
            else
            {
                throw new Exception("Gebruikersnaam of wachtwoord is incorrect!");
            }
        }
        public Profiel RegistreerNieuweGebruiker(string naam, string email, string wachtwoord)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(wachtwoord))
            {
                throw new Exception("Vul alle velden in!");
            }
            profieldatabase.RegistreerNieuweGebruiker(profieldatabase.NieuwProfielnr(), naam, email, wachtwoord);
            Profiel persoon = this.Login(email, wachtwoord);
            return persoon;
        }

        public Profiel HaalProfielGegevensOp(string profielnaam)
        {
            NameValueCollection persoonsgegevens = this.profieldatabase.HaalProfielGegevensOp(profielnaam);

            int profielnr = Convert.ToInt32(persoonsgegevens["profielnr"]);
            string naam = persoonsgegevens["naam"];
            string email = persoonsgegevens["email"];
            string soort_gebruiker = persoonsgegevens["soort_gebruiker"];

            Profiel persoon = new Profiel(profielnr, naam, email, soort_gebruiker);
            return persoon;
        }

        public List<Post> HaalPostProfielOp(string profielnaam)
        {
            this.postlijst.Clear();
            List<NameValueCollection> postlijst = this.profieldatabase.GeefAllePostsBijProfiel(profielnaam);

            foreach (NameValueCollection n in postlijst)
            {
                int postnr = Convert.ToInt32(n["postnr"]);
                DateTime datum = DateTime.Parse(n["datum"]);
                string tekst = n["tekst"];
                string filelink = n["filelink"];
                int profielnr = Convert.ToInt32(n["profielnr"]);
                string naam = n["naam"];
                string email = n["email"];
                string soort_gebruiker = n["soort_gebruiker"];

                Post post = new Post(postnr, tekst, datum, filelink, new Profiel(profielnr, naam, email, soort_gebruiker));
                this.postlijst.Add(post);
            }

            return this.postlijst;
        }

        public List<Topic> HaalTopicProfielOp(string naamprofiel)
        {
            this.topiclijst.Clear();
            List<NameValueCollection> topiclijst = this.profieldatabase.HaalAlleTopicsProfielOp(naamprofiel);

            foreach (NameValueCollection n in topiclijst)
            {
                int topicnr = Convert.ToInt32(n["topicnr"]);
                string topicnaam = n["topicnaam"];
                DateTime aanmaakdatum = DateTime.Parse(n["Aanmaak_Datum"]);
                int aantalbekeken = Convert.ToInt32(n["Aantal_bekeken"]);
                int profielnr = Convert.ToInt32(n["profielnr"]);
                string profielnaam = n["profielnaam"];
                string email = n["email"];
                string soort_gebruiker = n["soort_gebruiker"];

                Topic topic = new Topic(topicnr, topicnaam, aanmaakdatum, aantalbekeken, new Profiel(profielnr, profielnaam, email, soort_gebruiker));
                this.topiclijst.Add(topic);
            }

            return this.topiclijst;
        }

        public void WachtwoordVeranderen(string email, string wachtwoord)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(wachtwoord))
            {
                throw new Exception("Vul alle velden in!");
            }
            profieldatabase.VeranderWachtwoord(email, wachtwoord);
        }
    }
}