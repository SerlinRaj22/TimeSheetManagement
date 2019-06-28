<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProjects.aspx.cs" Inherits="TSM_Project.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="fa fa fa-bars"></i> Projects</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="icon_table"></i>Projects</li>
              
            </ol>
          </div>
        </div>
        <!-- page start-->
        
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <section class="wrapper">
                        <header class="panel-heading">
                          <h3>  Project Table</h3>
                        </header>
                        <br />
                        <div class="col-lg-12" >
                        <asp:GridView ID="EmpView" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Project_ID" 
                            class="table panel table-striped table-advance table-hover" 
                            OnRowCommand="EmpView_RowCommand" 
                            OnRowEditing="EmpView_RowEditing"
                            OnRowCancelingEdit="EmpView_RowCancelingEdit" 
                            OnRowUpdating="EmpView_RowUpdating" OnRowDeleting="EmpView_RowDeleting"  style="margin-left: 0px" Width="866px">
                            <Columns>
                                <asp:TemplateField HeaderText="Project Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbprojectname" Text='<%# Eval("Project_Name") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtprojectname" Text='<%# Eval("Project_Name") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtprojectnamefooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Project Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lbprojectdescript" Text='<%# Eval("Project_Description") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtprojectdescript" Text='<%# Eval("Project_Description") %>' runat="server"></asp:TextBox>
                                    
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtprojectdescriptfooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                               
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="imgbtnedit" ImageUrl="~/img/edit.jpg" Text="Edit"  CssClass="btn btn-success" CommandName="Edit" runat="server" ToolTip="Edit" Height="35px" Width="65px" />
                                        <asp:Button ID="imgbtndel" ImageUrl="~/img/delbtn.jpg" Text="Delete" CommandName="Delete" runat="server" CssClass="btn btn-danger" ToolTip="Delete" Height="35px" Width="65px" />

                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="imgbtnupdate" ImageUrl="~/img/savebtn.jpg" CommandName="Update" Text="Update" runat="server" CssClass="btn btn-default" ToolTip="Update" Height="35px" Width="65px" />
                                        <asp:Button ID="imgbtncancel" ImageUrl="~/img/cancel.jpg" CommandName="Cancel" Text="Cancel" runat="server"  CssClass="btn btn-danger" ToolTip="Cancel" Height="35px" Width="65px" />

                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="imgbtnadd" ImageUrl="~/img/addbtn.jpg" Text="Add project" CommandName="Add" runat="server" CssClass="btn btn-primary" ToolTip="Add" Height="35px" Width="100px" />

                                    </FooterTemplate>

                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee">
                                  <ItemTemplate>
                            <asp:Button PostBackUrl="~/Pages.aspx" ID="imgbtnaddpro" ImageUrl="~/img/addbtn.jpg" Text="Add" CssClass="btn btn-warning" CommandName="AddEmployee" runat="server" ToolTip="Add Employee" Height="35px" Width="65px" ImageAlign="AbsMiddle"/>
                                
                                  </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            <asp:ValidationSummary ID="valisummary" runat="server" ForeColor="Red" />
                            </div>
                        <br />
                        <asp:Label ID="lbsuccess" runat="server" ForeColor="Green"></asp:Label>
                        <br />
                        <asp:Label ID="lberror" runat="server" ForeColor="Red"></asp:Label>


                        </section>
                    </section>
                </div>
            </div>
<!-- page end-->
      </section>
    </section>
</asp:Content>
