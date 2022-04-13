using BUS;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    UserServices userServices = new UserServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        txtUserName.Text.Trim();
        txtPassWord.Text.Trim();
        if (txtUserName.Text == "" || txtPassWord.Text == "")
        {
            lbError.Text = "Bạn phải nhập đầy đủ email và password!!!";
            return;
        }
        else
        {
            List<User> lst = userServices.getList(txtUserName.Text.ToString(), txtPassWord.Text.ToString());
            if (lst.Count > 0)
            {
                if(lst[0].Role == 3)
                {
                    lbError.Text = "Bạn không có quyền truy cập trang này!!";
                }
                else
                {
                    Session["MUserID"] = lst[0].Id;
                    Session["MEmail"] = lst[0].Email;
                    Session["MRole"] = lst[0].Role;
                    Response.Redirect("KhachSan.aspx");
                }
            }
            else
            {
                lbError.Text = "Tài khoản hoặc mật khẩu không đúng!!";
            }
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {

    }
}