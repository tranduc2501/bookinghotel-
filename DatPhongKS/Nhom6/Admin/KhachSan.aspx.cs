using BUS;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_KhachSan : System.Web.UI.Page
{
    public static bool insert = true;
    public static string fileUpLoad_nho;
    public static string[] fileUpLoad_lon = new string[5];
    HotelServices hotelServices = new HotelServices();
    DistrictServices districtServices = new DistrictServices();
    ProvinceServices provinceServices = new ProvinceServices();
    UserServices userServices = new UserServices();
    void LoadProvince()
    {

        DataTable DataPro = provinceServices.getList();
        List<Province> listPro = provinceServices.convertList(DataPro);
        cbbTenTinh.DataSource = listPro;
        cbbTenTinh.DataTextField = "ProvinceName";
        cbbTenTinh.DataValueField = "ProvinceID";
        cbbTenTinh.DataBind();
        LoadDistrict();
    }
    void LoadDistrict()
    {
        int idTinh = int.Parse(cbbTenTinh.SelectedValue);
        DataTable DataDis = districtServices.getListFromProvince(idTinh);
        List<District> listDis = districtServices.convertList(DataDis);
        cbbTenHuyen.DataSource = listDis;
        cbbTenHuyen.DataTextField = "DistrictName";
        cbbTenHuyen.DataValueField = "DistrictID";
        cbbTenHuyen.DataBind();
    }
    void LoadUser()
    {
        List<User> listUser = new List<User>();
        if (Session["MRole"].ToString() == "1")
        {
            DataTable dataUser = userServices.getList();
            listUser = userServices.convertList(dataUser);
        }
        else
        {
            User user = new User();
            user.Id = int.Parse(Session["MUserID"].ToString());
            user.Email = Session["MEmail"].ToString();
            listUser.Add(user);
        }
        cbbChuKhachSan.DataSource = listUser;
        cbbChuKhachSan.DataTextField = "Email";
        cbbChuKhachSan.DataValueField = "Id";
        cbbChuKhachSan.DataBind();
    }
    protected void cbbTenTinh_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDistrict();
    }
    void getData()
    {
        DataTable data;
        if(Session["MRole"].ToString() == "1")
        {
           data = hotelServices.getListFullInfor();
        }
        else
        {
            data = hotelServices.getListFullInfor(int.Parse(Session["MUserID"].ToString()));
        }
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
            LoadUser();
            getData();
        }
    }

    protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
    {

    }
    public void ClearText()
    {
        txtID.Text = "";
        cbbChuKhachSan.SelectedIndex = -1;
        cbbTenTinh.SelectedIndex = -1;
        cbbTenHuyen.SelectedIndex = -1;
        txbDiaChi.Text = "";
        txbDienThoai.Text = "";
        txbTomTat.Text = "";
        ckeMota.Text = "";
        txbNgay.Text = "";
        ckbActive.Checked = true;
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
                Hotel hotel = hotelServices.getHoTelById(int.Parse(id));
                string[] listImage = hotel.Images.Split(',');
                

                pnInfo.Visible = true;
                pnData.Visible = false;

                insert = false;
                fileUpLoad_nho = hotel.Thumb;
                for(int t = 0; t< listImage.Count(); ++t)
                {
                    fileUpLoad_lon[t] = listImage[t];
                }
                txtID.Text = hotel.Id.ToString();
                txbTenKhachSan.Text = hotel.Name;
                cbbTenTinh.SelectedValue = hotel.ProvinceID.ToString();
                cbbTenHuyen.SelectedValue = hotel.DistrictID.ToString();
                cbbChuKhachSan.SelectedValue = hotel.UserID.ToString();
                txbDiaChi.Text = hotel.Address;
                txbDienThoai.Text = hotel.Phone;
                txbTomTat.Text = hotel.ShortDes;
                txbNgay.Text = hotel.CreatAt.ToString("dd/MM/yyyy");
                ckeMota.Text = hotel.Description;
                ckbActive.Checked = hotel.Status == 1 ? true : false;
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
                error += hotelServices.delete(int.Parse(id));
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
        Hotel hotel = hotelServices.getHoTelById(i);
        string[] listImage = hotel.Images.Split(',');


        pnInfo.Visible = true;
        pnData.Visible = false;

        insert = false;
        fileUpLoad_nho = hotel.Thumb;
        for (int t = 0; t < listImage.Count(); ++t)
        {
            fileUpLoad_lon[t] = listImage[t];
        }
        txtID.Text = hotel.Id.ToString();
        txbTenKhachSan.Text = hotel.Name;
        cbbTenTinh.SelectedValue = hotel.ProvinceID.ToString();
        cbbChuKhachSan.SelectedValue = hotel.UserID.ToString();
        txbDiaChi.Text = hotel.Address;
        txbDienThoai.Text = hotel.Phone;
        txbTomTat.Text = hotel.ShortDes;
        txbNgay.Text = hotel.CreatAt.ToString("dd/MM/yyyy");
        ckeMota.Text = hotel.Description;
        ckbActive.Checked = hotel.Status == 1 ? true : false;
    }

    protected void lbDelete_Command(object sender, CommandEventArgs e)
    {
        int i = Int32.Parse(e.CommandArgument.ToString());
        hotelServices.delete(i);
        getData();
    }

    protected void btnSave_Top_Click(object sender, EventArgs e)
    {
        Hotel hotel = new Hotel();
        if (insert == true)
        {
            hotel.Name = txbTenKhachSan.Text;
            hotel.UserID = int.Parse(cbbChuKhachSan.SelectedValue);
            hotel.ProvinceID = int.Parse(cbbTenTinh.SelectedValue);
            hotel.DistrictID = int.Parse(cbbTenHuyen.SelectedValue);
            hotel.Address = txbDiaChi.Text;
            hotel.Phone = txbDienThoai.Text;
            hotel.CreatAt = DateTime.Now;
            hotel.ShortDes = txbTomTat.Text;
            hotel.Description = ckeMota.Text;
            if (!hotelServices.CheckFullInfor(hotel))
            {
                Response.Write("<script>alert('Hãy điền đầy đủ thông tin')</script>");
                return;
            }
            List< FileUpload> HinhAnh = new List<FileUpload>();
            HinhAnh.Add(ful_hinhanhlon1);
            HinhAnh.Add(ful_hinhanhlon2);
            HinhAnh.Add(ful_hinhanhlon3);
            HinhAnh.Add(ful_hinhanhlon4);
            HinhAnh.Add(ful_hinhanhlon5);
            string listUrl = "";
            for (int i = 0; i< HinhAnh.Count; ++i)
            {
                if (HinhAnh[i].HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(HinhAnh[i].FileName);
                        string filename = HinhAnh[i].FileName.ToString(); ;
                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                        {
                            HinhAnh[i].SaveAs(Server.MapPath("~/images/hotel/") + filename);
                            listUrl += "~/images/hotel/" + filename + ",";
                        }
                        else
                        {
                            Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                            return;
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
            hotel.Images = listUrl;
            if (ful_hinhanhnho.HasFile)
            {
                try
                {
                    string Duoi_filename = Path.GetExtension(ful_hinhanhnho.FileName);
                    string filename = ful_hinhanhnho.FileName.ToString(); ;
                    if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                    {
                        ful_hinhanhnho.SaveAs(Server.MapPath("~/images/hotel/thumb/") + filename);
                        hotel.Thumb = "~/images/hotel/thumb/" + filename;
                    }
                    else
                    {
                        Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                        return;
                    }

                }
                catch (Exception ex)
                {

                }
            }


            hotel.Status = ckbActive.Checked == true ? 1 : 2;
            hotelServices.insert(hotel);
            Response.Write("<script>alert('Insert thành công!!!')</script>");
            getData();
        }
        else
        {
            hotel.Id = int.Parse(txtID.Text);
            hotel.Name = txbTenKhachSan.Text;
            hotel.UserID = int.Parse(cbbChuKhachSan.SelectedValue);
            hotel.ProvinceID = int.Parse(cbbTenTinh.SelectedValue);
            hotel.DistrictID = int.Parse(cbbTenHuyen.SelectedValue);
            hotel.Address = txbDiaChi.Text;
            hotel.Phone = txbDienThoai.Text;
            hotel.CreatAt = DateTime.Now;
            hotel.ShortDes = txbTomTat.Text;
            hotel.Description = ckeMota.Text;
            if (!hotelServices.CheckFullInfor(hotel))
            {
                Response.Write("<script>alert('Hãy điền đầy đủ thông tin')</script>");
                return;
            }
            List<FileUpload> HinhAnh = new List<FileUpload>();
            HinhAnh.Add(ful_hinhanhlon1);
            HinhAnh.Add(ful_hinhanhlon2);
            HinhAnh.Add(ful_hinhanhlon3);
            HinhAnh.Add(ful_hinhanhlon4);
            HinhAnh.Add(ful_hinhanhlon5);
            string listUrl = "";
            for (int i = 0; i < HinhAnh.Count; ++i)
            {
                if (HinhAnh[i].HasFile)
                {
                    try
                    {
                        string Duoi_filename = Path.GetExtension(HinhAnh[i].FileName);
                        string filename = HinhAnh[i].FileName.ToString(); ;
                        if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                        {
                            HinhAnh[i].SaveAs(Server.MapPath("~/images/hotel/") + filename);
                            listUrl += "~/images/hotel/" + filename + ",";
                        }
                        else
                        {
                            Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                            return;
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }
                else
                {
                    if (fileUpLoad_lon[i] != null &&  fileUpLoad_lon[i].Length > 0)
                    {
                        listUrl += fileUpLoad_lon[i] + ",";
                    }
                }
            }
            hotel.Images = listUrl;
            if (ful_hinhanhnho.HasFile)
            {
                try
                {
                    string Duoi_filename = Path.GetExtension(ful_hinhanhnho.FileName);
                    string filename = ful_hinhanhnho.FileName.ToString(); ;
                    if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                    {
                        ful_hinhanhnho.SaveAs(Server.MapPath("~/images/hotel/thumb/") + filename);
                        hotel.Thumb = "~/images/hotel/thumb/" + filename;
                    }
                    else
                    {
                        Response.Write("<script>alert('Bạn chỉ được upload jpg,png,jpeg')</script>");
                        return;
                    }

                }
                catch (Exception ex)
                {

                }
            }
            else
            {
                hotel.Thumb = fileUpLoad_nho;
            }


            hotel.Status = ckbActive.Checked == true ? 1 : 2;
            hotelServices.Update(hotel);
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
}