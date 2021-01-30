<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="FinalProject.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container employee">
        <div class="row">
            <h2>Employees Information</h2>
            <!--modal area-->
            <!-- Trigger the modal with a button -->
            <div class="addnew">
                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">Add a new employee</button>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Vaccency</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panl1" runat="server" align="center">
                                <iframe style="width: 100%; height: 400px; border: none;" id="irm1" src="Vaccency.aspx" runat="server"></iframe>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
            <!--Employee list-->
            <div class="AllDataList container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT [emp_id],[emp_name],[emp_designation],[dept_id] FROM [employee] ORDER BY [emp_id]" UpdateCommand="UPDATE [employee] SET [emp_name]=@emp_name, [dept_id]=@dept_id, [emp_designation]=@emp_designation WHERE [emp_id]=@emp_id" DeleteCommand="DELETE FROM [employee] WHERE [emp_id]=@emp_id"></asp:SqlDataSource>
                <asp:GridView ID="EmployeeInfo" class="table table-hover table-responsive table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="emp_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="emp_id" HeaderText="Employee ID" ReadOnly="True" SortExpression="emp_id" />
                        <asp:BoundField DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name" />
                        <asp:BoundField DataField="emp_designation" HeaderText="Designation" SortExpression="emp_designation" />
                        <asp:BoundField DataField="dept_id" HeaderText="Department ID" SortExpression="dept_id" />
                        <asp:CommandField ShowEditButton="true" HeaderText="Edit" EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil'  title='Edit'></i>" CancelText="<i aria-hidden='true' class='glyphicon glyphicon-remove' title='Cancel'></i>" UpdateText="<i aria-hidden='true' class='glyphicon glyphicon-floppy-disk' title='Update'></i>" />
                        <asp:CommandField ShowDeleteButton="true" HeaderText="Delete" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-trash'  title='Delete'></i>" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
