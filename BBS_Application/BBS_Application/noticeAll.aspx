<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noticeAll.aspx.cs" Inherits="BBS_Application.noticeAll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Park Computer</title>
    <style type="text/css">
        * {
            margin: 0;
        }

        li {
            list-style: none;
        }

        .headCss {
            height: 50px;
            background-color: #eee;
        }

            .headCss .head-content {
                width: 980px;
                height: 50px;
                margin: 0 auto;
            }

                .headCss .head-content .hr {
                    width: 300px;
                    height: 50px;
                    float: left;
                }

                    .headCss .head-content .hr li {
                        float: left;
                    }

                .headCss .head-content li a {
                    display: inline-table;
                    width: 100px;
                    height: 50px;
                    line-height: 50px;
                    padding-left: 30px;
                }

                    .headCss .head-content li a:hover {
                        background-color: #ababab;
                    }

                .headCss .head-content .mid {
                    width: 260px;
                    height: 50px;
                    line-height: 50px;
                    float: left;
                }

                .headCss .head-content .lr {
                    width: 200px;
                    height: 50px;
                    float: right;
                }

                    .headCss .head-content .lr a {
                        display: inline-table;
                        width: 50px;
                        height: 50px;
                        line-height: 50px;
                    }
    
        .box{
            height:520px;
            margin-top:50px;
        }
        .author{
            width:300px;
            height:500px;
            float:left;
            margin-left:100px;
            
        }
        .author .au{
            height:500px;
        }
        .author .au .zuoyouming{
            width:300px;
            height:80px;
            margin-left:20px;
        }
        .post {
            width:700px;
            height:500px;
            float:left;
            margin-left:100px;
            
        }
        .post .po{
            height:500px;
        }
        .post .po .title{
            text-align:center;
        }

        .post .po .title .content{
            text-indent:2em;
        }
      
        .ask{
            height:100px;
            background-color:#eee;
        }
        .ask .as{
            width:300px;
            margin-left:100px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--标题 -->
            <div class="headCss">
                <div class="head-content">
                    <div class="hr">
                        <ul>
                            <li><a href="http://localhost:23307/HomePage.aspx">
                                <asp:Label ID="homePageLabel" runat="server" Text="首页"></asp:Label></a></li>
                            <li><a href="MyBlog.aspx">
                                <asp:Label ID="MyBlog" runat="server" Text="M博客"></asp:Label></a></li>
                        </ul>
                    </div>
                    <div class="mid">
                        <asp:TextBox Visible="false" ID="User_Need_Info" runat="server" Height="28px"></asp:TextBox>
                        <asp:Button Visible="false" ID="found_Button" runat="server" Text="搜索" BorderStyle="None" />
                    </div>
                    <div class="lr">
                        <a id="Sign_In_a" href="http://localhost:23307/Sign_In.aspx">
                            <asp:Label ID="Sign_In" runat="server" Text="登陆"></asp:Label></a>
                        <a id="Register_a" href="http://localhost:23307/index.aspx">
                            <asp:Label ID="Register" runat="server" Text="注册"></asp:Label></a>
                    </div>
                </div>
            </div>
            <!--帖子展示 -->
            <div class="box">
                <!--作者信息 -->
                <div class="author">
                    <fieldset class="au">
                        <legend>作者信息</legend>
                        <asp:Image ID="UserPhoto" runat="server" width="360px" Height="200px" BackColor="Green" ImageAlign="AbsMiddle"/><br />
                        <hr style="margin-top:60px"/>
                        <p style="text-align:right; font-family:'Comic Sans MS'; font-size:60px;">
                            <asp:Label ID="UserName" runat="server"></asp:Label>
                        </p>
                        <br />
                        <fieldset class="zuoyouming">
                            <legend>座右铭：</legend>
                            <asp:Label ID="motto" runat="server">这个人很懒，什么都没有留下~</asp:Label>
                        </fieldset>
                    </fieldset>
                </div>
                <!--帖子信息显示 -->
                <div class="post">
                    <fieldset class="po">
                        <legend>帖子详情</legend>
                        <h2 class="title"><asp:Label ID="NoticeTitle" runat="server"></asp:Label></h2>
                        <hr />
                        <p class="content">
                            <asp:TextBox ID="NoticeContent" runat="server" ReadOnly="true" Height="430px" Width="700px" TextMode="MultiLine" Font-Size="Large"></asp:TextBox></p>
                    </fieldset>
                </div>
            </div>

            <!--评论 -->
            <div class="ask">
                <div class="as">
                <asp:Label ID="Label2" runat="server" Text="评论:" ></asp:Label>
                <asp:TextBox ID="Pinglun" runat="server" TextMode="MultiLine" Width="1090px" Height="50px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" />
                <asp:Label ID="ErrorInfo" runat="server" Text="请登录后再试" Visible="false" ForeColor="Red" Font-Size="Smaller"></asp:Label>
                </div>
            </div>

            <!--评论展示 -->
            <div style="float:left; margin-left:100px; margin-top:20px">
                <asp:DataList ID="Ping_Lun_Qu" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <asp:Image ID="UserPhoto_Pinglun" runat="server" Height="40px" Width="40px" ImageUrl="~/img/1.jpg"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem, "PinglunUserName") %>:
                                </td>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem, "Pinglun") %>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <hr />
                <p style="text-align:center;">
                    <asp:Label ID="NULL_Pinglun" runat="server" Text="该文章还没有评论哦~" Visible="false"></asp:Label>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
