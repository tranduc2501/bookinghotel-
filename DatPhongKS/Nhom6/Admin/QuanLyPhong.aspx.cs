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

public partial class Admin_QuanLyPhong : System.Web.UI.Page
{
    public static bool insert = true;
    public static string fileUpLoad_nho;
    public static string[] fileUpLoad_lon = new string[5];
    HotelServices hotelServices = new HotelServices();
    UserServices userServices = new UserServices();
    RoomServices roomServices = new RoomServices();
    
    void LoadHotel()
    {
        List<Hotel> listHotel = new List<Hotel>();
        if (Session["MRole"].ToString() == "1")
        {
            DataTable dataUser = hotelServices.getList();
            listHotel = hotelServices.convertList(dataUser);
        }
        else
        {
            DataTable dataUser = hotelServices.getList(int.Parse(Session["MUserID"].ToString()));
            listHotel = hotelServices.convertList(dataUser);
        }
        ddlHotel.DataSource = listHotel;
        ddlHotel.DataTextField = "Name";
        ddlHotel.DataValueField = "Id";
        ddlHotel.DataBind();

        cbbKhachSan.DataSource = listHotel;
        cbbKhachSan.DataTextField = "Name";
        cbbKhachSan.DataValueField = "Id";
        cbbKhachSan.DataBind();
    }
    void getData()
    {
        DataTable data;
        data = roomServices.getListFullInfor(int.Parse(ddlHotel.SelectedValue));
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
            LoadHotel();
            getData();
        }
    }

    protected void btnRefresh_Top_Command(object sender, CommandEventArgs e)
    {

    }
    public void ClearText()
    {
        txtID.Text = "";
        txbTenPhong.Text = "";
        txbGia.Text = "";
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
                Room room = roomServices.getRoomById(int.Parse(id));
                string[] listImage = room.Images.Split(',');


                pnInfo.Visible = true;
                pnData.Visible = false;

                insert = false;
                fileUpLoad_nho = room.Thumb;
                for (int t = 0; t < listImage.Count(); ++t)
                {
                    fileUpLoad_lon[t] = listImage[t];
                }
                txtID.Text = room.Id.ToString();
                txbTenPhong.Text = room.Name.ToString();
                txbGia.Text = room.Price.ToString();
                cbbKhachSan.SelectedValue = room.HotelID.ToString();
                txbNgay.Text = room.CreateAt.ToString("dd/MM/yyyy");
                ckeMota.Text = room.Description;
                ckbActive.Checked = room.Status == 1 ? true : false;
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
                error += roomServices.delete(int.Parse(id));
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
        Room room = roomServices.getRoomById(i);
        string[] listImage = room.Images.Split(',');


        pnInfo.Visible = true;
        pnData.Visible = false;

        insert = false;
        fileUpLoad_nho = room.Thumb;
        for (int t = 0; t < listImage.Count(); ++t)
        {
            fileUpLoad_lon[t] = listImage[t];
        }
        txtID.Text = room.Id.ToString();
        txbTenPhong.Text = room.Name.ToString();
        txbGia.Text = room.Price.ToString();
        cbbKhachSan.SelectedValue = room.HotelID.ToString();
        txbNgay.Text = room.CreateAt.ToString("dd/MM/yyyy");
        ckeMota.Text = room.Description;
        ckbActive.Checked = room.Status == 1 ? true : false;
    }

    protected void lbDelete_Command(object sender, CommandEventArgs e)
    {
        int i = Int32.Parse(e.CommandArgument.ToString());
        roomServices.delete(i);
        getData();
    }

    protected void btnSave_Top_Click(object sender, EventArgs e)
    {
        Room room= new Room();
        if (insert == true)
        {
            room.Name = txbTenPhong.Text;
            int gia = 0;
            if(int.TryParse(txbGia.Text,out gia))
            {
                room.Price = gia;
                if(room.Price <= 0)
                {
                    Response.Write("<script>alert('Hãy nhập giá lớn hơn 0');</script>");
                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('Hãy nhập giá hợp lệ');</script>");
                return;
            }
            room.CreateAt = DateTime.Now;
            room.HotelID = int.Parse(cbbKhachSan.SelectedValue);
            room.Description = ckeMota.Text;
            if (!roomServices.CheckFullInfor(room))
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
                            HinhAnh[i].SaveAs(Server.MapPath("~/images/room/") + filename);
                            listUrl += "~/images/room/" + filename + ",";
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
            room.Images = listUrl;
            if (ful_hinhanhnho.HasFile)
            {
                try
                {
                    string Duoi_filename = Path.GetExtension(ful_hinhanhnho.FileName);
                    string filename = ful_hinhanhnho.FileName.ToString(); ;
                    if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                    {
                        ful_hinhanhnho.SaveAs(Server.MapPath("~/images/room/thumb/") + filename);
                        room.Thumb = "~/images/room/thumb/" + filename;
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


            room.Status = ckbActive.Checked == true ? 1 : 2;
            roomServices.insert(room);
            Response.Write("<script>alert('Insert thành công!!!')</script>");
            getData();
        }
        else
        {
            room.Id = int.Parse(txtID.Text);
            room.Name = txbTenPhong.Text;
            int gia = 0;
            if (int.TryParse(txbGia.Text, out gia))
            {
                room.Price = gia;
                if (room.Price <= 0)
                {
                    Response.Write("<script>alert('Hãy nhập giá lớn hơn 0');</script>");
                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('Hãy nhập giá hợp lệ');</script>");
                return;
            }
            room.CreateAt = DateTime.Now;
            room.HotelID = int.Parse(cbbKhachSan.SelectedValue);
            room.Description = ckeMota.Text;
            if (!roomServices.CheckFullInfor(room))
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
                            HinhAnh[i].SaveAs(Server.MapPath("~/images/room/") + filename);
                            listUrl += "~/images/room/" + filename + ",";
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
                    if (fileUpLoad_lon[i] != null && fileUpLoad_lon[i].Length > 0)
                    {
                        listUrl += fileUpLoad_lon[i] + ",";
                    }
                }
            }
            room.Images = listUrl;
            if (ful_hinhanhnho.HasFile)
            {
                try
                {
                    string Duoi_filename = Path.GetExtension(ful_hinhanhnho.FileName);
                    string filename = ful_hinhanhnho.FileName.ToString(); ;
                    if (Duoi_filename == ".jpeg" || Duoi_filename == ".jpg" || Duoi_filename == ".png" || Duoi_filename == ".PNG" || Duoi_filename == ".JPG" || filename == ".JPEG")
                    {
                        ful_hinhanhnho.SaveAs(Server.MapPath("~/images/room/thumb/") + filename);
                        room.Thumb = "~/images/room/thumb/" + filename;
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
                room.Thumb = fileUpLoad_nho;
            }


            room.Status = ckbActive.Checked == true ? 1 : 2;
            roomServices.Update(room);
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

    protected void ddlHotel_SelectedIndexChanged(object sender, EventArgs e)
    {
        getData();
    }
}