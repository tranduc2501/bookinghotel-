<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="Khachsan.aspx.cs" Inherits="Khachsan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" Runat="Server">Tất cả khách sạn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">
     <asp:DataList ID="showRooms" runat="server" RepeatColumns="2">
        <ItemTemplate>
            <div class="rows">
                <div class="col-md-12" style="border-bottom: solid 1px #33CA00; padding-bottom: 5px; margin-bottom: 20px">
                    <asp:HyperLink runat="server" NavigateUrl='<%# "/danhsachkhachsan.aspx?id=" + Eval("id") %>' Text='<%# Eval("Name") %>' ToolTip='<%# Eval("Name") %>'></asp:HyperLink><br />
                        <asp:Literal runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                      <div class="card">
                        <asp:Image runat="server"  Width="370px" Height="200px"  ImageUrl='<%# DataBinder.Eval(Container.DataItem, "thumb") != null ? Eval("thumb") : "/images/imageDefault.png" %>' />
                        <div class="card-body">
                            <asp:HyperLink runat="server" NavigateUrl='<%# "/danhsachkhachsan.aspx?id=" + Eval("id") %>' Text="Xem tất cả phòng" ToolTip="Xem tất cả phòng" CssClass="btn btn-primary"></asp:HyperLink>
                        </div>
                      </div>
                    
                </div>
                      
            </div>

        </ItemTemplate>
    </asp:DataList>
</asp:Content>

