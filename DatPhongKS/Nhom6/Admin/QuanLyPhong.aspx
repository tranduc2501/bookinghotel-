<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.master" AutoEventWireup="true" CodeFile="QuanLyPhong.aspx.cs" Inherits="Admin_QuanLyPhong" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" language="javascript">
         function CheckAllEmp(Checkbox) {
             var GridVwHeaderChckbox = document.getElementById("<%=grvKhachSan.ClientID%>");
            for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnData" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Quản lý Khách sạn</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="height: 48px;">
                    <asp:LinkButton ID="btnRefresh_Top" runat="server" OnCommand="btnRefresh_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-primary btn-circle">
                                <i class="fa fa-refresh"></i>
                            </button>
                            <span>Làm mới</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnAdd_Top" runat="server" OnClick="btnAdd_Top_Click" OnCommand="btnAdd_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-plus"></i>
                            </button>
                            <span>Thêm</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnEdit_Top" runat="server" OnCommand="btnEdit_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-plus"></i>
                            </button>
                            <span>Sửa</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" href="javascript:void(0);" OnClientClick="window.history.go(-1);">
                        <div style="float:left;margin-right:10px">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-mail-reply"></i>
                            </button>
                            <span>Trở lại</span>
                              <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>   
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');" OnClick="btnDelete_Click">
                        <div style="float:left;">
                            <button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                             </button>
                             <span>Xóa</span>
                        </div>
                    </asp:LinkButton>
                </div>
            </div>

            <!-- /.panel-heading-->
            <div class="panel-body">
                <div class="row show-grid">
                    <div class="col-md-2">
                        <asp:Label ID="Label19" runat="server" Text="Label">Khách sạn</asp:Label>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlHotel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlHotel_SelectedIndexChanged" ></asp:DropDownList>
                    </div>
                </div>
                <div class="dataTable_wrapper">
                    <asp:GridView ID="grvKhachSan" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="grvKhachSan_RowDataBound" AllowPaging="True" OnPageIndexChanging="grvKhachSan_PageIndexChanging" PageSize="5">
                        <HeaderStyle CssClass="dgvheader" />
                        <RowStyle CssClass="gradeA" />
                        <Columns>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ckAll" runat="server" onclick="CheckAllEmp(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CkDelete" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' />
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField AccessibleHeaderText="ID" DataField="ID" HeaderText="ID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="name" DataField="name" HeaderText="Tên phòng">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="nameHotel" DataField="nameHotel" HeaderText="Khách sạn">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="status" DataField="status" HeaderText="Trạng thái">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="createAt" DataField="createAt" HeaderText="Cập nhật">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:ImageField AccessibleHeaderText="thumb" DataImageUrlField="thumb" HeaderText="Ảnh">
                                <ControlStyle Height="70px" Width="50px" />
                                <ItemStyle Height="50px" Width="50px" />
                            </asp:ImageField>
                            <asp:BoundField AccessibleHeaderText="price" DataField="price" HeaderText="Giá" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chức năng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbAddSub" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="AddSub" ImageUrl="~/Admin/Images/add.png" OnCommand="lbAddSub_Command" Text="AddSub" ToolTip="Thêm Khách sạn" />
                                    </div>
                                    <!--To fire the OnRowEditing event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbEdit" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="Sua" ImageUrl="~/Admin/Images/edit.png" OnCommand="lbEdit_Command" Text="Sua" ToolTip="Sửa" />
                                    </div>
                                    <!--To fire the OnRowDeleting event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDelete" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' CommandName="Xoa" ImageUrl="~/Admin/Images/close.png" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');" OnCommand="lbDelete_Command" Text="Xoa" ToolTip="Xóa" />
                                    </div>
                                    <%--Visible='<%# (DataBinder.Eval(Container.DataItem, "Ord").ToString() != "1") %>'--%><%-- <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbUp" runat="server" ImageUrl="~/Admin/Images/1459276881_arrow-up_basic_blue.png" CommandName="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' 
                                            Text="Up" OnCommand="lbUp_Command" ToolTip="Lên Trên"></asp:ImageButton>
                                    </div>--%>
                                    <!--To fire the OnRowEditing event.--><%--Visible='<%# isDown((DataBinder.Eval(Container.DataItem, "ID").ToString())) %>'--%><%-- <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDown" runat="server" ImageUrl="~/Admin/Images/1459276887_arrow-down_basic_blue.png" CommandName="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' 
                                            Text="Down" OnCommand="lbDown_Command" ToolTip="Xuống Dưới"></asp:ImageButton>
                                    </div>--%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnInfo" runat="server" Visible="false">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Cập nhật thông tin</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div>
                    <asp:LinkButton ID="btnSave_Top" runat="server" OnClick="btnSave_Top_Click">
                        <button type="button" class="btn btn-primary btn-circle">
                            <i class="fa fa-save"></i>
                        </button>
                        <span>Lưu lại</span>
                        <img src="Images/split.png" style="margin-left:10px;"/>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnReturn_Top" runat="server" OnClick="btnReturn_Top_Click" OnCommand="btnReturn_Top_Command">
                         <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle"><i class="fa fa-mail-reply"></i>
                             </button>
                            <span>Trở lại</span>
                            <img src="Images/split.png" style="margin-left:10px;"/>
                             </div>
                    </asp:LinkButton>
                    <asp:Label ID="Label2" runat="server">
                                    <div style="clear:left;">
                                        
                                    </div>
                    </asp:Label>
                </div>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="dataTables_wrapper">
                    <asp:ScriptManager ID="ScriptManager1" 
                               runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label1" runat="server" Text="Label">ID:</asp:Label>
                        </div>
                        <asp:TextBox ID="txtID" runat="server" class="col-md-10" placeholder="ID tự động" ReadOnly="true" Style="cursor: not-allowed"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label3" runat="server" Text="Label">Tên phòng</asp:Label>
                        </div>
                        <asp:TextBox ID="txbTenPhong" runat="server" class="col-md-10" placeholder="Tên phòng" Style="background-color: white !important"></asp:TextBox>
                    </div>
                    <div class="row show-grid" >
                        <div class="col-md-2">
                            <asp:Label ID="Label10" runat="server" Text="Label">Giá</asp:Label>
                        </div>
                        <asp:TextBox ID="txbGia" runat="server" class="col-md-10" placeholder="Giá phòng" Style="background-color: white !important"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label11" runat="server" Text="Label">Ngày tạo/ cập nhật</asp:Label>
                        </div>
                        <asp:TextBox ID="txbNgay" runat="server" class="col-md-10" placeholder="Ngày giờ tự động" Style="cursor: not-allowed; background-color: white !important"  ReadOnly="true"  ></asp:TextBox>

                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label13" runat="server" Text="Label">Khách sạn</asp:Label>
                        </div>
                        <asp:DropDownList ID="cbbKhachSan" runat="server" Style="height:43px; width:auto"></asp:DropDownList>
                    </div>
                    <div class="row show-grid">
                        <div class="row show-grid">
                            <div class="col-md-12">
                                <asp:Label ID="Label5" runat="server" Text="Label">Mô tả chi tiết phòng</asp:Label>
                            </div>
                            <CKEditor:CKEditorControl ID="ckeMota" runat="server" BasePath="/ckeditor/"></CKEditor:CKEditorControl>
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                <asp:Label ID="Label8" runat="server" Text="Label">Tải Thumbnail</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhnho" runat="server" />
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="Label6" runat="server" Text="Label">Tải Hình ảnh 1</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhlon1" runat="server" />
                            </div>
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                <asp:Label ID="Label14" runat="server" Text="Label">Tải Hình ảnh 2</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhlon2" runat="server" />
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="Label16" runat="server" Text="Label">Tải Hình ảnh 3</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhlon3" runat="server" />
                            </div>
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                <asp:Label ID="Label17" runat="server" Text="Label">Tải Hình ảnh 4</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhlon4" runat="server" />
                            </div>
                            <div class="col-md-2">
                                <asp:Label ID="Label18" runat="server" Text="Label">Tải Hình ảnh 5</asp:Label>
                            </div>
                            <div class="col-md-4" style="background-color: white !important;">
                                <asp:FileUpload ID="ful_hinhanhlon5" runat="server" />
                            </div>
                        </div>
                        <div class="row show-grid">
                            <div class="col-md-2">
                                <asp:Label ID="Label9" runat="server" Text="Label">Đang còn phòng</asp:Label>
                            </div>
                            <div class="col-md-10" style="background-color: white !important;">
                                <asp:CheckBox runat="server" ID="ckbActive" ClientIDMode="Static"></asp:CheckBox>
                            </div>

                        </div>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
      <!-- DataTables JavaScript -->
  
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
      <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>


        $(document).ready(function () {
            $('#grvHang').DataTable({
                responsive: true
            });

        });
    </script>    
</asp:Content>


