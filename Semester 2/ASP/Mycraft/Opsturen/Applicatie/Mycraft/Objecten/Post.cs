using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mycraft
{
    public class Post
    {
        private int postID;
        private string tekst;
        private DateTime datum;
        private string file;
        private Profiel plaatser;

        public Post(int postID, string tekst, DateTime datum, string file, Profiel plaatser)
        {
            this.postID = postID;
            this.tekst = tekst;
            this.datum = datum;
            this.file = file;
            this.plaatser = plaatser;
        }

        public int PostID
        {
            get { return postID; }
            set { postID = value; }
        }

        public string Tekst
        {
            get { return tekst; }
            set { tekst = value; }
        }

        public DateTime Datum
        {
            get { return datum; }
            set { datum = value; }
        }

        public string File
        {
            get { return file; }
            set { file = value; }
        }

        public Profiel Plaatser
        {
            get { return plaatser; }
            set { plaatser = value; }
        }
    }
}
