<%@ Page Title="Quarter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quarter.aspx.cs" Inherits="FinalProject.Quarter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container quarter">
        <div class="row">
            <h2>Quarter Allocation Information</h2>
            <!--modal area-->
            <!-- Trigger the modal with a button -->
            <div class="addnew">
                 <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal1">Allocate quarter</button>
            </div>

            <!-- Modal-->
            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Quarter Allocation</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panl1" runat="server" align="center">


                                <div class="form-group">
                                    <asp:TextBox ID="EmpID" class="form-control inputs" placeholder="Employee ID" runat="server" TextMode="SingleLine" OnTextChanged="EmpID_TextChanged"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="EmpName" Enabled="false" class="form-control inputs" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="QuarterID" class="form-control inputs" placeholder="Quarter ID" runat="server"  OnTextChanged="QuarterID_TextChanged" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="QuarterNAme" Enabled="false" class="form-control inputs" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>


                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div> 


            <!--Employee list-->
            <div class="AllDataList container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT [quarter].[quarter_id], [quarter].[quarter_name], [employee].[emp_id], [employee].[emp_name] FROM [quarter] INNER JOIN [employee] ON [quarter].[emp_id]=[employee].[emp_id];"></asp:SqlDataSource>
                <asp:GridView ID="QuarterInfo" class="table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="emp_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="emp_id" HeaderText="Employee ID" ReadOnly="True" SortExpression="emp_id" />
                        <asp:BoundField DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name" />
                        <asp:BoundField DataField="quarter_name" HeaderText="Quarter Name" SortExpression="quarter_name" />
                        <asp:BoundField DataField="quarter_id" HeaderText="Quarter ID" SortExpression="quarter_id" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
