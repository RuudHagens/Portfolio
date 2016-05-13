using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace whoAmI
{
    class Elephant
    {
        public int EarSize;
        public string Name;
        public void WhoAmI()
        {
           System.Windows.Forms.MessageBox.Show("My ears are " + EarSize + " inches tall.", Name + " says…");
        }
    }
}

