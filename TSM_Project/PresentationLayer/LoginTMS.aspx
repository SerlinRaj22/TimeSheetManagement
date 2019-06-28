<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginTMS.aspx.cs" Inherits="TSM_Project.LoginTMS" %>

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
  <link href="../css/bootstrap.min.css" rel="stylesheet"/>
  <!-- bootstrap theme -->
  <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
  <!--external css-->
  <!-- font icon -->
  <link href="../css/elegant-icons-style.css" rel="stylesheet" />
  <link href="../css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="../css/style.css" rel="stylesheet"/>
  <link href="../css/style-responsive.css" rel="stylesheet" />


</head>
<body class="login-img3-body ">
    <h2 class="text-center"><strong>Time Sheet Management</strong></h2>
    <div class="container">

    <form id="form1" runat="server" class="login-form">
                    

        <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i>
              <asp:TextBox ID="txtloginname" runat="server" Class="form-control" Width="96%"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtloginname" ErrorMessage="Please enter the Username" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>
                    </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i>
            <asp:TextBox ID="txtpassword" runat="server" class="form-control" TextMode="Password" Width="96%"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please enter the Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>
        </div>
        <label class="checkbox">
           
                
                <span class="pull-right">  
                    <a href="ChangePassword.aspx" runat="server" text="Forget Password?">Forget Password?</a>
                                       </span>
            </label>
          <asp:Button ID="btnlogin" runat="server" class="btn btn-primary btn-lg btn-block" Text="Login" OnClick="btnlogin_Click"/>
            <asp:Label ID="lberror" runat="server" ForeColor="Red"></asp:Label>
      </div>
               </form> 
        <asp:Label ID="lbroleid" runat="server" Visible="false"></asp:Label>
        </div>
</body>
</html>
