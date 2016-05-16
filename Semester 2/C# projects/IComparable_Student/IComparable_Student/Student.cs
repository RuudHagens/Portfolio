using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IComparable_Student
{
    class Student : IComparable<Student>
    {
        protected string name;
        protected string address;
        protected int number;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        public int Number
        {
            get { return number; }
            set { number = value; }
        }

        public Student(string name, string address, int number)
        {
            this.name = name;
            this.address = address;
            this.number = number;
        }

        public override string ToString()
        {
            return String.Format("Name: {0} - Address: {1} - Studentnumber: {2}", name, address, number);
        }

        public int CompareTo(Student other)
        {
            //aflopend
            if (this.Number < other.Number) return 1;
            if (this.Number > other.Number) return -1;
            else return 0;
        }
    }
}
