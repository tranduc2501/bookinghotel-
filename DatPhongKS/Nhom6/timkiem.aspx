<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="timkiem.aspx.cs" Inherits="timkiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" Runat="Server">Tìm kiếm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">
    <asp:DataList ID="showRooms" runat="server" RepeatColumns="2">
        <ItemTemplate>

            <div class="list-group"  style="margin: 5px">
                    <h1 class="list-group-item active">
                        <asp:HyperLink style="color:white" runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text='<%# Eval("Name") %>' ToolTip='<%# Eval("Name") %>'></asp:HyperLink></h1>
                     <div class="list-group-item">
                         <asp:Image class="card-img-top" Width="370px" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "thumb") != null ? Eval("thumb") : "/images/imageDefault.png" %>' />
                    <div class="card-body">
                        <h6 class="card-subtitle mb-2 text-muted">Giá:
                            <asp:Literal runat="server" Text='<%#String.Format("{0:000,0 đ}", Eval("price")) + "/h" %>'></asp:Literal></h6>
                            <p class="card-text"><asp:Literal runat="server" Text='<%# Eval("Description")%>'></asp:Literal></p>
                        <div style="text-align: center">
                            <asp:HyperLink class="btn btn-primary" runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text="Xem phòng" ToolTip="Xem phòng" CssClass="btn btn-primary"></asp:HyperLink></div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

