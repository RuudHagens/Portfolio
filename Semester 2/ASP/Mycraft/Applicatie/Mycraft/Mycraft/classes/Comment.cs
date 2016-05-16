using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mycraft
{
    public class Comment
    {
        private int commentnr;
        private string commenttekst;
        private DateTime datum;
        private Profiel commentator;
        private Profiel ontvanger;

        public Comment(int commentnr, string commenttekst, DateTime datum, Profiel commentator, Profiel ontvanger)
        {
            this.commentnr = commentnr;
            this.commenttekst = commenttekst;
            this.datum = datum;
            this.commentator = commentator;
            this.ontvanger = ontvanger;
        }

        public DateTime Datum
        {
            get { return datum; }
            set { datum = value; }
        }
        
        public int Commentnr
        {
            get { return commentnr; }
            set { commentnr = value; }
        }
        
        public string Commenttekst
        {
            get { return commenttekst; }
            set { commenttekst = value; }
        }

        public Profiel Commentator
        {
            get { return commentator; }
            set { commentator = value; }
        }

        public Profiel Ontvanger
        {
            get { return ontvanger; }
            set { ontvanger = value; }
        }
    }
}