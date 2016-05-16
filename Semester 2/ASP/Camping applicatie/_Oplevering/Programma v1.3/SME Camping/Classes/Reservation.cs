using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class Reservation
    {
        private int reservationID;
        private int numberOfPeople;
        private string paymentStatus;

        public int ReservationID
        {
            get { return reservationID; }
            set { reservationID = value; }
        }

        public int NumberOfPeople
        {
            get { return numberOfPeople; }
            set { numberOfPeople = value; }
        }

        public string PaymentStatus
        {
            get { return paymentStatus; }
            set { paymentStatus = value; }
        }

        public Reservation(int reservationID, int numberOfPeople, string paymentStatus)
        {
            this.reservationID = reservationID;
            this.numberOfPeople = numberOfPeople;
            this.paymentStatus = paymentStatus;
        }
    }
}