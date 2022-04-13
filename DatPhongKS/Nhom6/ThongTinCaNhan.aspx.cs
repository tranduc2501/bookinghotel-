using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DTO;
public partial class ThongTinCaNhan : System.Web.UI.Page
{
    AddressService addressService = new AddressService();
    UserServices userServices = new UserServices();
    User user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlthanhpho.DataSource = addressService.getListPrivince();
            ddlthanhpho.DataBind();
            ddlthanhpho.Items.Insert(0, "-- Chọn thành phố --");


            string email = ""+Session["Email"];
            if (!email.Equals(""))
            {
                user = userServices.getInfo(email);
                txtusername.Text = user.Email.Trim();
                txtCMT.Text = user.Cmt.Trim();
                txtdiachi.Text = user.Address.Trim();
                txtdienthoai.Text = user.Phone.Trim();

                int provinceid = user.ProvinceID;
                

                ddlthanhpho.SelectedIndex = ddlthanhpho.Items.IndexOf(ddlthanhpho.Items.FindByValue(provinceid.ToString()));

                ddlquan.DataSource = addressService.getListDistrict(Int32.Parse(ddlthanhpho.SelectedValue.ToString()));
                ddlquan.DataBind();
                ddlquan.Items.Insert(0, "-- Chọn quận/huyện --");
                ddlquan.SelectedIndex = ddlquan.Items.IndexOf(ddlquan.Items.FindByValue(user.DistrictID.ToString())); ;

                if (user.Role == 3)
                {
                    rdobtnNguoiThuong.Checked = true;
                }else if(user.Role == 2)
                {
                    rdobtnChuKhachSan.Checked = true;

                }
                else
                {
                    rdobtnChuKhachSan.Visible = false;
                    rdobtnNguoiThuong.Visible = false;
                }

            }



        }
    }




    protected void btnCapNhat_Click(object sender, EventArgs e)
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
            }
            else
            if (ddlthanhpho.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Chưa chọn tỉnh thành');</script>");
                isOke = false;

            }
            if (isOke)
            {
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

                int status = userServices.update(obj);
                if (status == 0)
                {
                    Response.Write("<script>alert('Lỗi !');</script>");

                }
                else if (status == 1)
                {
                    Response.Write("<script>alert('Cập nhật thành công!!');</script>");

                }
            }

        }
        catch { }

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