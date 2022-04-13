using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using DTO;
using System.Data;
namespace BUS
{
    public class AddressService
    {
        DataProvider data = new DataProvider();
        public DataTable getListPrivince()
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from Province order by ProvinceName asc";
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getListDistrict(int pronceID)
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from District where provinceID="+pronceID+ " order by DistrictName asc";
            dt = data.getDataTable(sql);
            return dt;
        }
    }
}