using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Specialized;

namespace Mycraft
{
    public class ForumController
    {
        private ForumDatabase forumdatabase;
        private List<Post> postlijst;
        private List<Topic> topiclijst;
        private List<string> LijstGevondenTopics;
        private List<string> LijstGevondenProfielen;

        public ForumController()
        {
            this.forumdatabase = new ForumDatabase();
            this.postlijst = new List<Post>();
            this.topiclijst = new List<Topic>();
            this.LijstGevondenTopics = new List<string>();
            this.LijstGevondenProfielen = new List<string>();
        }

        public List<Post> HaalPostHomepageOp()
        {
            this.postlijst.Clear();
            List<NameValueCollection> postlijst = this.forumdatabase.GeefAllePosts();

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

        public List<Topic> HaalTopicLijstOp()
        {
            this.topiclijst.Clear();
            List<NameValueCollection> topiclijst = this.forumdatabase.HaalAlleTopicsOp();

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

        public List<Post> HaalPostTopicOp(string topicnaam)
        {
            this.postlijst.Clear();
            List<NameValueCollection> postlijst = this.forumdatabase.GeefAllePostsBijTopic(topicnaam);

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

        public void PlaatsPost(string tekst, string topicnaam)
        {
            if (string.IsNullOrEmpty(tekst))
            {
                throw new Exception("Vul alle velden in!");
            }
            DateTime vandaag = DateTime.Today;
            forumdatabase.PlaatsPost(forumdatabase.NieuwPostnr(), forumdatabase.HaalposterIdOp(Loginpage.Profiel.Naam), forumdatabase.HaalTopicnrPostOp(topicnaam), vandaag, tekst);
        }

        public void MaakTopic(string naam)
        {
            if (string.IsNullOrEmpty(naam))
            {
                throw new Exception("Vul alle velden in!");
            }
            DateTime vandaag = DateTime.Today;
            forumdatabase.MaakNieuwTopic(forumdatabase.NieuwTopicnr(), forumdatabase.HaalposterIdOp(Loginpage.Profiel.Naam), naam, vandaag);
        }

        public void AddView(string topicnaam)
        {
            forumdatabase.TelViewsOp(topicnaam);
        }

        public int TelPostsPerTopic(string topicnaam)
        {
            int aantal = forumdatabase.TelAantalPostsTopic(topicnaam);
            return aantal;
        }

        public List<string> Zoektopics(string topicnaam)
        {
            List<NameValueCollection> Gevondentopics = this.forumdatabase.ZoekTopics(topicnaam);
            foreach (NameValueCollection n in Gevondentopics)
            {
                string naam = n["naam"];
                this.LijstGevondenTopics.Add(naam);
            }

            return this.LijstGevondenTopics;
        }

        public List<string> ZoekProfielen(string profielnaam)
        {
            List<NameValueCollection> GevondenProfielen = this.forumdatabase.ZoekProfielen(profielnaam);
            foreach (NameValueCollection n in GevondenProfielen)
            {
                string naam = n["naam"];
                this.LijstGevondenProfielen.Add(naam);
            }

            return this.LijstGevondenProfielen;
        }
    }
}