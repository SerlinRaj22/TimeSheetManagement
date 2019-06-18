<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="TSM_Project.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template"/>
  <meta name="author" content="GeeksLabs"/>
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal"/>
  <link rel="shortcut icon" href="img/favicon.png"/>
  <!-- Bootstrap CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet"/>
  <!-- bootstrap theme -->
  <link href="css/bootstrap-theme.css" rel="stylesheet"/>
  <!--external css-->
  <!-- font icon -->
  <link href="css/elegant-icons-style.css" rel="stylesheet" />
  <link href="css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="css/style.css" rel="stylesheet"/>
  <link href="css/style-responsive.css" rel="stylesheet" />


</head>
<body class="login-img3-body ">
    <div class="container">

    <form id="form1" runat="server" class="login-form">
                    

        <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
             <asp:Label ID="lbusername" runat="server" Text="User Name"></asp:Label>
            <br/>
            
        <div class="input-group">
            
             <span class="input-group-addon"><i class="icon-star"></i>
              <asp:TextBox ID="txtusername" runat="server" Class="form-control" Width="97%"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusername" ErrorMessage="Please enter the User Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>
             </div>
           

            <asp:Label ID="lbnewpassword" runat="server" Text="New Password"></asp:Label>
            <br/>
            
        <div class="input-group">
            
             <span class="input-group-addon"><i class="icon_profile"></i>
              <asp:TextBox ID="txtnewpassword" runat="server" Class="form-control" Width="97%"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnewpassword" ErrorMessage="Please enter the new password" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>
             </div>
           
            
            <asp:Label ID="lbconfirmpass" runat="server" Text="Re-enter Password"></asp:Label>
            <br/>
           
        <div class="input-group">
             
          <span class="input-group-addon"><i class="icon_key_alt"></i>
            <asp:TextBox ID="txtrepassword" runat="server" class="form-control" TextMode="Password" Width="97%"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtrepassword" ErrorMessage="Please Re-enter the Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>
        </div>
        
            <asp:Button ID="btnupdate" runat="server" class="btn btn-primary btn-lg btn-block" Text="Save" OnClick="btnupdate_Click"/>
            <asp:Label ID="lberror" runat="server" ForeColor="Red"></asp:Label>
      </div>
               </form>          
        </div>
</body>
</html>
