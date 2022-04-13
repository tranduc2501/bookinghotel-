<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="danhsachkhachsan.aspx.cs" Inherits="danhsachkhachsan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" Runat="Server">Danh sách khách phòng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">
    <asp:DataList ID="showRooms" runat="server" RepeatColumns="2">
        <ItemTemplate>
            <div class="rows">
                <div class="col-md-12" style="border-bottom: solid 1px #33CA00; padding-bottom: 5px; margin-bottom: 20px">
                    <asp:HyperLink runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text='<%# Eval("Name") %>' ToolTip='<%# Eval("Name") %>'></asp:HyperLink><br />
                        <asp:Literal runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                      <div class="card">
                        <asp:Image runat="server" Width="370px" Height="200px"  ImageUrl='<%# DataBinder.Eval(Container.DataItem, "thumb") == null ? Eval("thumb") : "/images/imageDefault.png" %>' />
                        <div class="card-body">
                            Giá <asp:Literal runat="server" Text='<%#String.Format("{0:000,0 đ}", Eval("price")) + "/h" %>'></asp:Literal><br />
                            <asp:HyperLink runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text="Xem phòng" ToolTip="Xem phòng" CssClass="btn btn-primary"></asp:HyperLink>
                        </div>
                      </div>
                    
                </div>
                      
            </div>

        </ItemTemplate>
    </asp:DataList>
</asp:Content>

