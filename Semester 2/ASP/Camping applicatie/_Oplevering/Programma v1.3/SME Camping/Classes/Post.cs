using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public abstract class Post
    {
        protected string title;
        protected string text;
        protected User poster;
        protected int likes;
        protected int dislikes;
        protected int flags;
        protected int catID;
        protected int postID;
        protected List<Comment> comments;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }

        public string Text
        {
            get { return text; }
            set { text = value; }
        }

        public User Poster
        {
            get { return poster; }
            set { poster = value; }
        }

        public int PostID
        {
            get { return postID; }
            set { postID = value; }
        }

        public int Flags
        {
            get { return flags; }
            set { flags = value; }
        }

        public int Likes
        {
            get { return likes; }
            set { likes = value; }
        }

        public int Dislikes
        {
            get { return dislikes; }
            set { dislikes = value; }
        }

        public int CatID
        {
            get { return catID; }
            set { catID = value; }
        }

        public Post(string title, string text, User poster, int postID, int flags, int likes, int dislikes, int catID)
        {
            this.title = title;
            this.text = text;
            this.poster = poster;
            this.postID = postID;
            this.flags = flags;
            this.likes = likes;
            this.dislikes = dislikes;
            this.catID = catID;
            comments = new List<Comment>();
        }

        public void AddComment(Comment comment)
        {
            comments.Add(comment);
        }
    }
}