<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categoryshow.aspx.cs" Inherits="BBS_Application.Categoryshow" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/HeadStyle.css" rel="stylesheet" />
    <title>Park Computer</title>
    <style type="text/css">
        <!--datagrid-->
        .datagridBox{
        }
        .datagrid{
            width:980px;
            margin:0 auto;
            margin-top:30px;
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
                            <li><a href="CateGory.aspx">
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

        <!--分类信息展示-->
        <div class="datagridBox">
            <div class="datagrid">
                <h3><asp:Label ID="titleLabel" runat="server"></asp:Label></h3><hr />
               
                <asp:DataGrid runat="server" ID="Category_show_Datagrid" DataKeyField="NoticeId" AutoGenerateColumns="false"  Height="247px" Width="980px" OnDeleteCommand="Category_show_Datagrid_DeleteCommand">
                    <Columns>
                        <asp:BoundColumn DataField="NoticeId" HeaderText="NoticeId" Visible="false">
                            <HeaderStyle BackColor="ActiveBorder" HorizontalAlign="Center" Width="200px" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundColumn>
                        <asp:BoundColumn HeaderText="文章标题" DataField="NoticeTitle">
                          <HeaderStyle HorizontalAlign="Center" BackColor="WhiteSmoke" Width="920px"/>
                            <ItemStyle HorizontalAlign="Center"/>
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="删除">
                            <HeaderStyle HorizontalAlign="Center" Width="60px" BackColor="ActiveBorder"/>
                            <ItemStyle HorizontalAlign="Center"/>
                            <ItemTemplate>
                                <asp:LinkButton ID="sc" runat="server" CommandName="delete">
                                    <img src="img/icon_delete_n.png" width="20px" height="20px"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>   
                    </Columns>
                </asp:DataGrid>
            </div>
        </div>
        <div>

        </div>
    </div>
    </form>
</body>
</html>

