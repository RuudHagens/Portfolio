using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AnimalShelter
{
    class MyException : Exception
    {
        public MyException()
            : base()
        {

        }

        public MyException(string message)
            : base(message)
        {

        }
    }
}
