using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BUS
{
    public class DistrictServices
    {
        DataProvider data = new DataProvider();
        public DataTable getList()
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from District";
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getListFromProvince(int id)
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from District where ProvinceID = " + id;
            dt = data.getDataTable(sql);
            return dt;
        }
        public List<District> convertList(DataTable data)
        {
            List<District> list = new List<District>();
            for (int i = 0; i < data.Rows.Count; ++i)
            {
                District temp = new District(int.Parse(data.Rows[i][0].ToString()), int.Parse(data.Rows[i][1].ToString()),data.Rows[i][2].ToString());
                list.Add(temp);
            }
            return list;
        }
    }
}