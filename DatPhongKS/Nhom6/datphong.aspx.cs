using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class datphong : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        BookingService bs = new BookingService();

        try
        {
            string start = Request.QueryString["start"].ToString();
            string end = Request.QueryString["end"].ToString();
            string roomid = Request.QueryString["roomID"].ToString();

            if (Session["UserID"] != null)
            {
                if (Request.QueryString["description"] != null)
                {
                    string description = Request.QueryString["description"];
                //Response.Write("<script>alert('"+ dateTime.ToString() +"');");

                bs.insertBooking(Session["UserID"].ToString(), roomid, start.Replace("T", " ").ToString(), end.Replace("T", " ").ToString(), description);
                Response.Write("<script>alert('Bạn đã đặt phòng thành công!!!'); window.location.href = '/';</script>");
            }
                else
            { 
                    
                    bs.insertBooking(Session["UserID"].ToString(), roomid, start.Replace("T", " ").ToString(), end.Replace("T", " ").ToString());
                    Response.Write("<script>alert('Bạn đã đặt phòng thành công!!!'); window.location.href = '/';</script>");
            }
            //bs.insertBooking(Session["UserID"].ToString(), id);
            }
            else
            {
                Response.Write("<script>alert('Bạn chưa đăng nhập!!!'); window.location.href = '/login.aspx';</script>");
            }
        } catch(Exception exception)
        {
           Response.Redirect("home.aspx");
        }
        
        
    }
}