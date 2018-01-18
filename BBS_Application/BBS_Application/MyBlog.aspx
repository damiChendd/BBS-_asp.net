<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBlog.aspx.cs" Inherits="BBS_Application.MyBlog" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Park Computer</title>
    <style type="text/css">
        *
        {
        	margin:0;
        	padding:0;
        }
        li
        {
        	list-style:none;
        }
        <!--导航栏-->
        .headCss
        {
        	height:50px;
        	background-color:#eee;
        	
        }
        .headCss .head-content
        {
            width:980px;
            height:50px;
            margin:0 auto;
        }
        .headCss .head-content .hr
        {
            width:300px;
            height:50px;
            float:left;
        }
        .headCss .head-content .hr li
        {	
        	float:left;
        	
        }
        .headCss .head-content li a
        {
        	display:inline-table;
        	width:100px;
        	height:50px;
        	line-height:50px;
        	padding-left:30px;
            text-decoration:none;
            color:#000;
        }
        .headCss .head-content li a:hover
        {
        	background-color:#ababab;
            text-decoration:none;
        }
        .headCss .head-content .mid
        {
            width:220px;
            height:50px;
            line-height:50px;
            float:left;	
        }
        .headCss .head-content .lr
        {
        	width:200px;
        	height:50px;      	
        	float:right;
        }
        .headCss .head-content .lr a
        {
            display:inline-table;
            width:50px;
            height:50px;
            line-height:50px;
        }
    <!--我的头像+写文章-->
        .writepageBox{
            height:100px;
            
        }
        .writepage{
            width:980px;
            height:100px;
            margin:0 auto;
        }
        .writepage .picture{
            width:200px;
            height:100px;
            background-color:green;
            float:left;
        }
        .writepage .write{
            width:100px;
            height:100px;
            float:right;
            margin-right:60px;
            line-height:100px;
        }
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
        <!--标题栏-->
        <div class="headCss">
            <div class="head-content">
                <div class="hr">
                    <ul>
                    <li><a href="HomePage.aspx"><asp:Label ID="homePageLabel" runat="server" Text="首页"></asp:Label></a></li>
                    <li><a href="MyBlog.aspx"><asp:Label ID="MyBlog_lbl" runat="server" Text="M博客"></asp:Label></a></li>
                    </ul>
                </div> 
                <div class="mid">
                    <asp:TextBox Visible="false" ID="User_Need_Info" runat="server" Height="28px"></asp:TextBox>
                    <asp:Button Visible="false" ID="found_Button" runat="server" Text="搜索" BorderStyle="None" />
                </div>
                <div class="lr">
                    <a href="Sign_In.aspx"><asp:Label ID="Sign_In" runat="server" Text="登陆"></asp:Label></a>
                    <a href="index.aspx"><asp:Label ID="Register" runat="server" Text="注册"></asp:Label></a>
                </div>
            </div>
        </div>
        <!--个人头像栏+写文章+文章转移-->
        <div class="writepageBox">
            <div class="writepage">
                <div class="picture"><asp:Image ID="Image1" runat="server" /></div>
                <div class="write"><asp:Button ID="Button1" runat="server" Text="写文章" width="50px" Height="50px" margin-top="25px" OnClick="Button1_Click"/></div>
            </div>
        </div>
        <!--datagrid看删改置顶-->
        <div class="datagridBox">
            <div class="datagrid">
                <h3>我的文章</h3><hr />
                <asp:Label ID="no_notice_Info" runat="server" Text="您还没有发表文章" Font-Size="Smaller" ForeColor="Red" Visible="false"></asp:Label>
                <asp:DataGrid Visible="false" ID="MyBlog_DataGrid" DataKeyField="NoticeId" runat="server" Height="247px" Width="980px" AutoGenerateColumns="false" OnDeleteCommand="MyBlog_DataGrid_DeleteCommand" OnUpdateCommand="MyBlog_DataGrid_UpdateCommand">
                    <Columns>
                        <asp:BoundColumn DataField="NoticeId" HeaderText="NoticeId" Visible="false">
                            <HeaderStyle BackColor="ActiveBorder" HorizontalAlign="Center" Width="200px" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundColumn>
                        <asp:BoundColumn HeaderText="文章标题" DataField="NoticeTitle">
                          <HeaderStyle HorizontalAlign="Center" BackColor="WhiteSmoke" Width="800px"/>
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
                        <asp:TemplateColumn HeaderText="编辑">
                            <HeaderStyle HorizontalAlign="Center" Width="60px" BackColor="ActiveBorder"/>
                            <ItemStyle HorizontalAlign="Center"/>
                            <ItemTemplate>
                                <asp:LinkButton ID="bj" runat="server" CommandName="update">
                                    <img src="img/bj.jpg" width="20px" height="20px"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>  
                    </Columns>
                </asp:DataGrid>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

