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
                            <asp:Button ID="CloseModal" runat="server" class="close" data-dismiss="modal" Text="⛌"  />
                            <h4 class="modal-title">Add Department</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panl1" runat="server" align="center">
                                <div class="form-group">
                                    <asp:TextBox ID="DeptID" class="form-control inputs" Required="True" placeholder="Department ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="DeptName" class="form-control inputs" Required="True" placeholder="Department Name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="Phone" class="form-control inputs" Required="True" placeholder="Phone number" runat="server" TextMode="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobNo" runat="server" ErrorMessage="Required" oreColor="Red" ControlToValidate="Phone" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMobNo" runat="server" ErrorMessage="Invalid Mobile Number."  ValidationExpression="^([0-9]{10})$" Display="Dynamic" ControlToValidate="Phone" ForeColor="Red" ></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="Email" class="form-control inputs" Required="True" placeholder="Email ID" runat="server" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Email" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="remail" runat="server" ControlToValidate="Email" ErrorMessage="Enter a proper email" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="Vaccency" class="form-control inputs" Required="True" placeholder="Vaccency" min="1" max="50" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RangeValidator ID="x" runat="server" ControlToValidate="Vaccency" ErrorMessage="Vaccency should be greater than 1" Display="Dynamic" ForeColor="Red" MaximumValue="50"  MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                </div>
                                <hr />
                                <asp:Button ID="Save" Enabled="true" class="btn btn-info btn-block" runat="server" Text="Submit" OnClick="Save_Click" />
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>

            <!--Department list-->
            <div class="container AllDataList">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT [dept_id],[dept_name],[phone],[email] FROM [department] ORDER BY [dept_id]" UpdateCommand="UPDATE [department] SET [dept_name]=@dept_name, [phone]=@phone, [email]=@email WHERE [dept_id]=@dept_id" DeleteCommand="DELETE FROM [department] WHERE [dept_id]=@dept_id;DELETE FROM [vaccency] WHERE [dept_id]=@dept_id;DELETE FROM [employee] WHERE [dept_id]=@dept_id;"></asp:SqlDataSource>
                <asp:GridView ID="DeptInfo" class="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="dept_id">
                    <Columns>
                        <asp:BoundField DataField="dept_id" InsertVisible="false" ReadOnly="true" HeaderText="Department ID" SortExpression="dept_id" />
                        <asp:BoundField DataField="dept_name" ConvertEmptyStringToNull="true" HeaderText="Department Name" SortExpression="dept_name" />
                        <asp:BoundField DataField="phone" ConvertEmptyStringToNull="true" HeaderText="Phone Number" SortExpression="phone" />
                        <asp:BoundField DataField="email" ConvertEmptyStringToNull="true" HeaderText="Email ID" SortExpression="email" />
                        <asp:CommandField ShowEditButton="true" HeaderText="Edit" EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil'  title='Edit'></i>" CancelText="<i aria-hidden='true' class='glyphicon glyphicon-remove' title='Cancel'></i>" UpdateText="<i aria-hidden='true' class='glyphicon glyphicon-floppy-disk' title='Update'></i>" />
                        <asp:CommandField ShowDeleteButton="true" HeaderText="Delete" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-trash'  title='Delete'></i>" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
