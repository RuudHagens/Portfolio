using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Student_Comparor
{
    class NumberCompare : IComparer<Student>    
    {
        public int Compare(Student x, Student y)
        {
            if (Convert.ToInt32(x.Number) > Convert.ToInt32(y.Number)) return 1;
            else if (Convert.ToInt32(x.Number) < Convert.ToInt32(y.Number)) return -1;
            else return 0;
        }
    }
}
