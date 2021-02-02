<%@ Page Title="Quarter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quarter.aspx.cs" Inherits="FinalProject.Quarter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container quarter">
        <div class="row">
            <h2>Quarter Allocation Information</h2>
            <div class="panel quarter-panel">
                <div class="panel-heading">Allocate a quarter
                    <button type="button" class="btn btn-primary btn-xs pull-right" data-toggle="modal" data-target="#NewQuarterEntry">+ Add a new quarter</button>
                </div>
                <!-- Modal start-->
                <div class="modal" id="NewQuarterEntry" role="dialog">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                            <asp:Button ID="CloseModal" runat="server" class="close" data-dismiss="modal" Text="⛌"  />
                                <h4 class="modal-title">New quarter entry</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <asp:TextBox ID="NewQuarterID" class="form-control inputs" placeholder="Quarter ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="NewQuarterName" class="form-control inputs" placeholder="Quarter Name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="QuarterSave" class="btn btn-info btn-block" runat="server" Text="Submit" OnClick="QuarterSave_Clicked" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal end-->
                <div class="panel-body">
                    <div class="form-inline">

                        <div class="form-group">
                            <asp:TextBox ID="EmpID" class="form-control inputs" placeholder="Employee ID" runat="server" TextMode="SingleLine" AutoPostBack="True" OnTextChanged="EmpID_TextChanged"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="EmpName" class="form-control inputs" ReadOnly="true" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="QuarterID" class="form-control inputs" placeholder="Quarter ID" runat="server"  AutoPostBack="True" OnTextChanged="QuarterID_TextChanged" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-group ">
                            <asp:TextBox ID="QuarterName" ReadOnly="true" class="form-control inputs" placeholder="Quarter name" runat="server" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="Submit" class="btn btn-primary boton" runat="server" Text="Submit" OnClick="Submit2_Click" />
                        </div>
                    </div>
                </div>
            </div><br />
            <!--Employee list-->
            <div class="AllDataList container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT quarterlist.quarter_id, quarterlist.quarter_name, employee.emp_name, employee.emp_id FROM quarterlist INNER JOIN allocatedquarter ON quarterlist.quarter_id = allocatedquarter.quarter_id INNER JOIN employee ON allocatedquarter.emp_id = employee.emp_id" UpdateCommand="UPDATE [allocatedquarter] SET [quarter_id]=@quarter_id WHERE [emp_id]=@emp_id" DeleteCommand="DELETE FROM [allocatedquarter] WHERE [emp_id]=@emp_id"></asp:SqlDataSource>
                <asp:GridView ID="QuarterInfo" class="table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False"  DataKeyNames="emp_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="quarter_id" HeaderText="Quarter ID" SortExpression="quarter_id" />
                        <asp:BoundField DataField="quarter_name" HeaderText="Quarter Name" ReadOnly="True" SortExpression="quarter_name" />
                        <asp:BoundField DataField="emp_id" HeaderText="Employee ID" ReadOnly="True" SortExpression="emp_id" />
                        <asp:BoundField DataField="emp_name" HeaderText="Employee Name" ReadOnly="True" SortExpression="emp_name" />
                        <asp:CommandField ShowEditButton="true" HeaderText="Reallocate" EditText="<i aria-hidden='true' class='glyphicon glyphicon-pencil'  title='Edit'></i>" CancelText="<i aria-hidden='true' class='glyphicon glyphicon-remove' title='Cancel'></i>" UpdateText="<i aria-hidden='true' class='glyphicon glyphicon-floppy-disk' title='Update'></i>" />
                        <asp:CommandField ShowDeleteButton="true" HeaderText="Deallocate" DeleteText="<i aria-hidden='true' class='glyphicon glyphicon-trash'  title='Delete'></i>" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
