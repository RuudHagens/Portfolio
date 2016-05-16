using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class ItemManager
    {
        private List<Item> rentedItems;
        private List<Item> notRentedItems;

        public List<Item> RentedItems
        {
            get { return rentedItems; }
            set { rentedItems = value; }
        }

        public List<Item> NotRentedItems
        {
            get { return notRentedItems; }
            set { notRentedItems = value; }
        }

        public ItemManager()
        {
            rentedItems = new List<Item>();
            notRentedItems = new List<Item>();
        }

        public void RentItem(Item i, User u)
        {

        }

        public void ReturnItem(Item i, User u)
        {

        }
    }
}