<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/MasterPage/Site.Master" AutoEventWireup="true" CodeBehind="ApprovalPage.aspx.cs" Inherits="TSM_Project.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <section id="main-content">
      <section class="wrapper">
   
    <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="icon_desktop"></i>Approve Profile</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="icon_desktop"></i>Approve Profile</li>
             
            </ol>
          </div>
        </div>
          <div class="row">
          <!-- profile-widget -->
          <div class="col-lg-12">
            <div class="profile-widget profile-widget-info">
              <div class="panel-body">
                  <h3>Approve Page</h3>
                <div class="col-lg-2 col-sm-2">
             <asp:Label ID="lbusername" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lbroleid" runat ="server" Visible="false"></asp:Label>
                <asp:Label ID="lbempid" runat="server" Visible="false"></asp:Label>

                  <h4><asp:Label ID="proname1" runat="server">  <%#proname1%>
 </asp:Label>&nbsp;<asp:Label ID="proname2" runat="server">  <%#proname2%>
 </asp:Label></h4>
                 </div>
              </div>
            </div>
          </div>
        </div>
    <div id="edit-profile" class="tab-pane">
                    <section class="panel">
                      <div class="panel-body bio-graph-info">
                        <h1> Profile Info</h1>
                        <div class="form-horizontal" role="form">
                                     <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <section class="wrapper">
                        <header class="panel-heading">
                           <h3> Approval Table</h3>
                        </header>
                        <br />
                          
                        <div class="col-lg-12" >
                        <asp:GridView ID="EmpView" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="Approve_ID" 
                            class="table panel table-striped table-advance table-hover" 
                            style="margin-left: 0px" Width="866px" OnRowCommand="EmpView_RowCommand">
                            <Columns>
                               
                                <asp:TemplateField HeaderText="Updated Fisrt Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbfirstnameup" Text='<%# Eval("updatedFirst_name") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtfisrtnameup" Text='<%# Eval("updatedFirst_name") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtfisrtnamefooterup" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Updated Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblastnameup" Text='<%# Eval("updatedLast_name") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtlastnameup" Text='<%# Eval("updatedLast_name") %>' runat="server"></asp:TextBox>
                                    
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtlastnamefooterup" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Updated Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lbemailup" Text='<%# Eval("updatedemail") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtemailup" Text='<%# Eval("updatedemail") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtemailfooterup" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Updated Mobile Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lbmobileup" Text='<%# Eval("updatedmobile") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtmobileup" Text='<%# Eval("updatedmobile") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtmobilefooterup" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                
                                <asp:TemplateField HeaderText="Updated DOB">
                                    <ItemTemplate>
                                        <asp:Label ID="lbDOBup" Text='<%# Eval("updatedDOB") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtDOBup" Text='<%# Eval("updatedDOB") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtDOBfooterup" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Updated City">
                                    <ItemTemplate>
                                        <asp:Label ID="lbcityup" Text='<%# Eval("updatedcity") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtcityup" Text='<%# Eval("updatedcity") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtDOBfooterup" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                   <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnedit" ImageUrl="~/img/edit.jpg" runat="server" ToolTip="Edit" Height="20px" Width="20px" CommandName="ApproveEmployee" CommandArgument='<%# Eval("Approve_ID") %>'/>
                                        <asp:ImageButton ID="imgbtndel" ImageUrl="~/img/delbtn.jpg" runat="server" ToolTip="Delete" Height="20px" Width="20px" />

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

                          

                          
                        </div>
                      </div>
                    </section>
                  </div>
          </section>
         </section>
</asp:Content>
