<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rightPage_Home.aspx.cs" Inherits="RightTestDemo.rightPage_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div> 
        <p style="text-align:center">
            <asp:Label ID="Label1" runat="server" Text="-----作者信息-----" Font-Size="30px" Font-Names="Comic Sans MS"></asp:Label>
        </p>
        <asp:DataList ID="Author_List" runat="server">
            <ItemTemplate>
                <table style="width:80px; height:30px;">
                    <tr>
                        <td style="width:80px; height:30px; padding-left:80px; font-size:20px; font-family:'Comic Sans MS';">
                            <a id="author_a" target="_blank" href='<%# DataBinder.Eval(Container.DataItem, "userID", "authorInfo.aspx?id={0}")  %>'> 
                                <%# DataBinder.Eval(Container.DataItem, "userName") %> 
                            </a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
