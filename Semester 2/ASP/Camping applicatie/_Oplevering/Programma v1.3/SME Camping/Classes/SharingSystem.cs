using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class SharingSystem
    {
        private List<User> users;
        private List<Message> messages;
        private List<File> files;
        private List<Comment> comments;

        public SharingSystem()
        {
            users = new List<User>();
            messages = new List<Message>();
            files = new List<File>();
            comments = new List<Comment>();
        }

        public void CreateCategory(string name, int mainCategoryID)
        {
            //moet nog max getal pakken uit db
            int benaanhoogstegetal = 0;
            Category category = new Category(benaanhoogstegetal, name, mainCategoryID);
        }

        //Nog toevoegen aan klassendiagram
        public void AddFile(string fileLocation, User poster, string title, string text, int postID, int flags, int likes, int dislikes, int catID)
        {
            File file = new File(fileLocation, poster, title, text, postID, flags, likes, dislikes, catID);
            files.Add(file);
        }

        //Nog toevoegen aan klassendiagram
        public void AddMessage(string mesTitle, string mesText, User poster, string title, string text, int postID, int flags, int likes, int dislikes, int catID)
        {
            Message message = new Message(mesTitle, mesText, poster, title, text, postID, flags, likes, dislikes, catID);
            messages.Add(message);
        }

        public void AddComment(int commentID, string text, User poster, Post post, int likes, int dislikes, int flags)
        {
            Comment comment = new Comment(commentID, text, poster, post, likes, dislikes, flags);
            comments.Add(comment);
        }
    }
}