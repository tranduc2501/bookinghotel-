using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using DTO;
using System.Data;
using System.Data.SqlClient;
namespace BUS
{
    public class UserServices
    {
        DataProvider data = new DataProvider();
        public void insert(User obj)
        {
            string sql = @"insert into [dbo].[User] (email,password,provinceID,districtID,address,role,cmt,phone,status) values("
                           + "N'" + obj.Email + "'"
                           + ","
                           + obj.Password
                           + ","
                           + obj.ProvinceID
                           + ","
                           + obj.DistrictID
                           + ","
                           + "N'" + obj.Address + "'"
                           + ","
                           + obj.Role
                           + ","
                           + "N'" + obj.Cmt + "'"
                           + ","
                           + "N'" + obj.Phone + "'"
                           + ","
                           + " '" + obj.Status + "'"
                           + ")";
            data.excuteCMD(sql);
        }
        public DataTable getList()
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from [dbo].[User]";
            dt = data.getDataTable(sql);
            return dt;
        }
        public List<User> convertList(DataTable data)
        {
            List<User> list = new List<User>();
            for (int i = 0; i < data.Rows.Count; ++i)
            {
                User temp = new User(int.Parse(data.Rows[i][0].ToString()), data.Rows[i][1].ToString(), data.Rows[i][2].ToString(), int.Parse(data.Rows[i][3].ToString()), int.Parse(data.Rows[i][4].ToString()), data.Rows[i][5].ToString(), int.Parse(data.Rows[i][6].ToString()), data.Rows[i][7].ToString(), data.Rows[i][8].ToString(),int.Parse( data.Rows[i][9].ToString()));
                list.Add(temp);
            }
            return list;
        }
        public bool CheckFullInfor(User user)
        {
            int count = 0;
            if (user.Email.Length == 0)
            {
                count++;
            }
            if (user.Cmt.Length == 0)
            {
                count++;
            }
            if (user.Phone.Length == 0)
            {
                count++;
            }
            if (user.Address.Length == 0)
            {
                count++;
            }

            if (count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public List<User> getList(string email, string pass)
        {

            DataTable dt = new DataTable(); ;
            string sql = @"select * from  [dbo].[User] where email='" + email + "' and password='" + pass + "'";
            SqlCommand dbCmd = new SqlCommand(sql, data.GetConnection());
            SqlDataReader dr = dbCmd.ExecuteReader();
            dr.Close();
            dr = dbCmd.ExecuteReader();
            User user = new User();
            List<User> list = new List<User>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    list.Add(user.UserIDataReader(dr));
                }
            }
            dr.Close();
            return list;
        }
        public DataTable getListFullInfor()
        {
            DataTable dt = new DataTable();
            string sql = @"  select [User].id, email, provinceName, districtName, [address] ,case when role=1 then N'Admin' when role=2 then N'Quản lý khách sạn' else N'Khách hàng' end as role,cmt,phone,case when status=1 then N'Đang hoạt động' when status=2 then N'Đã ngừng hoạt động' end as [status],createAt  from [User],Province,District where [User].provinceID=Province.provinceID and [User].districtID=District.districtID";

            dt = data.getDataTable(sql);
            return dt;
        }
        public User getInfo(string email)
        {
            List<User> list = new List<User>();
            list = checkExist(email);
            if (list.Count > 0)
                return list[0];
            else return null;
        }
        public List<User> checkExist(string email)
        {

            DataTable dt = new DataTable(); ;
            string sql = @"select * from  [dbo].[User] where email='" + email + "'";
            SqlCommand dbCmd = new SqlCommand(sql, data.GetConnection());
            SqlDataReader dr = dbCmd.ExecuteReader();
            dr.Close();
            dr = dbCmd.ExecuteReader();
            User user = new User();
            List<User> list = new List<User>();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    list.Add(user.UserIDataReader(dr));
                }
            }
            dr.Close();
            return list;
        }
        public User getUserByID(int id)
        {
            DataTable dt = new DataTable();
            string sql = @"select * from [user] where id = '" + id.ToString() + "'";
            dt = data.getDataTable(sql);
            if (dt.Rows.Count >= 1)
            {
                User user = new User(dt.Rows[0]);
                return user;
            }
            return null;
        }
        public int register(User obj)
        {
            if (checkExist(obj.Email).Count > 0)
            {
                return 1;
            }
            else
            {
                try
                {
                    insert(obj);
                }
                catch (Exception exception)
                {
                    return 2;
                }
                return 3;
            }
        }
        public int delete(int id)
        {
            string sql = "delete from User where id = " + id;
            try
            {
                data.excuteCMD(sql);
                return 0;
            }
            catch
            {
                return 1;
            }

        }
        public int update(User obj)
        {
            if (obj.Password.Equals(""))
            {
                try
                {
                    string sql = @"update [dbo].[User] set provinceID = " + obj.ProvinceID
            + ", districtID = " + obj.DistrictID
            + ", address = N'" + obj.Address
            + "',role = " + obj.Role
            + ", cmt = N'" + obj.Cmt
            + "',phone = N'" + obj.Phone
            + "' where email = N'" + obj.Email + "'";
                    data.excuteCMD(sql);
                }
                catch
                {
                    return 0;
                }

                return 1;
            }
            else
            {
                try
                {
                    string sql = @"update [dbo].[User] set password = "+obj.Password
                          +",  provinceID = " + obj.ProvinceID
                          + ", districtID = " + obj.DistrictID
                          + ", address = N'" + obj.Address
                          + "',role = " + obj.Role
                          + ", cmt = N'" + obj.Cmt
                          + "',phone = N'" + obj.Phone
                          + "' where email = N'" + obj.Email + "'";
                    data.excuteCMD(sql);
               }
                catch (Exception exception)
                {
                    return 0;
                }
                return 1;
            }
        }
    }
}