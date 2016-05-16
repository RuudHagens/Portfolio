using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CookieClicker_week2
{
    class KoekjesController
    {
        private int kps = 0;
        private int koekjes = 0;
        private int koekjesperklik = 10;

        public int Kps { get { return kps; } set { kps = value;} }
        public int Koekjes { get { return koekjes; } set { koekjes = value; } }
        public int KoekjesPerKlik { get { return koekjesperklik; } set { koekjesperklik = value; } }

        public KoekjesController()
        {

        }
    }
}
