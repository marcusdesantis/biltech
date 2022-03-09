using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Balanza.Models
{
    public class BalanceModel
    {
        public string portCOM { get; set; }
        public int baudRate { get; set; }
        public int parity { get; set; }
        public int dataBits { get; set; }
        public int stopBits { get; set; }
        public string typeWeighWeight { get; set; }
        
    }

    public class BalanceResultModel
    {
        public string dataValue { get; set; }
    }
}
