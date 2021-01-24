<%@ Page Title="Department" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="FinalProject.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container Department">
        <div class="row">
            <h1>Departments Information</h1>

            <!--modal area-->
            <!-- Trigger the modal with a button -->
            <div class="addnew">
                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">Add a new department</button>
                </div>
            <hr />

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add Department</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="Panl1" runat="server"  align="center">
                                <iframe style="width: 100%; height:400px; border:none;" id="irm1" src="DeptNew.aspx" runat="server"></iframe>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>


            <!--Department list-->
            <div class="DepartmentList">
                <div class="container">
                    <asp:GridView ID="DeptInfo" class="table table-striped table-hover table-responsive table-bordered" runat="server"></asp:GridView>        
                </div>
            </div>

             <!--this portion has to be deleted, only for show start--->
             <div class="container">         
                    <table class="table deptlist table-striped table-hover table-responsive table-bordered">
                        <thead>
                            <tr>
                                <th>Firstname</th>
                                <th>Lastname</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>John</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                            </tr>
                            <tr>
                                <td>Mary</td>
                                <td>Moe</td>
                                <td>mary@example.com</td>
                            </tr>
                            <tr>
                                <td>July</td>
                                <td>Dooley</td>
                                <td>july@example.com</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

        </div>
    </div>
</asp:Content>
