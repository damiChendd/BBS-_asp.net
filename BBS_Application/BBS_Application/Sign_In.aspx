<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign_In.aspx.cs" Inherits="BBS_Application.Sign_In" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Park Computer</title>
    <style type="text/css">
        *{
            margin:0px;
            padding:0;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
        }
        .blur {
            width: auto;
            min-width: 344px;
            height: auto;
            min-height: 688px;
            background-size: cover;
            background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAADCAYAAABfwxXFAAAAVUlEQVQYV2NU11D67zfxAoPLXgOGvE0MDAx+ExkuOu9l0M/fxMCoruH9v3DjcgaH/ZEM/hOuM2gVbGBY7niAIdJ/AkhS6T9YdZM9Axg8XACWuAZkAwD3sBt+cagASQAAAABJRU5ErkJggg==");
        }
        .box{    
            height:auto;
        }
        .box .loginTab{
            width:600px;
            height:400px;
            background-color:#fbf6f6;  
            margin:0 auto;   
            margin-top:100px;
        }
        .box .loginTab .top{
            width:500px;
            height:300px;
            background-color:#fbf6f6;
            margin-left:50px;
            margin:0 auto;
        }
         .box .loginTab .top .small{
             width:400px;
             height:50px;
             margin-left:50px;
             background-color:#fbf6f6;
             line-height:60px;
         }
        .box .loginTab .foot{
            width:600px;
            height:100px;
            background-color:#EBEFF2;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0;
        }
        .box .loginTab .foot .left{           
            float:left;
            height:50px;
            line-height:100px;
            margin-left:80px;
            background-color:#EBEFF2;
        }
        .box .loginTab .foot .right{
            float:right;
            line-height:100px;
            margin-right:80px;
            background-color:#EBEFF2;
        }
        .box .loginTab .foot .reg{
            float:right;
            line-height:100px;
            margin-right:10px;
            background-color:#EBEFF2;
        }
    </style>
</head>
<body class="blur">
    <form id="form1" runat="server">
        <div  class="box">
            <div  class="loginTab">

                <div class="top">
                    <div class="small"><asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label></div>
                    <div class="small"><asp:TextBox ID="UserName" runat="server" Width="400" Height="40"  BackColor="#fbf6f6"></asp:TextBox></div>
                    <div class="small"><asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label></div>
                    <div class="small"><asp:TextBox ID="Password" runat="server"   Width="400" Height="40" BackColor="#fbf6f6" TextMode="Password"></asp:TextBox></div>
                </div>
                    
                <div class="foot">
                    <div class="left"><asp:RadioButton ID="keep" runat="server" />Keep me logged in</div>
                    <div class="right"><asp:Button ID="login" runat="server" Text="Login"  Width="50" Height="30" OnClick="login_Click"/></div>
                    <div class="reg"><asp:Button ID="register" runat="server" Text="Register" Width="50px" Height="30px" OnClick="register_Click"/></div>
                </div>
                                  
            </div>
        </div>
    </form>
</body>
</html>
