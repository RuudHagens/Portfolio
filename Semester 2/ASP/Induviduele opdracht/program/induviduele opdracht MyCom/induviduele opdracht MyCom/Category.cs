using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Category
    {
        public int CatID { get; set; }
        public string Naam { get; set; }
        public int? ParentID { get; set; }

        public Category(int catID, string naam, int? parentID)
        {
            CatID = catID;
            Naam = naam;
            ParentID = parentID;
        }
    }
}