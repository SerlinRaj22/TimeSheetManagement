<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Editprofile.aspx.cs" Inherits="TSM_Project.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="icon_desktop"></i> Profile</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="icon_desktop"></i>Edit Profile</li>
             
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
           <asp:Label ID="lbroleid" runat ="server" Visible="false"></asp:Label>
                <asp:Label ID="lbempid" runat="server" Visible="false"></asp:Label>

                  <h4><asp:Label ID="proname1" runat="server">  <%#proname1%>
 </asp:Label>&nbsp;<asp:Label ID="proname2" runat="server">  <%#proname2%>
 </asp:Label></h4>
                  <div class="follow-ava">
                    <img src="img/profile-widget-avatar.jpg" alt="">
                  </div>
                  <h6></h6>
                </div>
                <div class="col-lg-4 col-sm-4 follow-info">
                  
                  <p><asp:Label ID="profirstlastname1" runat="server">  <%#profirstlastname1%></asp:Label>
                     <p> <asp:Label ID="profirstlastname2" runat="server" ><%#profirstlastname2%></asp:Label></p>
                  <p> <asp:Label ID="twit" runat="server" class="fa fa-mail-reply-all">  <%#twit%> ></asp:Label></p>
                 <p> <asp:Label ID="mob" runat="server" class="fa fa-mobile">  <%# mob%> ></asp:Label></p>

                  <h6>
                                    <span><i class="icon_calendar"></i><asp:Label ID="lbdatetime1" runat="server"><%# lbdatetime1 %></asp:Label></span>
                                    <span><i class="icon_clock_alt"></i><asp:Label ID="lbdatetime2" runat="server"><%# lbdatetime2 %></asp:Label></span>
                                    <span><i class="icon_pin_alt"></i><asp:Label ID="procity" runat="server"> <%# procity%></asp:Label></span>
                                </h6>
                </div>
                <div class="col-lg-2 col-sm-6 follow-info weather-category">
                  <ul>
                    <li class="active">

                      <i class="fa fa-comments fa-2x"> </i><br> Contrary to popular belief, Lorem Ipsum is not simply
                    </li>

                  </ul>
                </div>
                <div class="col-lg-2 col-sm-6 follow-info weather-category">
                  <ul>
                    <li class="active">

                      <i class="fa fa-bell fa-2x"> </i><br> Contrary to popular belief, Lorem Ipsum is not simply
                    </li>

                  </ul>
                </div>
                <div class="col-lg-2 col-sm-6 follow-info weather-category">
                  <ul>
                    <li class="active">

                      <i class="fa fa-tachometer fa-2x"> </i><br> Contrary to popular belief, Lorem Ipsum is not simply
                    </li>

                  </ul>
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
                    <asp:LinkButton ID="editprofilebtn" runat="server"  Text="Edit Profile" class="icon-envelope" PostBackUrl="~/Editprofile.aspx">
                                      </asp:LinkButton>
                  </li>
                </ul>
              </header>
              <div class="panel-body">
                <div class="tab-content">
                  <div id="recent-activity" class="tab-pane active">
                    
                  
                  <!-- edit-profile -->
                  <div id="edit-profile" class="tab-pane">
                    <section class="panel">
                      <div class="panel-body bio-graph-info">
                        <h1> Profile Info</h1>
                        <div class="form-horizontal" role="form">
                          <div class="form-group">
                            <label class="col-lg-2 control-label">First Name</label>
                            <div class="col-lg-6">
                              <asp:TextBox ID="txtfirstname" runat="server" class="form-control"></asp:TextBox>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Last Name</label>
                            <div class="col-lg-6">
                          <asp:TextBox ID="txtlastname" runat="server" class="form-control"></asp:TextBox>                            

                            </div>
                          </div>
                          
                          <div class="form-group">
                            <label class="col-lg-2 control-label">City</label>
                            <div class="col-lg-6">
                          <asp:TextBox ID="txtCountry" runat="server" class="form-control"></asp:TextBox>                            
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Birthday</label>
                            <div class="col-lg-6">
                          <asp:TextBox ID="txtbirthday" TextMode="Date" runat="server" class="form-control"></asp:TextBox>                            
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Email</label>
                            <div class="col-lg-6">
                          <asp:TextBox ID="txtmail" TextMode="Email" runat="server" class="form-control"></asp:TextBox>                            
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-2 control-label">Mobile</label>
                            <div class="col-lg-6">
                          <asp:TextBox ID="txtmobile" TextMode="Number" runat="server" class="form-control"></asp:TextBox>                            
                            </div>
                          </div>
                          

                          <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                            <asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-success" OnClick="btnsave_Click"></asp:Button>
                           <asp:Button ID="btncancel" runat="server" Text="cancel" class="btn btn-danger" OnClick="btncancel_Click"></asp:Button>
                       <asp:Button ID="btnApprovepage" runat="server" Text="Approve List" Class="btn btn-primary" OnClick="btnApprovepage_Click" Visible="false"></asp:Button>

                            </div>
                          </div>
                        </div>
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
        <asp:Label ID="lbsuccess" runat="server" ForeColor="Green"></asp:Label>
                <asp:Label ID="lberror" runat="server" ForeColor="Red"></asp:Label>

    </section>
</asp:Content>
