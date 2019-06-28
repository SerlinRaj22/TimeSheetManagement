<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="TSM_Project.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <br />
                    <h3 class="page-header"><i class="icon_piechart"></i>Chart</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                        <li><i class="icon_piechart"></i>Chart</li>

                    </ol>
                </div>

                <asp:Label ID="lbusername" runat="server" Visible="false"></asp:Label>
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
        </section>

    </section>

</asp:Content>
