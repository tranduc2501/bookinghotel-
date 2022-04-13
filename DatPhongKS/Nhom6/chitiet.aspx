<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="chitiet.aspx.cs" Inherits="chitiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" Runat="Server">
    Chi tiết phòng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">
    <asp:DataList ID="showRooms" runat="server">
        <ItemTemplate>
            <div class="rows">
                <div class="col-md-12">
                    <div class="row">
<div class="mb-5 col-md-12">
                        <asp:HyperLink runat="server" NavigateUrl='<%# "/chitiet.aspx?phong=" + Eval("id") %>' Text='<%# Eval("Name") %>' ToolTip='<%# Eval("Name") %>'></asp:HyperLink>
                    </div>
                    <div class="mb-2">
                        <asp:Literal runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                    </div>
                        
                    <div class="mb-2">
                        <asp:Literal runat="server" Text='<%# "Địa chỉ: " + Eval("address") %>'></asp:Literal>
                    </div>
                        
                      <div class="card">
                        <asp:Image runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "thumb") != null ? Eval("thumb") : "/images/imageDefault.png" %>' />
                        <div class="card-body">
                            <asp:TextBox runat="server" ID="roomid" style="display: none;" Text='<%# Eval("id") %>'></asp:TextBox>
                            
                            Giá <asp:Literal runat="server" Text='<%#String.Format("{0:000,0 đ}", Eval("price")) + "/h" %>'></asp:Literal><br />

                            <div class="form-group">
                                Ngày đến: <asp:TextBox runat="server" ID="txtDateStart" TextMode="DateTimeLocal" CssClass="txtDateStart"></asp:TextBox> - 
                                Ngày Rời: <asp:TextBox runat="server" ID="txtDateEnd" textmode="DateTimeLocal" CssClass="txtDateStart"/><br />
                            </div>
                            <div class="form-group">
                                <label>Ghi chú:</label>
                                <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Button runat="server" OnClick="DatPhong_Click" Text="Đặt phòng" ToolTip="Đặt phòng" CssClass="btn btn-primary"></asp:Button>
                        </div>
                      </div>
                    </div>
                    
                    
                </div>
                      
            </div>

        </ItemTemplate>
    </asp:DataList>
</asp:Content>

