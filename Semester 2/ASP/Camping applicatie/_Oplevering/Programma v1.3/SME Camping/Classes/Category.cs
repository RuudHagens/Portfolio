using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Category
    {
        private int categoryID;
        private string name;
        private int parentID;

        public int CategoryID
        {
            get { return categoryID; }
            set { categoryID = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        public Category(int categoryID, string name, int parentID)
        {
            this.categoryID = categoryID;
            this.name = name;
            this.parentID = parentID;
        }
    }
}