using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class User
    {
        private string userName;
        private string password;
        private string email;
        private int type;
        private List<Item> rentedItems;
        private List<File> files;
        private List<Comment> comments;

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public int Type
        {
            get { return type; }
            set { type = value; }
        }

        public List<Item> RentedItems
        {
            get { return rentedItems; }
            set { rentedItems = value; }
        }

        public User(string userName, string email, int type)
        {
            this.userName = userName;
            this.type = type;
            this.email = email;
            rentedItems = new List<Item>();
        }

        public void LogOut()
        {

        }

        public override string ToString()
        {
            return String.Format("Username: {0} - Email: {1}", userName, email);
        }
    }
}