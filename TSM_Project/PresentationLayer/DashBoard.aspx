<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/MasterPage/Site.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="TSM_Project.WebForm3" %>
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
                <!-- Session labels-->
                   <asp:Label ID="lbusername" runat="server" Visible="false"></asp:Label>
                  <asp:Label ID="lbroleid" runat ="server" Visible="false"></asp:Label>
                <asp:Label ID="lbempid" runat="server" Visible="false"></asp:Label>
              
                <div class="row">  
                    <!-- employees count-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box red-bg">
                            <i class="fa fa-briefcase"></i>
                            <div class="count">
                                <asp:Label ID="lbempcount" runat="server"></asp:Label>
                            </div>
                            <div class="title">Employees</div>
                        </div>
                    </div>
                    <!--time sheet count-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box blue-bg">
                            <i class="fa fa-book"></i>
                            <div class="count">
                               <asp:Label ID="lbTScount" runat="server"></asp:Label>

                            </div>
                            <div class="title">Time Sheets</div>
                        </div>
                        
                    </div>
                    <!--project count-->

                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box green-bg">
                            <i class="fa fa-cubes"></i>
                            <div class="count">
                        <asp:Label ID="lbprojectcount" runat="server"></asp:Label>

                            </div>
                            <div class="title">Total Projects</div>
                        </div>
                    </div>
                    <!--Time -->
                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="info-box yellow-bg" style="height:140px">
                            <i class="fa fa-bell"></i>
                            <div class="count">
                        <asp:Label ID="lbtime" runat="server" Font-Size="Medium"></asp:Label>

                            </div>
                            <div class="title">Time</div>
                        </div>
                    </div>
                   
                </div>





<!--charts -->


                
    <div class="row">
                <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                <!-- chart morris start -->
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h3>Employee Charts</h3>
                        </header>
                    </section>
                </div>

                <div class="panel-body">
                    <div class="tab-pane" id="chartjs">
                        <div class="row">
                            <!-- Bar -->
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Bar
                                    </header>
                                    <div class="panel-body text-center">

                                            <asp:Chart ID="Chart1" runat="server" Height="300px" Width="400px">
                                                <Titles>
                                                    <asp:Title  Text="Employee Bar Chart"></asp:Title>
                                                </Titles>
                                                
                                                <Series>
                                                    <asp:Series Name="Series1" ChartType="Bar" Color="#0066ff"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                        <AxisX Title="Working Days"></AxisX>
                                                        <AxisY Title="Working Hours"></AxisY>

                                                    </asp:ChartArea>
                                                    

                                                </ChartAreas>
                                            </asp:Chart>

                                        </div>
                                    
                                </section>
                            </div>

                            <!-- Pie -->
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        Pie
                                    </header>
                                    <div class="panel-body text-center">
                                        
                                            <asp:Chart ID="Chart2" runat="server" Height="300" Width="400">
                                                <Titles>
                                                    <asp:Title Text="Employee Pie Charts"></asp:Title>
                                                </Titles>
                                                <Series>
                                                    <asp:Series Name="Series2" ChartArea="ChartArea2" ChartType="Pie">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea2">
                                                        <AxisX Title="Working Days"></AxisX>
                                                        <AxisY Title="Working Hours"></AxisY>
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        
                                    </div>
                                </section>
                            </div>

                       
                            
                        </div>

                    </div>
                </div>
            </div>
                     
                    <!--Labels -->

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
                               <asp:HyperLink ID="linklbmail" runat="server" ForeColor="Pink" Font-Size="Large"></asp:HyperLink>
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
                      
                    </div>                    

                




            </section>
            
        </section>
</asp:Content>
