<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllGuests.aspx.cs" Inherits="SME_Camping.AllGuests" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigationHeader.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ucNav:Nav runat="server"/>
        <asp:Panel ID="PnMap" runat="server">
            <asp:Image ID="Image1" runat="server" Height="212px" ImageUrl="~/Images/Capmingplaatjegroot.jpg" Width="332px" />
            <br />
            <asp:DropDownList ID="DdlLocation" runat="server">
            </asp:DropDownList>
        </asp:Panel>
        <asp:Panel ID="PnGuests" runat="server" GroupingText="Gasten Lijst">
            <asp:TextBox ID="TbSearchOnName" runat="server"></asp:TextBox>
            <asp:Button ID="BtnSearchOnName" runat="server" Text="Zoek op naam" />
            <br />
            <asp:ListBox ID="LbGuestList" runat="server" Height="261px" Width="268px"></asp:ListBox>
        </asp:Panel>
    </form>
</body>
</html>
