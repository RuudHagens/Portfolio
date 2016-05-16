using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student_Comparor
{
    class Student : IComparable<Student>
    {
        private const int maxlength = 6;
        public string Name;
        public string Addres;
        public string Number;

        public Student(string Name, string Addres, string Number)
        {
            if (Number.Length < maxlength)
            {
                this.Number = Number.PadLeft(maxlength, '0');
            }
            else
            {
                this.Number = Number;
            }
            this.Name = Name;
            this.Addres = Addres;
        }

        public string name { get { return Name; } }
        public string addres { get { return Addres; } }
        public string number { get { return Number; } }

        public int CompareTo(Student otherstudent)
        {
            this.Name.CompareTo(otherstudent.Name);
            return this.Name.CompareTo(otherstudent.Name);            
        }

        public override string ToString()
        {
            return Number + ", " + Name + ", " + Addres;
        }
    }
}