using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class PhongTheoTinh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RoomServices roomServices = new RoomServices();
        try
        {
            
            string id = Request.QueryString["provinceID"].ToString();
            
            if (id != null)
            {
                txtTinh.Text = roomServices.getNameProvince(id);
                showRooms.DataSource = roomServices.getListProvince(id);
                showRooms.DataBind();
            }
        }
        catch
        {

        }

    }
}