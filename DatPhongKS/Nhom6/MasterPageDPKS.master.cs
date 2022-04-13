using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
public partial class MasterPageDPKS : System.Web.UI.MasterPage
{
    RoomServices room = new RoomServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                if (Int32.Parse(Session["UserID"].ToString()) != -1)
                {
                    btnDangKi.Visible = false;
                    btnDangNhap.Visible = false;
                    txtThongTinCaNhan.Visible = true;
                    btnDangXuat.Visible = true;
                    txtThongTinCaNhan.Text = Session["Email"].ToString();

                }
            }
            
            else
            {
                btnDangKi.Visible = true;
                btnDangNhap.Visible = true;
                txtThongTinCaNhan.Visible = false;
                btnDangXuat.Visible = false;
            }
      
            ListViewPhongTheoTinh.DataSource = room.getListGroupByProvince();
            ListViewPhongTheoTinh.DataBind();
        }





    }

    protected void btnDangNhap_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Login.aspx");
    }

    protected void btnDangXuat_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("/Home.aspx");
    }

    protected void btnDangKi_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Register.aspx");

    }

    protected void Timkiem(object sender, EventArgs e)
    {
        Response.Redirect("/timkiem.aspx?query="+ txtSearch.Text);
    }
}
