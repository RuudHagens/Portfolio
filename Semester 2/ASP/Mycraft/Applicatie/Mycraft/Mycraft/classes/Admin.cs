using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mycraft
{
    public class Admin : Profiel
    {
        public Admin(int profielNr, string naam, string email, string soortGebruiker): base(profielNr, naam, email, soortGebruiker)
        {

        }
    }
}