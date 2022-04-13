using DAL;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BUS
{
    public class ProvinceServices
    {
        DataProvider data = new DataProvider();
        public DataTable getList()
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from Province";
            dt = data.getDataTable(sql);
            return dt;
        }
        public List<Province> convertList(DataTable data)
        {
            List<Province> list = new List<Province>();
            for (int i = 0; i < data.Rows.Count; ++i)
            {
                Province temp = new Province(int.Parse(data.Rows[i][0].ToString()),  data.Rows[i][1].ToString());
                list.Add(temp);
            }
            return list;
        }
    }
}