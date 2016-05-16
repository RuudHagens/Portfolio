using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace talker
{
    class Talker
    {
        public static int BlahBlahBlah(string thingToSay, int numberOfTimes)
        {
            string finalString = "";
            for (int count = 0; count < numberOfTimes; count++)
            {
                finalString = finalString + thingToSay + "\n";
            }
            System.Windows.Forms.MessageBox.Show(finalString);
            return finalString.Length;
        }
    }
}