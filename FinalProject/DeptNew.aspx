<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptNew.aspx.cs" Inherits="FinalProject.DeptNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/InputForms.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <form id="deptform" runat="server">
            <div class="form-group">
                <label for="DeptID">Department ID:</label>
                <asp:TextBox ID="DeptID" class="form-control dept-input" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="DeptName">Department Name:</label>
                <asp:TextBox ID="DeptName" class="form-control dept-input" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Phone">Phone:</label>
                <asp:TextBox ID="Phone" class="form-control dept-input" runat="server" TextMode="Phone"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Email">Email:</label>
                <asp:TextBox ID="Email" class="form-control dept-input" runat="server" TextMode="Email"></asp:TextBox>
            </div>
            <hr />
            <asp:Button ID="Save" class="btn btn-info btn-block" runat="server" Text="Submit" OnClick="Save_Click" />
        </form>
    </div>
</body>
</html>
