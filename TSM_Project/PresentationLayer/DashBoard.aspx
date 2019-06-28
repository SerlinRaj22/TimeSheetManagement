<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="TSM_Project.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
            <section class="wrapper">
                <!--overview start-->
                <div class="row">
                    <div class="col-lg-12">
                        <br />
                        <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
                        <ol class="breadcrumb">
                            <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
                            <li><i class="fa fa-laptop"></i>Dashboard</li>
                        </ol>
                    </div>
                </div>
                   <asp:Label ID="lbusername" runat="server" Visible="false"></asp:Label>

                  <asp:Label ID="lbroleid" runat ="server" Visible="false"></asp:Label>
                <asp:Label ID="lbempid" runat="server" Visible="false"></asp:Label>
                <div class="row">
                   
                    
                    <!--/.col-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box red-bg">
                            <i class="fa fa-briefcase"></i>
                            <div class="count">
                                <asp:Label ID="lbempcount" runat="server"></asp:Label>
                            </div>
                            <div class="title">Employees</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/.col-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box blue-bg">
                            <i class="fa fa-book"></i>
                            <div class="count">
                               <asp:Label ID="lbTScount" runat="server"></asp:Label>

                            </div>
                            <div class="title">Time Sheets</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/.col-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box green-bg">
                            <i class="fa fa-cubes"></i>
                            <div class="count">
                        <asp:Label ID="lbprojectcount" runat="server"></asp:Label>

                            </div>
                            <div class="title">Total Projects</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/.col-->
                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box yellow-bg" style="height:140px">
                            <i class="fa fa-bell"></i>
                            <div class="count">
                        <asp:Label ID="lbtime" runat="server" Font-Size="Medium"></asp:Label>

                            </div>
                            <div class="title">Time</div>
                        </div>
                        <!--/.info-box-->
                    </div>
                   
                </div>
                <!--/.row-->




                <!-- Today status end -->



               <div class="row">

                     <div class="col-lg-9 col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h2><i class="fa fa-flag-o red"></i><strong>Employees Working Hours Table</strong></h2>
                               
                                
                            </div>
                            <div class="panel-body">
                                 
                                     <asp:GridView ID="EmpView" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                    class="table bootstrap-datatable countries"
                                    Style="margin-left: 0px" Width="800px">
                                    <Columns>
                  
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lbdate" Text='<%# Eval("Date") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="Txtdate" Text='<%# Eval("Date") %>' runat="server" TextMode="Date"></asp:TextBox>
                                            </EditItemTemplate>

                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                               <div class="progress thin">
                                                                                                    
                                               </div>
                                                <span class="sr-only">57%</span>                                           

                                            </ItemTemplate>
                                            <EditItemTemplate>
                                             <div class="progress thin">
                                                    <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Bar
                                    </header>
                                    <div class="panel-body text-center">
                                        <div>

                                            <asp:Chart ID="Chart1" runat="server" Height="280" Width="400" >
                                                <Series>
                                                    <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                    

                                                </ChartAreas>
                                            </asp:Chart>

                                        </div>
                                        <canvas id="bar"></canvas>
                                    </div>
                                </section>
                            </div>
                                                </div>
                                                <span class="sr-only">57%</span>                                            

                                            </EditItemTemplate>

                                        </asp:TemplateField>
                                       </Columns>
                                         </asp:GridView>
                            </div>

                        </div>

                    </div>
                    <!--/col-->





                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box red-bg">
                            <i class="fa fa-user"></i>
                            <div class="count">
                     <strong><asp:Label ID="lbemprole" runat="server"></asp:Label></strong>
                            </div>
                            <div class="title"></div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box pink-bg">
                            <i class="fa fa-bookmark"></i>
                            <div class="count">
                               <strong> <asp:HyperLink ID="linklbmail" runat="server" ForeColor="Pink" Font-Size="Large"></asp:HyperLink></strong>
                            </div>
                            <div class="title"></div>
                        </div>
                        <!--/.info-box-->
                    </div>
                    <!--/col-->
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box dark-bg">
                            <i class="fa fa-magic"></i>
                            <div class="count">
                               <strong> <asp:Label ID="lb" runat="server" ForeColor="Pink" Font-Size="Large"></asp:Label></strong>
                            </div>
                            <div class="title"></div>
                        </div>
                        <!--/.info-box-->
                    </div>                    <!--/col-->

                </div>



                <!-- statics end -->
                <!-- project team & activity start -->

                <!-- project team & activity end -->

            </section>
            
        </section>
</asp:Content>
