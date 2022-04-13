using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class DaThue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            Common_ common = new Common_();

            showRooms.DataSource = common.ShowThue(Session["UserID"].ToString());
            showRooms.DataBind();
        } else
        {
            Response.Write("<script>alert('Bạn chưa đăng nhập!!!'); window.location.href = '/login.aspx';</script>");
        }
            
    }

}