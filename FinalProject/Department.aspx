<%@ Page Title="Department" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="FinalProject.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container Department">
        <div class="row">
            <h2>Departments Information</h2>
            <!--modal area-->
            <!-- Trigger the modal with a button -->
            <div class="addnew">
                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">Add a new department</button>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button ID="CloseModal" runat="server" class="close" data-dismiss="modal" Text="⛌" OnClick="CloseModal_Click" />
                            <h4 class="modal-title">Add Department</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panl1" runat="server" align="center">
                                <iframe style="width: 100%; height: 400px; border: none;" id="irm1" src="DeptNew.aspx" runat="server"></iframe>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
            <!--Department list-->
            <div class="container AllDataList">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT [dept_id],[dept_name],[phone],[email] FROM [department] ORDER BY [dept_id]" UpdateCommand="UPDATE [department] SET [dept_name]=@dept_name, [phone]=@phone, [email]=@email WHERE [dept_id]=@dept_id" DeleteCommand="DELETE FROM [department] WHERE [dept_id]=@dept_id"></asp:SqlDataSource>
                <asp:GridView ID="DeptInfo" class="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="dept_id">
                    <Columns>
                        <asp:BoundField DataField="dept_id" HeaderText="Department ID" SortExpression="dept_id" />
                        <asp:BoundField DataField="dept_name" HeaderText="Department Name" SortExpression="dept_name" />
                        <asp:BoundField DataField="phone" HeaderText="Phone Number" SortExpression="phone" />
                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                        <asp:CommandField ShowEditButton="true" HeaderText="Edit" EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil'  title='Edit'></i>" CancelText="<i aria-hidden='true' class='glyphicon glyphicon-remove' title='Cancel'></i>" UpdateText="<i aria-hidden='true' class='glyphicon glyphicon-floppy-disk' title='Update'></i>" />
                        <asp:CommandField ShowDeleteButton="true" HeaderText="Delete" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-trash'  title='Delete'></i>" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
