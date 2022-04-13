using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class danhsachkhachsan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RoomServices roomServices = new RoomServices();
        try
        {
            string id = Request.QueryString["id"].ToString();
            if (id != null)
            {
                showRooms.DataSource = roomServices.getListProvince(id);
                showRooms.DataBind();
            }
        } catch(Exception ex)
        {
            Response.Redirect("/home.aspx");
        }
        
    }
}