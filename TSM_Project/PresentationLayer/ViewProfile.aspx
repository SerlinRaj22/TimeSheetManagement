<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/MasterPage/Site.Master" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="TSM_Project.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="icon_desktop"></i> Profile</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="icon_desktop"></i>Profile</li>
             
            </ol>
          </div>
        </div>
        <div class="row">
          <!-- profile-widget -->
          <div class="col-lg-12">
            <div class="profile-widget profile-widget-info">
              <div class="panel-body">
                <div class="col-lg-2 col-sm-2">
                    <asp:Label ID="lbusername" runat="server" Visible="false"></asp:Label>
                  <h4><asp:Label ID="proname1" runat="server">  <%#proname1%>
 </asp:Label>&nbsp;<asp:Label ID="proname2" runat="server">  <%#proname2%>
 </asp:Label></h4>
                  <div class="follow-ava">
                    <img src="img/profile-widget-avatar.jpg" alt="">
                  </div>
                </div>
                <div class="col-lg-6 col-sm-4 follow-info">
                  
                  <h5><asp:Label ID="profirstlastname1" runat="server">  <%#profirstlastname1%></asp:Label></h5>
                    <h5> <asp:Label ID="profirstlastname2" runat="server" ><%#profirstlastname2%></asp:Label></h5>
                      <h5> <asp:Label ID="twit" runat="server" class="fa fa-mail-reply-all">  <%#twit%> ></asp:Label></h5>
                 <h5> <asp:Label ID="mob" runat="server" class="fa fa-mobile">  <%# mob%> ></asp:Label></h5>

                  <h6>
                                    <span><i class="icon_calendar"></i><asp:Label ID="lbdatetime1" runat="server"><%# lbdatetime1 %></asp:Label></span>
                                    <span><i class="icon_pin_alt"></i><asp:Label ID="procity" runat="server"> <%# procity%></asp:Label></span>
                                </h6>
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <!-- page start-->
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading tab-bg-info">
                <ul class="nav nav-tabs">
                  <li>
                    <asp:LinkButton ID="profilebtn" runat="server" Text="Profile" class="icon-user" PostBackUrl="~/Profile.aspx">
                                      </asp:LinkButton>
                  </li>
                  <li class="">
                    <asp:LinkButton ID="editprofilebtn" runat="server"  Text="Edit Profile" class="icon-envelope" PostBackUrl="~/PresentationLayer/Editprofile.aspx">
                                      </asp:LinkButton>
                  </li>
                </ul>
              </header>
              <div class="panel-body">
                <div class="tab-content">
                  <div id="recent-activity" class="tab-pane active">
                     <!-- profile -->
                  <div id="profile" class="tab-pane">
                    <section class="panel">
                      <div class="bio-graph-heading">
                         <h2><span></span>Hello !!!&nbsp;<asp:Label ID="lbheading" runat="server" > <%#lbheading%></asp:Label></h2>
                      </div>
                      <div class="panel-body bio-graph-info">
                        <h1>Bio Graph</h1>
                        <div class="row">
                          <div class="bio-row">
                             
                            <p><span>First Name </span>:<asp:Label ID="lbfirstname" runat="server">  <%#lbfirstname%>
 </asp:Label></p>
                          </div>
                          <div class="bio-row">
                            <p><span>Last Name </span>:<asp:Label ID="lblastname" runat="server">  <%#lblastname%>
 </asp:Label></p>
                          </div>
                          <div class="bio-row">
                            <p><span>Birthday</span>: <asp:Label ID="lbbirthday" runat="server">  <%#lbbirthday%>
 </asp:Label></p>
                          </div>
                          <div class="bio-row">
                            <p><span>City </span>:<asp:Label ID="lbcity" runat="server">  <%#lbcity%>
 </asp:Label></p>
                          </div>
                          
                          <div class="bio-row">
                            <p><span>Email </span>:<asp:Label ID="lbemail" runat="server">  <%#lbemail%>
 </asp:Label></p>
                          </div>
                          <div class="bio-row">
                            <p><span>Mobile </span>: <asp:Label ID="lbmobile" runat="server">  <%#lbmobile%>
 </asp:Label></p>
                          </div>
                         </div>
                      </div>
                    </section>
                    <section>
                      <div class="row">
                      </div>
                    </section>
                  </div>
                
                  </div>
                 
                </div>
              </div>
            </section>
          </div>
        </div>
          <!-- page end-->
      </section>
    </section>
    
</asp:Content>
