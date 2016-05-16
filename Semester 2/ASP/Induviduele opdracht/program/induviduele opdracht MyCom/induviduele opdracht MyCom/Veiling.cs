using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace induviduele_opdracht_MyCom
{
    public class Veiling
    {
        public int Veilingnr { get; set; }
        public Product ProductItem { get; set; }
        public DateTime BeginDatumTijd { get; set; }
        public DateTime EindDatumTijd { get; set; }
        public DateTime Looptijd { get; set; }
        public int StartBod { get; set; }
        public string ProductStaat { get; set; }

        public Veiling (int veilingnr, Product productitem, DateTime beginDatumTijd, DateTime eindDatumTijd, DateTime looptijd, int startBod, string productStaat)
        {
            Veilingnr = veilingnr;
            ProductItem = productitem;
            BeginDatumTijd = beginDatumTijd;
            EindDatumTijd = eindDatumTijd;
            Looptijd = looptijd;
            StartBod = startBod;
            ProductStaat = productStaat;
        }
    }
}