using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DTO
{
    public class Room
    {
        int id;
        string name;
        int hotelID;
        int status;
        string images;
        string thumb;
        int price;
        string description;
        DateTime createAt;

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public int HotelID { get => hotelID; set => hotelID = value; }
        public int Status { get => status; set => status = value; }
        public string Images { get => images; set => images = value; }
        public int Price { get => price; set => price = value; }
        public string Description { get => description; set => description = value; }
        public string Thumb { get => thumb; set => thumb = value; }
        public DateTime CreateAt { get => createAt; set => createAt = value; }

        public Room() { }

        public Room(int id, int hotelID, int statu, string image, int price, string descriptio,DateTime createAt, string thum)
        {
            this.id = id;
            this.hotelID = hotelID;
            this.Status = statu;
            this.Images = image;
            this.price = price;
            this.description = descriptio;
            this.createAt = createAt;
            this.thumb = thum;
        }
        public Room(DataRow row)
        {
            this.id = int.Parse(row[0].ToString());
            this.name = row[1].ToString();
            this.hotelID = int.Parse(row[2].ToString());
            this.Status = int.Parse(row[3].ToString());
            this.Images = row[4].ToString();
            this.price = int.Parse(row[5].ToString());
            this.description = row[6].ToString();
            this.createAt = DateTime.Parse(row[7].ToString());
            this.thumb = row[8].ToString(); 
        }
    }
}