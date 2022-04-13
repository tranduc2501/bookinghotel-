using BUS;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_User : System.Web.UI.Page
{
    public static bool insert = true;
    public static string fileUpLoad_nho;
    public static string[] fileUpLoad_lon = new string[5];
    UserServices userServices = new UserServices();
    ProvinceServices provinceServices = new ProvinceServices();
    DistrictServices districtServices = new DistrictServices();

    void LoadProvince()
    {

        DataTable DataPro = provinceServices.getList();
        List<Province> listPro = provinceServices.convertList(DataPro);
        cbbTinh.DataSource = listPro;
        cbbTinh.DataTextField = "ProvinceName";
        cbbTinh.DataValueField = "ProvinceID";
        cbbTinh.DataBind();
        LoadDistrict();
    }
    void LoadDistrict()
    {
        int idTinh = int.Parse(cbbTinh.SelectedValue);
        DataTable DataDis = districtServices.getListFromProvince(idTinh);
        List<District> listDis = districtServices.convertList(DataDis);
        cbbHuyen.DataSource = listDis;
        cbbHuyen.DataTextField = "DistrictName";
        cbbHuyen.DataValueField = "DistrictID";
        cbbHuyen.DataBind();
    }
    void getData()
    {
        DataTable data = userServices.getListFullInfor();

        grvKhachSan.DataSource = data;
        grvKhachSan.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MUserID"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadProvince();
            getData();
        }
    }

    protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
    {

    }
    public void ClearText()
    {
        txbID.Text = "";
        txbPhone.Text = "";
        txbCmt.Text = "";
        txbDiaChi.Text = "";
    }
    protected void btnAdd_Top_Click(object sender, EventArgs e)
    {
        insert = true;
        pnData.Visible = false;
        pnInfo.Visible = true;
        ClearText();
    }

    protected void btnAdd_Top_Command(object sender, CommandEventArgs e)
    {

    }


    protected void btnEdit_Top_Command(object sender, CommandEventArgs e)
    {
        int i = 0;
        string id;
        foreach (GridViewRow gvrow in grvKhachSan.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("CkDelete");
            if (chk != null && chk.Checked)
            {
                id = grvKhachSan.Rows[i].Cells[1].Text;
                User user = userServices.getUserByID(int.Parse(id));


                pnInfo.Visible = true;
                pnData.Visible = false;

                insert = false;

                txbID.Text = user.Id.ToString();
                txbEmail.Text = user.Email.ToString();
                cbbTinh.SelectedValue = user.ProvinceID.ToString();
                LoadDistrict();
                cbbHuyen.SelectedValue = user.DistrictID.ToString();
                txbDiaChi.Text = user.Address.ToString();
                cbbQuyen.SelectedValue = user.Role.ToString();
                txbCmt.Text = user.Cmt.ToString();
                txbPhone.Text = user.Phone.ToString();
                txbNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
                ckbActive.Checked = user.Status == 1 ? true : false;
                return;
            }
            i++;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int i = 0;
        string id;
        int error = 0;
        foreach (GridViewRow gvrow in grvKhachSan.Rows)
        {
            CheckBox chk = (CheckBox)gvrow.FindControl("CkDelete");
            if (chk != null && chk.Checked)
            {
                id = grvKhachSan.Rows[i].Cells[1].Text;
                error += userServices.delete(int.Parse(id));
            }
            i++;
        }
        getData();
    }

    protected void lbAddSub_Command(object sender, CommandEventArgs e)
    {
        insert = true;
        pnData.Visible = false;
        pnInfo.Visible = true;
        ClearText();
    }

    protected void lbEdit_Command(object sender, CommandEventArgs e)
    {
        int i = Int32.Parse(e.CommandArgument.ToString());
        User user = userServices.getUserByID(i);


        pnInfo.Visible = true;
        pnData.Visible = false;

        insert = false;

        txbID.Text = user.Id.ToString();
        txbEmail.Text = user.Email.ToString();
        cbbTinh.SelectedValue = user.ProvinceID.ToString();
        LoadDistrict();
        cbbHuyen.SelectedValue = user.DistrictID.ToString();
        txbDiaChi.Text = user.Address.ToString();
        cbbQuyen.SelectedValue = user.Role.ToString();
        txbCmt.Text = user.Cmt.ToString();
        txbPhone.Text = user.Phone.ToString();
        txbNgay.Text = DateTime.Now.ToString("dd/MM/yyyy");
        ckbActive.Checked = user.Status == 1 ? true : false;
        return;
    }

    protected void lbDelete_Command(object sender, CommandEventArgs e)
    {
        int i = Int32.Parse(e.CommandArgument.ToString());
        userServices.delete(i);
        getData();
    }

    protected void btnSave_Top_Click(object sender, EventArgs e)
    {
        User user = new User();
        if (insert == true)
        {
            user.Email = txbEmail.Text;
            user.Password = "123456";
            user.ProvinceID = int.Parse(cbbTinh.SelectedValue);
            user.DistrictID = int.Parse(cbbHuyen.SelectedValue);
            user.Address = txbDiaChi.Text;
            user.Role = int.Parse(cbbQuyen.SelectedValue);
            user.Cmt = txbCmt.Text;
            user.Phone = txbPhone.Text;
            user.Status = (ckbActive.Checked == true ? 1 : 2);



            if (!userServices.CheckFullInfor(user))
            {
                Response.Write("<script>alert('Hãy điền chính xác thông tin')</script>");
                return;
            }
            userServices.insert(user);
            Response.Write("<script>alert('Insert thành công!!!')</script>");
            getData();
        }
        else
        {
            user.Id = int.Parse(txbID.Text.ToString());
            user.Email = txbEmail.Text;
            user.Password = "123456";
            user.ProvinceID = int.Parse(cbbTinh.SelectedValue);
            user.DistrictID = int.Parse(cbbHuyen.SelectedValue);
            user.Address = txbDiaChi.Text;
            user.Role = int.Parse(cbbQuyen.SelectedValue);
            user.Cmt = txbCmt.Text;
            user.Phone = txbPhone.Text;
            user.Status = (ckbActive.Checked == true ? 1 : 2);

            if (!userServices.CheckFullInfor(user))
            {
                Response.Write("<script>alert('Hãy điền chính xác thông tin')</script>");
                return;
            }
            userServices.update(user);
            Response.Write("<script>alert('Update thành công!!!')</script>");
            getData();
        }
        insert = true;
        pnData.Visible = true;
        pnInfo.Visible = false;
        ClearText();
    }

    protected void btnReturn_Top_Click(object sender, EventArgs e)
    {

    }

    protected void btnReturn_Top_Command(object sender, CommandEventArgs e)
    {
        ClearText();
        pnData.Visible = true;
        pnInfo.Visible = false;
        getData();
    }

    protected void grvKhachSan_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
            e.Row.TableSection = TableRowSection.TableHeader;
    }

    protected void grvKhachSan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvKhachSan.PageIndex = e.NewPageIndex;
        getData();
    }

    protected void cbbTinh_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDistrict();
    }
}