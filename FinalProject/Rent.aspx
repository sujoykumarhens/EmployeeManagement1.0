<%@ Page Title="Rents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rent.aspx.cs" Inherits="FinalProject.Rent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container rent">
        <div class="row">
            <h2>Rents Information</h2>
            <!--modal area-->
            <!-- Trigger the modal with a button -->
            <div class="addnew">
                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">New Payment</button>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT q.[quarter_name], e.[emp_id], e.[emp_name],r.[rent_amount],r.[rent_status],r.[rent_paid_date] FROM [quarter] q, [employee] e, [rent] r WHERE e.[emp_id]=q.[emp_id] AND e.[emp_id]=r.[emp_id]"></asp:SqlDataSource>
                <asp:GridView ID="RentGrid" class="table table-bordered table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="emp_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="emp_id" HeaderText="Employee ID" ReadOnly="True" SortExpression="emp_id" />
                        <asp:BoundField DataField="emp_name" HeaderText="Employee Name" SortExpression="emp_name" />
                        <asp:BoundField DataField="quarter_name" HeaderText="Quarter Name" SortExpression="quarter_name" />
                        <asp:BoundField DataField="rent_amount" HeaderText="Rent Amount" SortExpression="rent_amount" />
                        <asp:BoundField DataField="rent_status" HeaderText="Rent Status" SortExpression="rent_status" />
                        <asp:BoundField DataField="rent_paid_date" HeaderText="Paid Month" SortExpression="rent_paid_date" DataFormatString="{0:MMMM,yyyy}"/>
                    </Columns>
                </asp:GridView>
                <div class="addnew">
                    <asp:LinkButton ID="Export" runat="server" OnClick="Button1_Click" CssClass="btn btn-default btn-lg" Text="<img src='Image/excel.svg' height='25px'/> &nbsp;Export into excel"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
