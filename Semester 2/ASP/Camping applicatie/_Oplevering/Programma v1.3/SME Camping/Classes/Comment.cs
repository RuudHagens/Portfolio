using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Comment
    {
        private string text;
        private User poster;
        private Post post;
        private int commentID;
        private int flags;
        private int likes;
        private int dislikes;

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

        public Post Post
        {
            get { return post; }
            set { post = value; }
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

        public int Flags
        {
            get { return flags; }
            set { flags = value; }
        }

        public int CommentID
        {
            get { return commentID; }
            set { commentID = value; }
        }

        public Comment(int commentID, string text, User poster, Post post, int likes, int dislikes, int flags)
        {
            this.text = text;
            this.poster = poster;
            this.post = post;
            this.likes = likes;
            this.dislikes = dislikes;
            this.flags = flags;
            this.commentID = commentID;
        }
    }
}