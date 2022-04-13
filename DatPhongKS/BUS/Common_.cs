using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DAL;
using DTO;

namespace BUS
{
    public class Common_
    {
        DataProvider data = new DataProvider();

        public DataTable searchItem(string query)
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select * from Room where status = 1 and name like '%"+ query +"%'";
            dt = data.getDataTable(sql);
            return dt;
        }

        public DataTable ShowThue(string id)
        {
            DataTable dt = new DataTable(); ;
            string sql = @"select room.id,room.thumb, room.name, room.price, room.images, room.description, Booking.timeStart, Booking.timeEnd, Booking.description as bkdes, Booking.id as bkid from Room, Booking where Room.id = Booking.RoomID and Room.status = 1 and Booking.userID = " + id;
            dt = data.getDataTable(sql);
            return dt;
        }
    }
}