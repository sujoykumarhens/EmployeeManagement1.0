<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="FinalProject.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container Department">
        <div class="row">
            <h1>Employees Information</h1>

            <!--modal area-->
            <!-- Trigger the modal with a button -->
            <div class="addnewemployee">
                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">Add a new employee</button>
            </div>
            <hr />

            <!-- Modal -->
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
            </div>


            <!--Department list-->
            <div class="EmployeetList">
                <div class="container">
                    <asp:GridView ID="EmployeeInfo" class="table table-striped table-hover table-responsive table-bordered" runat="server"></asp:GridView>
                </div>
            </div>

        </div>
    </div>
    
</asp:Content>
