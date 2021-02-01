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
                 <a href="#demo" class="btn btn-default btn-lg" data-toggle="collapse">Allocation</a>
                 <!--<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal1">Allocate quarter</button>-->
            </div>

            <!-- Modal
            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Quarter Allocation</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panl1" runat="server" align="center">-->
                                <div id="demo" class="collapse">

                                <div class="form-group">
                                    <asp:TextBox ID="EmpID" class="form-control inputs" placeholder="Employee ID" runat="server" TextMode="SingleLine" AutoPostBack="True" OnTextChanged="EmpID_TextChanged"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="EmpName"  class="form-control inputs" Enabled="false" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="QuarterID" class="form-control inputs" placeholder="Quarter ID" runat="server"  OnTextChanged="QuarterID_TextChanged" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="QuarterName" Enabled="false" class="form-control inputs" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                    </div>

<!--
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div> -->


            <!--Employee list-->
            <div class="AllDataList container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT quarterlist.quarter_id, quarterlist.quarter_name, employee.emp_name, employee.emp_id FROM quarterlist INNER JOIN allocatedquarter ON quarterlist.quarter_id = allocatedquarter.quarter_id INNER JOIN employee ON allocatedquarter.emp_id = employee.emp_id"></asp:SqlDataSource>
                <asp:GridView ID="QuarterInfo" class="table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="quarter_id" HeaderText="Quarter ID" SortExpression="quarter_id" />
                        <asp:BoundField DataField="quarter_name" HeaderText="Quarter Name" SortExpression="quarter_name" />
                        <asp:BoundField DataField="emp_id" HeaderText="Employee ID" SortExpression="emp_id" />
                        <asp:BoundField DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
