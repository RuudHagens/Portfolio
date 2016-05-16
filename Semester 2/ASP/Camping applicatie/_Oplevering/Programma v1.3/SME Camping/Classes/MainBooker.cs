using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SME_Camping.Classes
{
    public class MainBooker : User
    {
        private string firstName;
        private string insertion;
        private string lastName;
        private string residence;
        private string street;
        private int streetNumber;
        private string bankNr;

        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }

        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }

        public MainBooker(string firstName, string insertion, string lastName, string residence, string street, int streetNumber, string bankNr, string email) : base(firstName + insertion + lastName, email, 2)
        {
            this.firstName = firstName;
            this.insertion = insertion;
            this.lastName = lastName;
            this.residence = residence;
            this.street = street;
            this.streetNumber = streetNumber;
            this.bankNr = bankNr;
        }

        public MainBooker(string firstName, string lastName, string residence, string street, int streetNumber, string bankNr, string email) : base(firstName + lastName, email, 2)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.residence = residence;
            this.street = street;
            this.streetNumber = streetNumber;
            this.bankNr = bankNr;
        }

        public override string ToString()
        {
            return String.Format("Hoofdboeker| Username: {0} - Email: {1}", UserName, Email);
        }
    }
}