<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="induviduele_opdracht_MyCom.Homepage" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigatieBalk.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ucNav:Nav runat="server"/>
        <asp:Panel ID="pnHomePage" runat="server">
            <asp:Panel ID="pnCategorieën" runat="server" GroupingText="Categorieën">
                <asp:ListBox ID="lbHoofdCat" runat="server" Height="300px" Width="245px"></asp:ListBox>
                <asp:ListBox ID="lbSubCat" runat="server" Height="300px" Width="245px"></asp:ListBox>
                <asp:ListBox ID="lbItem" runat="server" Height="300px" Width="245px"></asp:ListBox>
                <br />
                <asp:TextBox ID="tbInfo" runat="server" Enabled="False" Height="195px" Width="735px"></asp:TextBox>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
