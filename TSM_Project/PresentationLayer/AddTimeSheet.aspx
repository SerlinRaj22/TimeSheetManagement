<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/MasterPage/Site.Master" AutoEventWireup="true" CodeBehind="AddTimeSheet.aspx.cs" Inherits="TSM_Project.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="fa fa-file-text-o"></i> Time Sheets</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="icon_document_alt"></i>Time Sheets</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                <h3>Time Sheet</h3>
              </header>
              <div class="panel-body form-horizontal">
                   <div class="form-group">
                          <label class="control-label col-sm-2">User Name</label>
                          <div class="col-sm-6">
                             <asp:Label ID="lbusername"  class="form-control" runat="server"></asp:Label>
                          </div>
                      </div>                  
                     
                 
                      <div class="form-group">
                          <label class="control-label col-sm-2">Date</label>
                          <div class="col-sm-6">
                             <asp:TextBox ID="txtDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                          </div>
                      </div>                  
                      <div class="form-group">
                          <label class="col-sm-2 control-label">Start-Time</label>
                          <div class="col-sm-6">
                        <asp:TextBox ID="txtstarttime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="col-sm-2 control-label">End-Time</label>
                          <div class="col-sm-6">
                     <asp:TextBox ID="txtendtime" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="col-sm-2 control-label">Project ID</label>
                          <div class="col-sm-6">
                              <asp:DropDownList ID="ddlproject" runat="server" class="form-control m-bot15" DataTextField="Project_ID"> 
                              </asp:DropDownList>
                          </div>
                          
                      </div>

                  <div>
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-success" Height="35" Width="75" OnClick="btnsave_Click"/>
                    <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Height="35" Width="75" OnClick="btncancel_Click"/>
                      <br /> 
                      <asp:Label ID="lbsuccess" runat="server" ForeColor="Green"></asp:Label>
                        <br />
                        <asp:Label ID="lberror" runat="server" ForeColor="Red"></asp:Label>
                 </div>
              </div>
            </section>
          </div>
       </div>
        <!-- page end-->
      </section>
    </section>

    

</asp:Content>
