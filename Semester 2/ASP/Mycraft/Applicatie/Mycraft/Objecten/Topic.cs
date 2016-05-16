using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mycraft
{
    public class Topic
    {
        private int topicnr;
        private string naam;
        private DateTime aanmaakdatum;
        private int views;
        private Profiel maker;

        public Topic(int topicnr, string naam, DateTime aanmaakdatum, int views, Profiel maker)
        {
            this.topicnr = topicnr;
            this.naam = naam;
            this.aanmaakdatum = aanmaakdatum;
            this.views = views;
            this.maker = maker;
        }

        public int Topicnr
        {
            get { return topicnr; }
            set { topicnr = value; }
        }

        public string Naam
        {
            get { return naam; }
            set { naam = value; }
        }

        public DateTime Aanmaakdatum
        {
            get { return aanmaakdatum; }
            set { aanmaakdatum = value; }
        }

        public int Views
        {
            get { return views; }
            set { views = value; }
        }

        public Profiel Maker
        {
            get { return maker; }
            set { maker = value; }
        }
    }
}