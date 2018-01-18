<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertHomePage.aspx.cs" Inherits="BBS_Application.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <hr />
                <table style="width:800px; height:200px">
                    <tr>
                        <td>
                            <a href='<%# DataBinder.Eval(Container.DataItem,"NoticeId", "noticeAll.aspx?id={0}")  %>' style="font-size:large;" target="_blank"><%# DataBinder.Eval(Container.DataItem, "NoticeTitle") %></a>
                        </td>
                        <td rowspan="2">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/1.jpg" Height="200px" Width="200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Width="600px"><%# DataBinder.Eval(Container.DataItem, "NoticeDetail").ToString().Length > 260?DataBinder.Eval(Container.DataItem, "NoticeDetail").ToString().Substring(0, 250)+"...":DataBinder.Eval(Container.DataItem, "NoticeDetail").ToString()%> </asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
