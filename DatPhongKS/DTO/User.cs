using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace DTO
{
    public class User
    {
        int id;
        string email;
        string password;
        int provinceID;
        int districtID;
        string address;
        int role;
        string cmt;
        string phone;
        int status;

        public int Id { get => id; set => id = value; }
        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public int ProvinceID { get => provinceID; set => provinceID = value; }
        public int DistrictID { get => districtID; set => districtID = value; }
        public string Address { get => address; set => address = value; }
        public int Role { get => role; set => role = value; }
        public string Cmt { get => cmt; set => cmt = value; }
        public string Phone { get => phone; set => phone = value; }
        public int Status { get => status; set => status = value; }

        public User() { }
        public User(int id, string email, string password, int provinceid, int districtid, string address, int role, string cmt, string phone, int status )
        {
            this.id = id;
            this.email = email;
            this.password = password;
            this.provinceID = provinceid;
            this.districtID = districtid;
            this.address = address;
            this.role = role;
            this.cmt = cmt;
            this.phone = phone;
            this.status = status;
        }
        public User(DataRow row)
        {
            this.id = int.Parse(row[0].ToString());
            this.email = row[1].ToString();
            this.password = row[2].ToString();
            this.provinceID = int.Parse(row[3].ToString());
            this.districtID = int.Parse(row[4].ToString());
            this.address = row[5].ToString();
            this.role = int.Parse(row[6].ToString());
            this.cmt = row[7].ToString();
            this.phone = row[8].ToString();
            this.status = int.Parse(row[9].ToString());
        }

        public User UserIDataReader(IDataReader dr)
        {
            User obj = new User();
            obj.Id = (dr["id"] is DBNull) ? -1 : Int32.Parse(dr["id"].ToString());
            obj.email = (dr["email"] is DBNull) ? string.Empty : dr["email"].ToString();
            obj.Address = (dr["address"] is DBNull) ? string.Empty : dr["address"].ToString();
            obj.Cmt = (dr["cmt"] is DBNull) ? string.Empty : dr["cmt"].ToString();
            obj.Phone = (dr["phone"] is DBNull) ? string.Empty : dr["phone"].ToString();
            obj.provinceID = (dr["provinceID"] is DBNull) ? -1 : Int32.Parse(dr["provinceID"].ToString());
            obj.districtID = (dr["districtID"] is DBNull) ? -1 : Int32.Parse(dr["districtID"].ToString());
            obj.Role = (dr["role"] is DBNull) ? -1 : Int32.Parse(dr["role"].ToString());
            obj.Status = (dr["status"] is DBNull) ? -1 : Int32.Parse(dr["status"].ToString());
            return obj;
        }
    }
}