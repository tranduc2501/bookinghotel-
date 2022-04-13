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

public partial class Admin_Booking : System.Web.UI.Page
{
    public static bool insert = true;
    public static string fileUpLoad_nho;
    public static string[] fileUpLoad_lon = new string[5];
    HotelServices hotelServices = new HotelServices();
    BookingService bookingServices = new BookingService();
    RoomServices roomServices = new RoomServices();
    UserServices userServices = new UserServices();

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

        cbbTenKhachSan.DataSource = listHotel;
        cbbTenKhachSan.DataTextField = "Name";
        cbbTenKhachSan.DataValueField = "Id";
        cbbTenKhachSan.DataBind();
    }
    void LoadRoom()
    {
        List<Room> listRoom = new List<Room>();
        DataTable data = roomServices.getList(int.Parse(cbbTenKhachSan.SelectedValue));
        listRoom = roomServices.convertList(data);
        cbbTenPhong.DataSource = listRoom;
        cbbTenPhong.DataTextField = "Name";
        cbbTenPhong.DataValueField = "Id";
        cbbTenPhong.DataBind();
    }
    void LoadUser()
    {
        List<User> listUser = new List<User>();
        DataTable data = userServices.getList();
        listUser = userServices.convertList(data);
        cbbNguoiDat.DataSource = listUser;
        cbbNguoiDat.DataTextField = "email";
        cbbNguoiDat.DataValueField = "Id";
        cbbNguoiDat.DataBind();
    }
    void getData()
    {
        DataTable data = bookingServices.getListFullInfor(int.Parse(ddlHotel.SelectedValue));
        
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
        txbGhiChu.Text = "";
    }
    protected void btnAdd_Top_Click(object sender, EventArgs e)
    {
        insert = true;
        pnData.Visible = false;
        pnInfo.Visible = true;
        LoadRoom();
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
                Booking booking = bookingServices.getBookingByID(int.Parse(id));
                string hotelID = roomServices.getHotelIDByRoomID(booking.RoomID);

                pnInfo.Visible = true;
                pnData.Visible = false;

                insert = false;
                
                txtID.Text = booking.Id.ToString();
                cbbNguoiDat.SelectedValue = booking.UserID.ToString();
                cbbTenKhachSan.SelectedValue = hotelID;
                LoadRoom();
                cbbTenPhong.SelectedValue = booking.RoomID.ToString();
                txbNgay.Text = booking.CreatAt.ToString("dd/MM/yyyy");
                startDate.SelectedDate = booking.TimeStart;
                endDate.SelectedDate = booking.TimeEnd;
                txbGhiChu.Text = booking.Description;
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
                error += bookingServices.delete(int.Parse(id));
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
        LoadRoom();
        ClearText();
    }

    protected void lbEdit_Command(object sender, CommandEventArgs e)
    {
        int i = Int32.Parse(e.CommandArgument.ToString());
        Booking booking = bookingServices.getBookingByID(i);
        string hotelID = roomServices.getHotelIDByRoomID(booking.RoomID);


        pnInfo.Visible = true;
        pnData.Visible = false;

        insert = false;

        txtID.Text = booking.Id.ToString();
        cbbNguoiDat.SelectedValue = booking.UserID.ToString();
        cbbTenKhachSan.SelectedValue = hotelID;
        LoadRoom();
        cbbTenPhong.SelectedValue = booking.RoomID.ToString();
        txbNgay.Text = booking.CreatAt.ToString("dd/MM/yyyy");
        startDate.SelectedDate= booking.TimeStart;
        endDate.SelectedDate = booking.TimeEnd;
        txbGhiChu.Text = booking.Description;
    }

    protected void lbDelete_Command(object sender, CommandEventArgs e)
    {
        int i = Int32.Parse(e.CommandArgument.ToString());
        bookingServices.delete(i);
        getData();
    }

    protected void btnSave_Top_Click(object sender, EventArgs e)
    {
        Booking booking = new Booking();
        if (insert == true)
        {
            booking.UserID = int.Parse(cbbNguoiDat.SelectedValue);
            if(cbbTenPhong.SelectedValue.Length > 0)
            {
                booking.RoomID = int.Parse(cbbTenPhong.SelectedValue);
            }
            else
            {

            }
            booking.CreatAt = DateTime.Now;
            booking.TimeStart = startDate.SelectedDate;
            booking.TimeEnd = endDate.SelectedDate;
            booking.Description = txbGhiChu.Text;
            if (!bookingServices.CheckFullInfor(booking))
            {
                Response.Write("<script>alert('Hãy điền đầy đủ thông tin')</script>");
                return;
            }
            bookingServices.insert(booking);
            Response.Write("<script>alert('Insert thành công!!!')</script>");
            getData();
        }
        else
        {
            booking.Id = int.Parse(txtID.Text);
            booking.UserID = int.Parse(cbbNguoiDat.SelectedValue);
            booking.RoomID = int.Parse(cbbTenPhong.SelectedValue);
            booking.CreatAt = DateTime.Now;
            booking.TimeStart = startDate.SelectedDate;
            booking.TimeEnd = endDate.SelectedDate;
            booking.Description = txbGhiChu.Text;
            if (!bookingServices.CheckFullInfor(booking))
            {
                Response.Write("<script>alert('Hãy điền chính xác thông tin')</script>");
                return;
            }
            bookingServices.update(booking);
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

    protected void cbbTenKhachSan_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadRoom();
    }
}