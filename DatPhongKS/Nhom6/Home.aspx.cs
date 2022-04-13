using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;

public partial class _Default : System.Web.UI.Page
{
    RoomServices roomServices = new RoomServices();

    protected void Page_Load(object sender, EventArgs e)
    {
        showRooms.DataSource = roomServices.getList();
        showRooms.DataBind();
    }

}