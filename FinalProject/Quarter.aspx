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
                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">Allocate a quarter</button>
            </div>
            <!-- Modal
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
            </div> -->
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
