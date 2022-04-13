using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTO
{
    public class District
    {
        int districtID;
        int provinceID;
        string districtName;

        public int DistrictID { get => districtID; set => districtID = value; }
        public int ProvinceID { get => provinceID; set => provinceID = value; }
        public string DistrictName { get => districtName; set => districtName = value; }

        public District(int idDis, int idPro, string name)
        {
            this.districtID = idDis;
            this.provinceID = idPro;
            this.districtName = name;
        }
        public District() { }
    }
}