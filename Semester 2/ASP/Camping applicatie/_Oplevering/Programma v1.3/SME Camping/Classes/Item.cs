using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Item
    {
        private string brand;
        private string series;
        private int Id;
        private decimal price;

        public string Brand
        {
            get { return brand; }
            set { brand = value; }
        }

        public string Series
        {
            get { return series; }
            set { series = value; }
        }

        public int ID
        {
            get { return Id; }
            set { Id = value; }
        }

        public decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public Item(int Id, string brand, string series, decimal price)
        {
            this.Id = Id;
            this.brand = brand;
            this.series = series;
            this.price = price;
        }
    }
}