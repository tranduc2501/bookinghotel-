using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data.SqlClient;
using BUS;
using DTO;
public partial class Login : System.Web.UI.Page
{
    UserServices userServices = new UserServices();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDangNhap_Click(object sender, EventArgs e)
    {
        if (txtusername.Text == "" || txtpassword.Text == "")
        {
            lblcheck.Text = "Bạn phải nhập đầy đủ email và password!!!";
            return;
        }
        else
        {
            List<User> lst = userServices.getList(txtusername.Text.ToString(),txtpassword.Text.ToString());
            if (lst.Count > 0)
            {
                Session["UserID"] = lst[0].Id;
                Session["Email"] = lst[0].Email;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblcheck.Text = "Tài khoản hoặc mật khẩu không đúng!!";
            }
        }

    }
}