<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeNew.aspx.cs" Inherits="FinalProject.EmployeeNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/InputForms.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <form id="NewEmployeeForm" runat="server">
            <div class="form-group">
                <label for="EmployeeID">Employee ID:</label>
                <asp:TextBox ID="EmployeeID" class="form-control dept-input" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="EmployeeName">Employee Name:</label>
                <asp:TextBox ID="EmployeeName" class="form-control dept-input" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="DeprID">Department ID:</label>
                <asp:TextBox ID="DeptID" class="form-control dept-input" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Phone">Phone:</label>
                <asp:TextBox ID="Phone" class="form-control dept-input" runat="server" TextMode="Phone"></asp:TextBox>
            </div>
            <hr />
            <asp:Button ID="Save" class="btn btn-info btn-block" runat="server" Text="Submit" />
        </form>
    </div>
</body>
</html>
