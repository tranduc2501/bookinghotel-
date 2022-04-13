using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DTO
{
    public class Hotel
    {
        int id;
        int userID;
        int provinceID;
        int districtID;
        string address;
        string phone;
        int status;
        string images;
        DateTime creatAt;
        string description;
        string name;
        string shortDes;
        string thumb;

        public int Id { get => id; set => id = value; }
        public int UserID { get => userID; set => userID = value; }
        public int ProvinceID { get => provinceID; set => provinceID = value; }
        public int DistrictID { get => districtID; set => districtID = value; }
        public string Address { get => address; set => address = value; }
        public string Phone { get => phone; set => phone = value; }
        public int Status { get => status; set => status = value; }
        public string Images { get => images; set => images = value; }
        
        public string Description { get => description; set => description = value; }
        public DateTime CreatAt { get => creatAt; set => creatAt = value; }
        public string Name { get => name; set => name = value; }
        public string ShortDes { get => shortDes; set => shortDes = value; }
        public string Thumb { get => thumb; set => thumb = value; }

        public Hotel() { }
        public Hotel(int id, int userID, int provinceID, int districtID, string address, string phone, int status, string images,  DateTime creatAt, string description, string name, string shortDes, string thumb )
        {
            this.id = id;
            this.userID = userID;
            this.provinceID = provinceID;
            this.districtID = districtID;
            this.address = address;
            this.phone = phone;
            this.status = status;
            this.Images = images;
            this.creatAt = creatAt;
            this.description = description;
            this.name = name;
            this.shortDes = shortDes;
            this.thumb = thumb;
        }
        public Hotel(DataRow row)
        {
            this.id = int.Parse(row[0].ToString());
            this.userID = int.Parse(row[1].ToString());
            this.provinceID = int.Parse(row[2].ToString());
            this.districtID = int.Parse(row[3].ToString());
            this.address = row[4].ToString() ;
            this.phone = row[5].ToString() ;
            this.status = int.Parse(row[6].ToString());
            this.Images = row[7].ToString();
            this.creatAt = DateTime.Parse(row[8].ToString());
            this.description = row[9].ToString();
            this.name = row[10].ToString();
            this.shortDes = row[11].ToString();
            this.thumb = row[12].ToString();
        }
    }
}