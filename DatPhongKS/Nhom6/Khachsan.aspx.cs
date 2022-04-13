using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class Khachsan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HotelServices hotelServices = new HotelServices();
        
        showRooms.DataSource = hotelServices.getAllHotel();
        showRooms.DataBind();
        
    }
}