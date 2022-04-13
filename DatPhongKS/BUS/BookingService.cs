using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DTO;
using DAL;
using System.Data;

namespace BUS
{
    public class BookingService
    {
        DataProvider data = new DataProvider();

        public void insert(Booking booking)
        {
            string sql = @"insert into Booking (userID,RoomID,creatAt,timeStart, timeEnd,description) values("
                           + booking.UserID + ""
                           + ","
                           + booking.RoomID
                           + ",N'"
                           + booking.CreatAt.ToString("MM/dd/yyyy")
                           + "',"
                           + "N'"
                           + booking.TimeStart.ToString("MM/dd/yyyy")
                           + "',N'"
                           + booking.TimeEnd.ToString("MM/dd/yyyy")
                           + "',"
                           + "N'" + booking.Description
                           + "'"
                           + ")";
            data.excuteCMD(sql);
        }
        public void update(Booking booking)
        {
            string sql = @"update Booking set userID = " + booking.UserID +
                            ",RoomID= " + booking.RoomID+
                            ",creatAt = '" + booking.CreatAt.ToString("MM/dd/yyyy") +
                            "',timeStart = '" + booking.TimeStart.ToString("MM/dd/yyyy") +
                            "',timeEnd = '" + booking.TimeEnd.ToString("MM/dd/yyyy") +
                            "',description = N'" + booking.Description +
                            "' where id = " + booking.Id;
            data.excuteCMD(sql);
        }
        public DataTable getListFullInfor(int idHotel = 0)
        {
            DataTable dt = new DataTable();
            string sql;
            if (idHotel == 0)
            {
                sql = @" select Booking.id , [User].email,Booking.userID, Room.name as[nameRoom], Hotel.name as [nameHotel], Booking.creatAt,Booking.timeStart, Booking.timeEnd,Booking.description from Hotel, Room, Booking, [User] where Room.HotelID = Hotel.Id and Booking.RoomID = Room.Id and [User].id = Booking.userID";
            }
            else
            {
                sql = @" select Booking.id , [User].email,Booking.userID, Room.name as[nameRoom], Hotel.name as [nameHotel], Booking.creatAt,Booking.timeStart, Booking.timeEnd,Booking.description from Hotel, Room, Booking, [User] where Room.HotelID = Hotel.Id and Booking.RoomID = Room.Id and [User].id = Booking.userID and Hotel.Id = " + idHotel;
            }

            dt = data.getDataTable(sql);
            return dt;
        }
        public Booking getBookingByID(int id)
        {
            DataTable dt = new DataTable();
            string sql = @"select * from Booking where id = '" + id.ToString() + "'";
            dt = data.getDataTable(sql);
            if (dt.Rows.Count >= 1)
            {
                Booking booking = new Booking(dt.Rows[0]);
                return booking;
            }
            return null;
        }
        public bool CheckFullInfor(Booking booking)
        {
            int count = 0;
            if (booking.Description.Length == 0)
            {
                count++;
            }
            if(booking.TimeEnd <= booking.TimeStart)
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
            string sql = "delete from Booking where id = " + id;
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
        public void insertBooking(string userid, string roomid, string dateStart, string dateEnd)
        {

            string sql = @"insert into Booking (
                            userID,
                            RoomID,
                            CreatAt,
                            timeStart,
                            timeEnd,
                            description) 
                            values(" + userid + "," + roomid + ",GETDATE(),'" + dateStart + "','" + dateEnd + "','" + "')";
            data.excuteCMD(sql);
        }

        public void insertBooking(string userid, string roomid, string dateStart, string dateEnd, string description)
        {

            string sql = @"insert into Booking (
                            userID,
                            RoomID,
                            CreatAt,
                            timeStart,
                            timeEnd,
                            description) 
                           values("
                           + userid
                           + ","
                           + roomid
                           + "," + " GETDATE()"
                           + ","
                           + "'" + dateStart + "'"
                           + ","
                           + "'" + dateEnd + "'"
                           + ","
                           + "N'" + description + "'"
                           + ")";
            data.excuteCMD(sql);
        }

        public void Huy(string id)
        {
            string sql = "DELETE FROM booking WHERE id=" + id;
            data.excuteCMD(sql);
        }

    }
}