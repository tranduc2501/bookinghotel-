using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class huyphongdadat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            BookingService bs = new BookingService();
            string id = Request.QueryString["id"].ToString();
            if (id != null)
            {
                bs.Huy(id);
                Response.Write("<script>alert('Bạn đã đặt phòng thành công!!!'); window.location.href = '/datphong.aspx';</script>");
            } else
            {
                Response.Redirect("datphong.aspx");
            }

        } catch(Exception ex) {
            Response.Redirect("datphong.aspx");
        }
    }
}