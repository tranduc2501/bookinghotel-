using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using DTO;
using System.Data;
namespace BUS
{
    public class HotelServices
    {
        DataProvider data = new DataProvider();

        public void insert(Hotel hotel)
        {
            string sql = @"insert into Hotel (userID,
                            provinceID,
                            districtID,
                            address,
                            phone,
                            status,
                            images,
                            description,
                            name,
                            shortDes,
                            thumb) 
                           values(" 
                           + hotel.UserID 
                           + "," 
                           + hotel.ProvinceID
                           + "," 
                           + hotel.DistrictID 
                           + "," 
                           +"N'" + hotel.Address + "'" 
                           +","
                           + "N'" + hotel.Phone + "'" 
                           +"," 
                           + hotel.Status 
                           + "," +
                           "N'" + hotel.Images + "'"
                           +","
                           +"N'" + hotel.Description + "'"
                           + ","
                           + "N'" + hotel.Name + "'"
                           + ","
                           + "N'" + hotel.ShortDes+ "'"
                           + ","
                           + "N'" + hotel.Thumb + "'"
                           + ")";
            data.excuteCMD(sql);
        }
        public void Update(Hotel hotel)
        {
            string sql = @"update Hotel set 
                            userID = "+ hotel.UserID +
                            ",provinceID = " + hotel.ProvinceID +
                            ",districtID = " + hotel.DistrictID +
                            ",address = N'" + hotel.Address +
                            "',phone = '" + hotel.Phone +
                            "',status = " + hotel.Status +
                            ",images = N'" + hotel.Images +
                            "',description = N'" + hotel.Description +
                            "',name = N'" + hotel.Name +
                            "',shortDes = N'" + hotel.ShortDes +
                            "',thumb = N'" + hotel.Thumb +
                            "' where id = "+hotel.Id;
            data.excuteCMD(sql);
        }
        public bool CheckFullInfor(Hotel hotel)
        {
            int count = 0;
            if(hotel.Address.Length == 0)
            {
                count++;
            }
            if(hotel.Phone.Length == 0)
            {
                count++;
            }
            if(hotel.Description.Length == 0)
            {
                count++;
            }
            if(hotel.Name.Length == 0)
            {
                count++;
            }
            if(hotel.ShortDes.Length == 0)
            {
                count++;
            }
            if(count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataTable getList(int idUser = 0)
        {
            DataTable dt = new DataTable();
            string sql;
            if (idUser == 0)
            {
                sql = @"select * from Hotel";
            }
            else
            {
                sql = @"select * from Hotel where Hotel.userID = " + idUser;
            }
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getList()
        {
            DataTable dt = new DataTable();
            string sql = @"select * from Hotel";
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getListFullInfor()
        {
            DataTable dt = new DataTable();
            string sql = @"select Hotel.id, Hotel.address, DistrictName,ProvinceName, Hotel.phone, Hotel.creatAt, name, thumb, email,Case when Hotel.status = 1 then N'Hoạt động' else N'Tạm ngừng' end as [status] from Hotel,District,Province, [User] where Hotel.userID = [User].id and Hotel.provinceID = Province.ProvinceID and Hotel.districtID = District.DistrictID";
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getListFullInfor(int idUser = 0)
        {
            DataTable dt = new DataTable();
            string sql;
            if (idUser == 0)
            {
                sql = @"select Hotel.id, Hotel.address, DistrictName,ProvinceName, Hotel.phone, Hotel.creatAt, name, thumb, email,Case when Hotel.status = 1 then N'Hoạt động' else N'Tạm ngừng' end as [status] from Hotel,District,Province, [User] where Hotel.userID = [User].id and Hotel.provinceID = Province.ProvinceID and Hotel.districtID = District.DistrictID";
            }
            else
            {
                sql = @"select Hotel.id, Hotel.address, DistrictName,ProvinceName, Hotel.phone, Hotel.creatAt, name, thumb, email,Case when Hotel.status = 1 then N'Hoạt động' else N'Tạm ngừng' end as [status] from Hotel,District,Province, [User] where Hotel.userID = [User].id and Hotel.provinceID = Province.ProvinceID and Hotel.districtID = District.DistrictID and Hotel.userID = " + idUser;
            }

            dt = data.getDataTable(sql);
            return dt;
        }
        public Hotel getHoTelById(int id)
        {
            DataTable dt = new DataTable();
            string sql = @"select * from Hotel where id = '"+id.ToString()+"'";
            dt = data.getDataTable(sql);
            if(dt.Rows.Count >= 1)
            {
                Hotel hotel = new Hotel(dt.Rows[0]);
                return hotel;
            }
            return null;
        }
        public List<Hotel> convertList(DataTable data)
        {
            List<Hotel> list = new List<Hotel>();
            for (int i = 0; i < data.Rows.Count; ++i)
            {
                Hotel temp = new Hotel(data.Rows[i]);
                list.Add(temp);
            }
            return list;
        }
        public int delete(int id)
        {
            string sql = "delete from Hotel where id = " + id;
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

        public DataTable getAllHotel()
        {
            DataTable dt = new DataTable();
            string sql = @"select * from Hotel where Hotel.status = 1";
            dt = data.getDataTable(sql);
            return dt;
        }

    }
}