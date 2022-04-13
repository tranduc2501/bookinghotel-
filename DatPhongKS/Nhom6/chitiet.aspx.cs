using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class chitiet : System.Web.UI.Page
{

    RoomServices roomServices = new RoomServices();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            try {
                string id = Request.QueryString["phong"].ToString();
                //if(id != null)
                //{
                //string datphong = Request.QueryString["datphong"].ToString();
                showRooms.DataSource = roomServices.getRoom(id);
                showRooms.DataBind();
                //}
            } catch(Exception exception)
            {
                Response.Redirect("home.aspx");
            }


        }
        
        
    }

    protected void DatPhong_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < showRooms.Controls.Count; i++)
        {
            if (Session["UserID"] == null)
            {
                //Response.Redirect("login.aspx?");
                Response.Write("<script>alert('Bạn chưa đăng nhập!!!'); window.location.href = '/login.aspx';</script>");
            } else
            // if controls named "lbl1" & "lbl2" exist
            if (showRooms.Items[i].FindControl("txtDateStart") != null && showRooms.Items[i].FindControl("txtDateEnd") != null)
            {
                Response.Write("<script>alert('"+ Session["UserID"].ToString() + "');</script>");
                // cast the controls to TextBoxes and then get their Text Property
                string start = ((TextBox)showRooms.Items[i].FindControl("txtDateStart")).Text;
                string end = ((TextBox)showRooms.Items[i].FindControl("txtDateEnd")).Text;
                string txtDescription = ((TextBox)showRooms.Items[i].FindControl("txtDescription")).Text;
                string roomid = ((TextBox)showRooms.Items[i].FindControl("roomid")).Text;
                if (txtDescription == "")
                {
                    Response.Redirect("datphong.aspx?start=" + start + "&end=" + end + "&roomID=" + roomid);
                } else Response.Redirect("datphong.aspx?start="+ start +"&end="+ end + "&roomID=" + roomid + "&description=" + txtDescription + "");
                
            }
        }
    }

}