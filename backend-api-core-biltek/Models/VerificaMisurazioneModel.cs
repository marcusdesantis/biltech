﻿namespace backend_api_core.Models
{
    public class VerificaMisurazione
    {
        public int? id{ get; set; }
        public int id_Misurazione { get; set; }
        public bool Active { get; set; }
      
    }

    public class VerificaMisurazioneList
    {
        public int? id { get; set; }
        public int id_Misurazione { get; set; }
        public bool Active { get; set; }

        public int total { get; set; }

    }
}
