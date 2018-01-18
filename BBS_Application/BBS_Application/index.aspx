<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BBS_Application.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Park Computer</title>
    <style type="text/css">
        * {
            margin: 0px auto;
        }
        .hrCSS {
           
        }
        .blur {
            width: auto;
            min-width: 344px;
            height: auto;
            min-height: 688px;
            background-size: cover;
            background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAcAAAADCAYAAABfwxXFAAAAVUlEQVQYV2NU11D67zfxAoPLXgOGvE0MDAx+ExkuOu9l0M/fxMCoruH9v3DjcgaH/ZEM/hOuM2gVbGBY7niAIdJ/AkhS6T9YdZM9Axg8XACWuAZkAwD3sBt+cagASQAAAABJRU5ErkJggg==");
        }

        .fontclass {
            font-family: graphik;
            font-size: 30px;
            color: ghostwhite;
            font-style: italic;
            margin-top: 80px;
            text-align: center;
        }
        .textBoxCSS {
            border-radius:6px;
        }
        .tableConfig {
            margin-top:80px;
            font-family: graphik;
            font-size: 18px;
            color: ghostwhite;
            font-style: italic;
        }
    </style>
</head>
<body class="blur">
    <form id="form1" runat="server">
        <div class="fontclass">
            <asp:Label ID="labelTitle" runat="server" Text="Creat Your ID"></asp:Label>
        </div>
        <div class="tableConfig">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="UserName" runat="server" Text="UserName" Width="135px" Height="18px" CssClass="textBoxCSS" ForeColor="#808080"></asp:TextBox>
                        <asp:TextBox ID="Password" runat="server" Text="PassWord" Width="135px" Height="18px" CssClass="textBoxCSS" ForeColor="#808080"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="provinceList" runat="server" DataValueField="ProvinceName" Width="280px" Height="22px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <asp:Label ID="Label1" runat="server" Text="请选择您的出生日期：" Width="270px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="YearsList" runat="server" OnSelectedIndexChanged="YearsList_SelectedIndexChanged" Width="90px" Height="22px"></asp:DropDownList>
                        <asp:DropDownList ID="MouthList" runat="server" OnSelectedIndexChanged="MouthList_SelectedIndexChanged" Width="90px" Height="22px"></asp:DropDownList>
                        <asp:DropDownList ID="DayList" runat="server" Width="90px" Height="22px"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <asp:Label ID="Label2" runat="server" Text="请输入您的手机号:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="UserPhone" runat="server" Text="Phone" Width="280px" Height="18px" CssClass="textBoxCSS" ForeColor="#808080"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="ImageCheckCode" runat="server" Width="280px" Height="40px" ImageUrl="~/CreatImage.aspx"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        <asp:TextBox ID="MatchedText" runat="server" Width="140px" Height="40px" BorderStyle="Groove"></asp:TextBox>
                        <asp:Image ID="checkCodeImage" runat="server" Width="20px" Height="20px" Visible="false"/>
                        <asp:Button ID="OkBtn" runat="server" Text="注册" Width="100px" Height="40px" BorderStyle="Groove" OnClick="OkBtn_Click"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="checkEmpty" runat="server" Text="用户名或密码为空，请重新输入" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

        <div style="margin-top:200px; border:none; border-bottom:0px ridge #808080"><hr /></div>
    </form>
</body>
</html>
