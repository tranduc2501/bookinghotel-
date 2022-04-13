<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="ThongTinCaNhan.aspx.cs" Inherits="ThongTinCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" Runat="Server">
    Thông tin cá nhân
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">
    <div class="dangki">
        <asp:ScriptManager ID="id1" runat="server" />
        <asp:UpdatePanel ID="id2" runat="server">
            <ContentTemplate>
                <form>

                    <table style="margin-top: 30px;">
                        <tbody>
                            <tr>
                                <td colspan="2"><b>Thông tin tài khoản</b></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <asp:TextBox ID="txtusername" Enabled="false" type="email" class="textbox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Mật khẩu</td>
                                <td>
                                    <asp:TextBox ID="txtpassword" type="password"  placeholder="Để trống nếu không muốn thay đổi" class="textbox" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td>Gõ lại mật khẩu</td>
                                <td>
                                    <asp:TextBox ID="txtrepressPassword" type="password" placeholder="Để trống nếu không muốn thay đổi" class="textbox" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>Thông tin cá nhân</b></td>
                            </tr>
                            <tr>
                                <td>Số CMND</td>
                                <td>
                                    <asp:TextBox ID="txtCMT" type="text" class="textbox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Loại tài khoản</td>
                                <td>

                                    <asp:RadioButton ID="rdobtnNguoiThuong" value="1" Style="width: initial; height: initial; float: left;" runat="server" GroupName="type" Checked="True" Text="Người dùng bình thường" />

                                    <asp:RadioButton ID="rdobtnChuKhachSan" value="0" Style="width: initial; height: initial; float: left; margin-left: 10px;" runat="server" GroupName="type" Text="Chủ khách sạn" />

                                </td>
                            </tr>

                            <tr>
                                <td>Điện thoại</td>
                                <td>
                                    <asp:TextBox ID="txtdienthoai" runat="server" class="textbox"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td>Tỉnh/Thành phố</td>
                                <td>
                                    <asp:DropDownList ID="ddlthanhpho" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlthanhpho_SelectedIndexChanged" DataTextField="ProvinceName" DataValueField="ProvinceID">
                                    </asp:DropDownList>
                                </td>

                            </tr>
                            <tr>
                                <td>Quân/Huyện</td>
                                <td>

                                    <asp:DropDownList ID="ddlquan" runat="server" DataTextField="DistrictName" DataValueField="DistrictID">
                                    </asp:DropDownList>



                                </td>

                            </tr>
                            <tr>
                                <td>Địa chỉ</td>
                                <td>
                                    <asp:TextBox ID="txtdiachi" runat="server" class="textbox"></asp:TextBox>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>

            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="margin: 30px 0;">
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật thông tin" class="btn btn-warning" OnClick="btnCapNhat_Click" />
        </div>

    </div>
</asp:Content>

