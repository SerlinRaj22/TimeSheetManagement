<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddprojectEmployee.aspx.cs" Inherits="TSM_Project.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="fa fa fa-bars"></i>Pages</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="fa fa-paperclip"></i>Pages</li>
              
            </ol>
          </div>
        </div>
        <!-- page start-->
        
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <section class="wrapper">
                        <header class="panel-heading">
                           <h3> Select Employee and Project</h3> 
                        </header>
                        <br />
                        
                       
                            <div class="panel-body form-horizontal">
                  
                     
                      <div class="form-group">
                          <label class="col-sm-2 control-label">Emp ID</label>
                          <div class="col-sm-6">
                              <asp:DropDownList ID="ddlempid" runat="server" class="form-control m-bot15" DataTextField="Emp_ID"> 
                              </asp:DropDownList>
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
                    <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Height="35" Width="75" />
          
                            </div>
                        <br />
                        <asp:Label ID="lbsuccess" runat="server" ForeColor="Green"></asp:Label>
                        <br />
                        <asp:Label ID="lberror" runat="server" ForeColor="Red"></asp:Label>

</div>
                        </section>
                    </section>
                    
                </div>
            </div>
<!-- page end-->
      </section>
    </section>
</asp:Content>
