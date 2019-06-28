<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/MasterPage/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ViewSheets.aspx.cs" Inherits="TSM_Project.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
              <br />
            <h3 class="page-header"><i class="fa fa fa-bars"></i>Veiw Sheets</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="DashBoard.aspx">Home</a></li>
              <li><i class="fa fa-bars"></i>Veiw Sheets</li>
              
            </ol>
          </div>
        </div>
        <!-- page start-->        
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <section class="wrapper">
                             <asp:Label ID="lbusername" runat="server" Visible="false"></asp:Label>

                            <asp:Label ID="lbroleid" runat="server" Visible="false"></asp:Label>
      
                        <header class="panel-heading">
                            <h3>Time Sheet Records</h3>
                        </header>
                        <br />
                        <div class="col-lg-12" >
                             <asp:GridView ID="EmpView" runat="server" AutoGenerateColumns="false" ShowFooter="false" DataKeyNames="TimeSheet_ID"
                                    class="table panel table-striped table-advance table-hover"
                                    Style="margin-left: 0px" Width="866px">
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
           <asp:Button ID="viewbutton" runat="server" Class="btn btn-primary" Visible="false" Text="View Employees Time Sheets" CausesValidation="false" OnClick="viewbutton_Click"/>
      </section>
    </section>

</asp:Content>
