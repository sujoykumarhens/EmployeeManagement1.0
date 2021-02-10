<%@ Page Title="Rents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rent.aspx.cs" Inherits="FinalProject.Rent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container rent">
        <div class="row">
            <h2>Rents Information</h2>
            
            <div class="panel rent-panel">
                <div class="panel-heading">Pay rent</div>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group">
                            <asp:DropDownList ID="EmpID" CssClass="options" DataTextField="emp_id" AutoPostBack="true" DataValueField="emp_id" runat="server" OnSelectedIndexChanged="EmpIDS_TextChanged"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="EmpName" class="form-control inputs" ReadOnly="true" placeholder="Employee name" runat="server" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="RentAmount" class="form-control inputs" placeholder="Rent amount" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="Month" class="form-control inputs" placeholder="Rent month" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group pull-right">
                            <asp:Button ID="Submit" class="btn btn-primary boton" runat="server" OnClick="Submit_Click" Text="Pay now ⮞" />
                        </div>
                    </div>
                </div>
            </div><br />
            <!--Employee list-->
            <div class="AllDataList container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeManagementConnectionString %>" SelectCommand="SELECT q.quarter_name, e.emp_id, e.emp_name, r.rent_amount, r.rent_status, r.rent_paid_date FROM rent AS r INNER JOIN employee AS e ON r.emp_id = e.emp_id INNER JOIN allocatedquarter AS a ON e.emp_id = a.emp_id INNER JOIN quarterlist AS q ON a.quarter_id = q.quarter_id"></asp:SqlDataSource>
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
