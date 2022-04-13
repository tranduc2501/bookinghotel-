<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="DaThue.aspx.cs" Inherits="DaThue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" Runat="Server">Đã thuê
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">
    <h4 style="text-align: center">Danh sách phòng bạn đã thuê</h4>
    <asp:DataList ID="showRooms" runat="server" RepeatColumns="2">
        <ItemTemplate>
            <div class="rows">
                <div class="col-md-12" style="border-bottom: solid 1px #33CA00; padding-bottom: 5px; margin-bottom: 20px">
 
                    <asp:HyperLink runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text='<%# Eval("Name") %>' ToolTip='<%# Eval("Name") %>'></asp:HyperLink><br />
                        <asp:Literal runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                      <div class="card">
                        <asp:Image runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "thumb") != null ? Eval("thumb") : "/images/imageDefault.png" %>' />
                        <div class="card-body">
                            Giá <asp:Literal runat="server" Text='<%#String.Format("{0:000,0 đ}", Eval("price")) + "/h" %>'></asp:Literal><br />
                            <asp:Literal runat="server" Text='<%# Eval("bkdes") %>'></asp:Literal><br />
                            Ngày bắt đầu: <asp:Literal runat="server" Text='<%# Eval("timeStart") %>'></asp:Literal>
                            - Ngày kết thúc: <asp:Literal runat="server" Text='<%# Eval("timeEnd") %>'></asp:Literal><br />
                            <asp:HyperLink runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text="Xem phòng" ToolTip="Xem phòng" CssClass="btn btn-primary"></asp:HyperLink>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "/huyphongdadat.aspx?id=" + Eval("bkid") %>' Text="Hủy phòng" ToolTip="Hủy phòng" CssClass="btn btn-danger"></asp:HyperLink>
                        </div>
                      </div>
                    
                </div>
                      
            </div>

        </ItemTemplate>
    </asp:DataList>
</asp:Content>

