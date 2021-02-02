<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="FinalProject.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function Confirm() {
            $("#login_wrapper").show();
            $(".AllDataList").hide();
        }
    </script>
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
            <!-- Modal start-->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button ID="CloseModal" runat="server" class="close" data-dismiss="modal" Text="⛌"  />
                            <h4 class="modal-title">Vaccency</h4>
                        </div>
                        <div class="modal-body">
                             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT department.dept_id, department.dept_name, vaccency.vaccency FROM department INNER JOIN vaccency ON department.dept_id = vaccency.dept_id"></asp:SqlDataSource>
                            <asp:GridView ID="VaccencyList" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="dept_id" runat="server" DataSourceID="SqlDataSource2" OnRowCommand="VaccencyList_RowCommand">
                                <Columns >
                                    <asp:BoundField DataField="dept_id" HeaderText="Department ID" SortExpression="dept_id" />
                                    <asp:BoundField DataField="dept_name" HeaderText="Department Name" SortExpression="dept_name" />
                                    <asp:BoundField DataField="vaccency" HeaderText="Vaccency" SortExpression="vaccency" />
                                    <asp:ButtonField Visible="true" ButtonType="Button" CommandName="apply" Text="Apply" />
                                </Columns>
                            </asp:GridView>
                            
                        </div>
                    </div>
                </div>
            </div>
             

     
<div id="login_wrapper" style="display:none;" >  
                         <asp:Panel ID="Panl1" runat="server">
                             <div class="form-group">
                                 <label for="DeptID" style="color:white;" >Department ID </label>
                        <asp:TextBox ID="DeptID" ReadOnly="true" Text="Department IDs" class="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                    </div>
                     <div class="form-group">
                        <asp:TextBox ID="EmpID" class="form-control inputs" placeholder="Employee ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="EmpName" class="form-control inputs" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="Designation" class="form-control inputs" placeholder="Designation" runat="server" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    
                    <asp:Button ID="Submit" class="btn btn-info btn-block" runat="server" Text="Submit" OnClick="Submit_Click"/>
                    <asp:Button ID="Cancel" class="btn btn-danger btn-block" runat="server" Text="Cancel" OnClick="Cancel_Click" />
                </asp:Panel>
        </div>

            

            <!--Employee list-->
            <div class="AllDataList container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT [emp_id],[emp_name],[emp_designation],[dept_id] FROM [employee] ORDER BY [emp_id]" UpdateCommand="UPDATE [employee] SET [emp_name]=@emp_name, [dept_id]=@dept_id, [emp_designation]=@emp_designation WHERE [emp_id]=@emp_id" DeleteCommand="DELETE FROM [employee] WHERE [emp_id]=@emp_id; DELETE FROM [allocatedquarter] WHERE [emp_id]=@emp_id;"></asp:SqlDataSource>
                <asp:GridView ID="EmployeeInfo" runat="server" CssClass="table except table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="emp_id" DataSourceID="SqlDataSource1">
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
