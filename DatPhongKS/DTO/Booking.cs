using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DTO
{
    public class Booking
    {
        int id;
        int userID;
        int roomID;
        DateTime creatAt;
        DateTime timeStart;
        DateTime timeEnd;
        string description;

        public int Id { get => id; set => id = value; }
        public int UserID { get => userID; set => userID = value; }
        public int RoomID { get => roomID; set => roomID = value; }
        public DateTime CreatAt { get => creatAt; set => creatAt = value; }
        public DateTime TimeStart { get => timeStart; set => timeStart = value; }
        public DateTime TimeEnd { get => timeEnd; set => timeEnd = value; }
        public string Description { get => description; set => description = value; }

        public Booking() { }
        public Booking(int id, int userID, int RoomID, DateTime creatAt, DateTime timeStart, DateTime timeEnd, string description)
        {
            this.id = id;
            this.userID = userID;
            this.RoomID = RoomID;
            this.creatAt = creatAt;
            this.timeStart = timeStart;
            this.timeEnd = timeEnd;
            this.description = description;
        }
        public Booking(DataRow row)
        {
            this.id = int.Parse(row[0].ToString());
            this.userID = int.Parse(row[1].ToString());
            this.RoomID = int.Parse(row[2].ToString());
            this.creatAt = DateTime.Parse(row[3].ToString());
            this.timeStart = DateTime.Parse(row[4].ToString());
            this.timeEnd = DateTime.Parse(row[5].ToString());
            this.description = row[6].ToString();
            
        }
    }
}