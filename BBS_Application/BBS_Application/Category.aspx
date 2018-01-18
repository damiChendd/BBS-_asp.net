<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="BBS_Application.Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Park Computer</title>
    <link href="css/HeadStyle.css" rel="stylesheet" />
    <style type="text/css">
        .category{
            width:980px;
            height:800px;
            margin:0 auto;
        }
         .category .button{
             width:980px;
            margin-top:20px;
            padding-bottom:20px;
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!--导航栏-->
            <div class="headCss">
                <div class="head-content">
                    <div class="hr">
                        <ul>
                            <li><a href="HomePage.aspx">
                                <asp:Label ID="homePageLabel" runat="server" Text="首页"></asp:Label></a></li>
                            <li><a href="MyBlog.aspx">
                                <asp:Label ID="MyBlog" runat="server" Text="M博客"></asp:Label></a></li>
                            <li><a href="Category.aspx">
                                <asp:Label ID="category" runat="server" Text="分类"></asp:Label></a></li>
                        </ul>
                    </div>
                    <div class="mid">
                        <asp:TextBox Visible="false" ID="User_Need_Info" runat="server" Height="28px"></asp:TextBox>
                        <asp:Button Visible="false" ID="found_Button" runat="server" Text="搜索" BorderStyle="None" />
                    </div>
                    <div class="lr">
                        <a id="Sign_In_a" href="Sign_In.aspx">
                            <asp:Label ID="Sign_In" runat="server" Text="登陆"></asp:Label></a>
                        <a id="Register_a" href="index.aspx">
                            <asp:Label ID="Register" runat="server" Text="注册"></asp:Label></a>
                    </div>
                </div>
            </div>
         <!--分类-->
        <div class="category">
            <h3 style="margin-top:20px;">帖子类别</h3>
            <hr />
            <div class="button">
            <asp:Button ID="Button1" runat="server" Text="C语言"  Width="980px" Height="50px" BorderStyle="None" Font-Names="Comic Sans MS" BackColor="#73dfb1" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="c#" Width="980px" Height="50px" BorderStyle="None" Font-Names="Comic Sans MS" BackColor="#dae17d" OnClick="Button2_Click"/>
            <asp:Button ID="Button3" runat="server" Text="java" Width="980px" Height="50px" BorderStyle="None" Font-Names="Comic Sans MS" BackColor="#a1a1a1" OnClick="Button3_Click"/>
            <asp:Button ID="Button4" runat="server" Text="android" Width="980px" Height="50px" BorderStyle="None" Font-Names="Comic Sans MS" BackColor="#d7977b" OnClick="Button4_Click"/>
            <asp:Button ID="Button5" runat="server" Text=".net" Width="980px" Height="50px" BorderStyle="None" Font-Names="Comic Sans MS" BackColor="#a46f87" OnClick="Button5_Click"/>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
