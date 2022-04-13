using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using DTO;
using System.Data;
namespace BUS
{
    public class RoomServices
    {
        DataProvider data = new DataProvider();
        public void insert(Room room)
        {
            string sql = @"insert into Room (name,hotelID,status,images, price,description,createAt,thumb) values(N'"
                           + room.Name + "'"
                           + ","
                           + room.HotelID
                           + ","
                           + room.Status
                           + ","
                           + "N'" + room.Images + "'"
                           + ","
                           + room.Price
                           + ","
                           + "N'" + room.Description + "'"
                           + ",'"
                           + room.CreateAt.ToString("MM/dd/yyyy")
                           + "',"
                           + "N'" + room.Thumb + "'"
                           + ")";
            data.excuteCMD(sql);
        }
        public void Update(Room room)
        {
            string sql = @"update Room set name = N'" + room.Name +
                            "',price= " + room.Price +
                            ",createAt = '" + room.CreateAt.ToString("MM/dd/yyyy") +
                            "',hotelID = " + room.HotelID +
                            ",status = " + room.Status +
                            ",images = N'" + room.Images +
                            "',description = N'" + room.Description +
                            "',thumb = N'" + room.Thumb +
                            "' where id = " + room.Id;
            data.excuteCMD(sql);
        }
        public DataTable getList(int hotelID = 0)
        {
            DataTable dt = new DataTable();
            string sql;
            if (hotelID == 0)
            {
                sql = @" select A.*,D.districtName,C.ProvinceName from Room as A,Hotel as B,Province as C, District as D where A.status = 1 and A.hotelID = B.id and B.provinceID = c.ProvinceID and B.districtID = D.districtID";
            }
            else
            {
                sql = @" select A.*,D.districtName,C.ProvinceName from Room as A,Hotel as B,Province as C, District as D where A.hotelID = B.id and B.provinceID = c.ProvinceID and B.districtID = D.districtID and A.hotelID = " + hotelID;
            }
            dt = data.getDataTable(sql);
            return dt;
        }
        public List<Room> convertList(DataTable data)
        {
            List<Room> list = new List<Room>();
            for (int i = 0; i < data.Rows.Count; ++i)
            {
                Room temp = new Room(data.Rows[i]);
                list.Add(temp);
            }
            return list;
        }
        public DataTable getListFullInfor(int idHotel = 0)
        {
            DataTable dt = new DataTable();
            string sql;
            if (idHotel == 0)
            {
                sql = @"  select Room.id,Room.name, Hotel.name as [nameHotel],Case when Room.status = 1 then N'Còn phòng' else N'Đã đầy' end as status, Room.images, price, Room.description, createAt, Room.thumb from Hotel, Room where Room.HotelID = Hotel.Id";
            }
            else
            {
                sql = @"  select Room.id,Room.name, Hotel.name as [nameHotel],Case when Room.status = 1 then N'Còn phòng' else N'Đã đầy' end as status, Room.images, price, Room.description, createAt, Room.thumb from Hotel, Room where Room.HotelID = Hotel.Id and Room.hotelID =" + idHotel;
            }

            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getListGroupByProvince()
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select C.ProvinceID,C.ProvinceName,count(*)  as SoPhong from Room as A,Hotel as B,Province as C where A.hotelID = B.id and B.provinceID = c.ProvinceID
                            group by C.ProvinceName,C.ProvinceID";
            dt = data.getDataTable(sql);
            return dt;
        }
        public Room getRoomById(int id)
        {
            DataTable dt = new DataTable();
            string sql = @"select * from Room where id = " + id.ToString();
            dt = data.getDataTable(sql);
            if (dt.Rows.Count >= 1)
            {
                Room room = new Room(dt.Rows[0]);
                return room;
            }
            return null;
        }
        public string getHotelIDByRoomID(int id)
        {
            DataTable dt = new DataTable();
            string sql = @"select Hotel.Id from Hotel, Room where Hotel.Id = Room.HotelID and Room.id = " + id.ToString();
            dt = data.getDataTable(sql);
            if (dt.Rows.Count >= 1)
            {
                return dt.Rows[0][0].ToString();
            }
            return null;
        }
        public DataTable getRoom(string id)
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select Room.id,Room.thumb, Room.name, Room.images, Room.description,Room.price, Hotel.address, Hotel.phone from Room, Hotel where Room.hotelID = Hotel.id and Hotel.status = 1 and Room.status = 1 and Room.id= '" + id + "'";
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getListProvince(string id)
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select Room.id,Room.thumb, Room.name, Room.images, Room.description, Room.price,District.DistrictName,Province.ProvinceName from Room, Hotel,District,Province where Room.hotelID = Hotel.id and Hotel.status = 1 and Room.status = 1 and Hotel.ProvinceID = Province.ProvinceID and Hotel.DistrictID =District.DistrictID  and Hotel.ProvinceID = '" + id + "'";
            dt = data.getDataTable(sql);
            return dt;
        }
        public bool CheckFullInfor(Room room)
        {
            int count = 0;
            if (room.Name.Length == 0)
            {
                count++;
            }
            if (room.Description.Length == 0)
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
        public int delete(int id)
        {
            string sql = "delete from Room where id = " + id;
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
        public DataTable getListRoomsHot()
        {
            DataTable dt = new DataTable();
            string sql = @"select TOP 10 A.RoomID as id, COUNT(A.RoomID) as xuatHien, 
                            (Select Room.name from Room where Room.id = A.RoomID) as name,
	                        (Select Room.images from Room where Room.id = A.RoomID) as images,
                            (Select Room.thumb from Room where Room.id = A.RoomID) as thumb,
	                        (Select Room.price from Room where Room.id = A.RoomID) as price,
	                        (Select Room.description from Room where Room.id = A.RoomID) as description
	                        from Booking as A,Room as B where B.id = A.RoomID And B.status = 1  Group by A.RoomID Order by xuatHien DESC";
            dt = data.getDataTable(sql);
            return dt;
        }
        public DataTable getNewRoom()
        {
            DataTable dt = new DataTable();
            string sql = @"select Top 10 room.id,room.thumb, room.name, Room.images, room.price, Room.description from Room where Room.status = 1 Order by id DESC";
            dt = data.getDataTable(sql);
            return dt;
        }

        public DataTable getRoomHotel()
        {
            DataTable dt = new DataTable();
            string sql = @"select room.id, room.name, room.price, room.images, room.description from hotel, rooom where Hotel.id = Room.hotelID";
            dt = data.getDataTable(sql);
            return dt;
        }

        public string getNameProvince(string provinceID)
        {
            DataTable dt = new DataTable();
            string sql = @"select * from Province where ProvinceID = "+provinceID;
            dt = data.getDataTable(sql);
            string name = dt.Rows[0]["ProvinceName"].ToString();
            return name;
        }
    }
}