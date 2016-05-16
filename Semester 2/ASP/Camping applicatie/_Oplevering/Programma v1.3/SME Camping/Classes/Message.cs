using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Message : Post
    {
        private string mesTitle;
        private string mesText;

        public string MesTitle
        {
            get { return mesTitle; }
            set { mesTitle = value; }
        }

        public string MesText
        {
            get { return mesText; }
            set { mesText = value; }
        }

        public Message(string mesTitle, string mesText, User poster, string title, string text, int postID, int flags, int likes, int dislikes, int catID)
            : base(title, text, poster, postID, flags, likes, dislikes, catID)
        {
            this.mesTitle = mesTitle;
            this.mesText = mesText;
        }
    }
}