<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSheets.aspx.cs" Inherits="TSM_Project.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-table"></i>View Sheets</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                        <li><i class="fa fa-table"></i>View Sheets</li>

                    </ol>
                </div>
            </div>
            <!-- page start-->

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <section class="wrapper">
                                                    <h2><asp:Label ID="lbusername" runat="server"></asp:Label></h2>

                        <header class="panel-heading">
                            Time Sheet Records
                        </header>
                        <br />
                        <div class="col-lg-12" >
                        <asp:GridView ID="EmpView" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="TimeSheet_ID" 
                            class="table panel table-striped table-advance table-hover" 
                             style="margin-left: 0px" Width="866px">
                            <Columns>
                                  <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbusername" Text='<%# Eval("UserName") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtusername" Text='<%# Eval("UserName") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lbdate" Text='<%# Eval("Date") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtdate" Text='<%# Eval("Date") %>' runat="server" TextMode="Date"></asp:TextBox>
                                    </EditItemTemplate>

                             </asp:TemplateField>

                                <asp:TemplateField HeaderText="Start-Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lbstarttime" Text='<%# Eval("Start_Time") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtstarttime" Text='<%# Eval("Start_Time") %>' runat="server" TextMode="Time"></asp:TextBox>
                                    
                                    </EditItemTemplate>
                                    
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="End-Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lbendtime" Text='<%# Eval("End_Time") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtendtime" Text='<%# Eval("End_Time") %>' runat="server" TextMode="Time"></asp:TextBox>
                                    </EditItemTemplate>
                                    
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Project Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbprojectname" Text='<%# Eval("Project_Name") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtprojectname" Text='<%# Eval("Project_Name") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
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
