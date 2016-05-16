using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klusbeheer_Applicatie
{
    class GewichtsException : Exception
    {
        public GewichtsException():base()
        {

        }
        public GewichtsException(string message):base(message)
        {

        }
    }
}
