<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDPKS.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TieuDe" runat="server" >

    Đăng nhập
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" Runat="Server">

    <div class="dangnhap">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <b >Email</b>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtusername" class="login" runat="server" type="text"></asp:TextBox>
                                    <asp:Label ID="lblcheck" runat="server" Text="" style="color:red;" ></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <b >Password</b>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpassword" class="login" type="password" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <div style="margin:20px 100px;">
                        <asp:Button ID="btnDangNhap"  class="btn btn-success" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click"  />
                         <%--<button type="button" class="btn btn-success">Đăng nhập</button>--%>
                    </div>
                </div>
</asp:Content>

