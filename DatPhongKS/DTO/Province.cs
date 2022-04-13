using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTO
{
    public class Province
    {
        int provinceID;
        string provinceName;

        public int ProvinceID { get => provinceID; set => provinceID = value; }
        public string ProvinceName { get => provinceName; set => provinceName = value; }

        public Province (int id, string name)
        {
            this.provinceID = id;
            this.provinceName = name;
        }
        public Province() { }
    }
}