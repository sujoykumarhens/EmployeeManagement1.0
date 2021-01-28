<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FinalProject.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container dashboard">
        <div class="jumbotron">
            <h1>Welcome </h1>
            <p class="lead">Manage anything from here. Select one to manage.</p>

            <p>
                <asp:Button ID="Logout" runat="server" Text="Log out" class="btn btn-info btn-lg" OnClick="Logout_Click" /></p>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>
                    <asp:Button ID="Button1" runat="server" Text="Manage Department" class="btn  btn-default btn-block btn-lg" OnClick="Button1_Click" /></p>
            </div>
            <div class="col-md-3">
                <p>
                    <asp:Button ID="Button2" runat="server" Text="Manage Employee" class="btn  btn-default btn-block btn-lg" OnClick="Button2_Click" /></p>
            </div>
            <div class="col-md-3">
                <p>
                    <asp:Button ID="Button3" runat="server" Text="Manage Housing" class="btn btn-default btn-block btn-lg" OnClick="Button3_Click" /></p>
            </div>
            <div class="col-md-3">
                <p>
                    <asp:Button ID="Button4" runat="server" Text="Manage rents" class="btn  btn-default btn-block btn-lg" OnClick="Button4_Click" /></p>
            </div>
        </div>
    </div>
</asp:Content>
