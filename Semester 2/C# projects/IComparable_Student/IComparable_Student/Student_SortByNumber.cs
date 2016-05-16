using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IComparable_Student
{
    class Student_SortByNumber : IComparer<Student>
    {
        //oplopend
        public int Compare(Student x, Student y)
        {
            if (x.Number > y.Number) return 1;
            else if (x.Number < y.Number) return -1;
            else return 0;
        }
    }
}
