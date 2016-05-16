using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Specification
    {
        private int spotNumber;
        private int specID;
        private string specValue;
        
        public int SpotNumber
        {
            get { return spotNumber; }
            set { spotNumber = value; }
        }

        public int SpecID
        {
            get { return specID; }
            set { specID = value; }
        }

        public string SpecValue
        {
            get { return specValue; }
            set { specValue = value; }
        }

        public Specification(int spotNumber, int specID, string specValue)
        {
            this.spotNumber = spotNumber;
            this.specID = specID;
            this.specValue = specValue;
        }
    }
}