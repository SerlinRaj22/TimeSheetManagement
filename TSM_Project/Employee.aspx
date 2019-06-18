<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="TSM_Project.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-table"></i>Employee</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                        <li><i class="fa fa-table"></i>Employee</li>

                    </ol>
                </div>
            </div>
            <!-- page start-->

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <section class="wrapper">
                        <header class="panel-heading">
                            Employee Table
                        </header>
                        <br />
                        <div class="col-lg-12" >
                        <asp:GridView ID="EmpView" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="Emp_ID" 
                            class="table panel table-striped table-advance table-hover" 
                            OnRowCommand="EmpView_RowCommand" 
                            OnRowEditing="EmpView_RowEditing"
                            OnRowCancelingEdit="EmpView_RowCancelingEdit" 
                            OnRowUpdating="EmpView_RowUpdating" OnRowDeleting="EmpView_RowDeleting"  style="margin-left: 0px" Width="866px">
                            <Columns>
                                <asp:TemplateField HeaderText="Fisrt Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbfirstname" Text='<%# Eval("First_Name") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtfisrtname" Text='<%# Eval("First_Name") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtfisrtnamefooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblastname" Text='<%# Eval("Last_Name") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtlastname" Text='<%# Eval("Last_Name") %>' runat="server"></asp:TextBox>
                                    
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtlastnamefooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lbemail" Text='<%# Eval("Email") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtemail" Text='<%# Eval("Email") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtemailfooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Mobile Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lbmobile" Text='<%# Eval("Mobile_number") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtmobile" Text='<%# Eval("Mobile_number") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtmobilefooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                
                                <asp:TemplateField HeaderText="DOB">
                                    <ItemTemplate>
                                        <asp:Label ID="lbDOB" Text='<%# Eval("DOB") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtDOB" Text='<%# Eval("DOB") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtDOBfooter" runat="server"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnedit" ImageUrl="~/img/edit.jpg" CommandName="Edit" runat="server" ToolTip="Edit" Height="20px" Width="20px" />
                                        <asp:ImageButton ID="imgbtndel" ImageUrl="~/img/delbtn.jpg" CommandName="Delete" runat="server" ToolTip="Delete" Height="20px" Width="20px" />

                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="imgbtnupdate" ImageUrl="~/img/savebtn.jpg" CommandName="Update" runat="server" ToolTip="Update" Height="20px" Width="20px" />
                                        <asp:ImageButton ID="imgbtncancel" ImageUrl="~/img/cancel.jpg" CommandName="Cancel" runat="server" ToolTip="Cancel" Height="20px" Width="20px" />

                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ID="imgbtnadd" ImageUrl="~/img/addbtn.jpg" CommandName="Add" runat="server" ToolTip="Add" Height="20px" Width="20px" />

                                    </FooterTemplate>

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
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: 'EmployeeService.asmx/empLoad',
                method: 'post',
                dataType: 'Json',
                success: function (data) {
                    $('#EmployeeTable').dataTable({
                        data: data,
                        columns: [
                            { 'data': 'Emp_ID' },
                            { 'data': 'First_Name' },
                            { 'data': 'Last_Name' },
                            { 'data': 'Gender' },
                            { 'data': 'DOB' },
                            { 'data': 'City' },
                            { 'data': 'Assigned_project_ID' },

                        ]

                    });
                }
            });

        });
    </script>
</asp:Content>
