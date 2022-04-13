using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DTO;
public partial class Register : System.Web.UI.Page
{
    AddressService addressService = new AddressService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlthanhpho.DataSource = addressService.getListPrivince();
            ddlthanhpho.DataBind();
            ddlthanhpho.Items.Insert(0, "-- Chọn thành phố --");
        }            


    }

   

    protected void btndangki_Click(object sender, EventArgs e)
    {


        try
        {


            bool isOke = true;
            if (!txtpassword.Text.ToString().Equals(txtrepressPassword.Text.ToString()))
            {
                Response.Write("<script>alert('Mật khẩu không trùng nhau!');</script>");
                isOke = false;
            }
            if (ddlquan.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Chưa chọn quận/huyện');</script>");
                isOke = false;
            }else
            if (ddlthanhpho.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Chưa chọn tỉnh thành');</script>");
                isOke = false;

            }
            if (isOke)
            {
                UserServices userServices = new UserServices();
                User obj = new User();
                obj.Email = txtusername.Text;
                obj.Password = txtpassword.Text;
                obj.Cmt = txtCMT.Text;
                if (rdobtnNguoiThuong.Checked == true)
                    obj.Role = 3;
                else
                    obj.Role = 2;
                obj.Phone = txtdienthoai.Text;
                obj.ProvinceID = Int32.Parse(ddlthanhpho.SelectedItem.Value.ToString());
                obj.DistrictID = Int32.Parse(ddlquan.SelectedItem.Value.ToString());
                obj.Address = txtdiachi.Text;

                int status = userServices.register(obj);
                if (status == 1)
                {
                    Response.Write("<script>alert('Email đã trùng');</script>");

                }
                else if (status == 2)
                {
                    Response.Write("<script>alert('Có lỗi xảy ra');</script>");

                }
                else if (status == 3)
                {
                    Response.Write("<script>alert('Đăng kí thành công!!');</script>");
                    Response.Redirect("/Login.aspx");

                }
            }

        }
        catch { }

    }

    protected void btnhuy_Click(object sender, EventArgs e)
    {
        reset();
    }

    void reset()
    {
        txtusername.Text = "";
        txtCMT.Text = "";
        txtdiachi.Text = "";
        txtdienthoai.Text = "";
        txtpassword.Text = "";
        txtrepressPassword.Text = "";
        ddlthanhpho.SelectedIndex = 0;
        ddlquan.SelectedIndex = 0;
        rdobtnNguoiThuong.Checked = true;
    }
    protected void ddlthanhpho_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            try
            {
                ddlquan.DataSource = addressService.getListDistrict(Int32.Parse(ddlthanhpho.SelectedValue.ToString()));
                ddlquan.DataBind();
                ddlquan.Items.Insert(0, "-- Chọn quận/huyện --");
            }
            catch { }


        }

        try
        {
            
        }
        catch (Exception ex)
        {

        }
    }

}