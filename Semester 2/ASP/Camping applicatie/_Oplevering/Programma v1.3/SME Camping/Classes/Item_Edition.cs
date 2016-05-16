using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Item_Edition
    {
        private int editionId;
        private int itemId;
        private string name;

        public int ItemID
        {
            get { return itemId; }
            set { itemId = value; }
        }

        public int EditionID
        {
            get { return editionId; }
            set { editionId = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public Item_Edition(int itemId, int editionId, string name)
        {
            this.itemId = itemId;
            this.editionId = editionId;
            this.name = name;
        }

        public override string ToString()
        {
            return String.Format("{0}", Name);
        }
    }
}