using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class phonghot : System.Web.UI.Page
{
    RoomServices roomServices = new RoomServices();

    protected void Page_Load(object sender, EventArgs e)
    {
        showRooms.DataSource = roomServices.getListRoomsHot();
        showRooms.DataBind();

    }
}