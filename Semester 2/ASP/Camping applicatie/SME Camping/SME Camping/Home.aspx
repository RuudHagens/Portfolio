<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SME_Camping.WebForm1" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigationHeader.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Home" runat="server">
        <ucNav:Nav runat="server"/>
        <asp:Panel ID="Panel1" runat="server">
            <asp:Image ID="ImgCamping" runat="server" Height="253px" ImageUrl="~/Images/Capmingplaatjegroot.jpg" Width="516px" />
        </asp:Panel>
    </form>
</body>
</html>
