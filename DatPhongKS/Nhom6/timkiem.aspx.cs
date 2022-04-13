using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

public partial class timkiem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Common_ common = new Common_();
        try
        {
            string id = Request.QueryString["query"].ToString();
            if (id != null)
            {
                showRooms.DataSource = common.searchItem(id);
                showRooms.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("/home.aspx");
        }
    }
}