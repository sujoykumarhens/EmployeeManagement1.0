<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container login">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <div class="form-login">
                    <h2>Sign In</h2>
                    <asp:TextBox ID="username" class="username" runat="server" placeholder="Username"></asp:TextBox>
                    <asp:TextBox ID="password" runat="server" Class="password" placeholder="Password" TextMode="password"></asp:TextBox>
                    <div class="wrapper">
                        <span class="group-btn">
                            <asp:Button ID="Submit" class="btn btn-lg btn-info btn-block submit" runat="server" Text="Login" OnClick="Submit_Click" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
