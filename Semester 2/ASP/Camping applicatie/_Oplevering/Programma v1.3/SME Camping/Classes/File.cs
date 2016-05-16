using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class File : Post
    {
        private string fileLocation;

        public string FileLocation
        {
            get { return fileLocation; }
            set { fileLocation = value; }
        }

        public File(string fileLocation, User poster, string title, string text, int postID, int flags, int likes, int dislikes, int catID)
            : base(title, text, poster, postID, flags, likes, dislikes, catID)
        {
            this.fileLocation = fileLocation;
            comments = new List<Comment>();
        }
    }
}