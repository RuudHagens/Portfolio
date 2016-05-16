using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Spot
    {
        private int number;
        private int? reservationID;
        private int size;
        private string waterAccess;
        private string special;

        public int Number
        {
            get { return number; }
            set { number = value; }
        }

        public int? ReservationID
        {
            get { return reservationID; }
            set { reservationID = value; }
        }

        public string Special
        {
            get { return special; }
            set { special = value; }
        }

        public string WaterAccess
        {
            get { return waterAccess; }
            set { waterAccess = value; }
        }

        public int Size
        {
            get { return size; }
            set { size = value; }
        }

        public Spot(int number, int? reservationID, string special)
        {
            this.number = number;
            this.reservationID = reservationID;
            this.special = special;
        }

        public Spot(int number, string special, int size, string waterAccess)
        {
            this.number = number;
            this.size = size;
            this.waterAccess = waterAccess;
            this.special = special;
            reservationID = 0;
        }

        public override string ToString()
        {
            return String.Format("Nummer: {0} - Waarde: {1} - Afmeting: {2} - Waterpunt: {3}", Number, Special, Size, WaterAccess);
        }
    }
}