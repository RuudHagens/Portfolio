using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student_Comparor
{
    class AddresCompare : IComparer<Student>
    {
        public int Compare(Student x, Student y)
        {
            if (x.Addres.Length > y.Addres.Length) return 1;
            else if (x.Addres.Length < y.Addres.Length) return -1;
            else return 0;
        }
    }
}
