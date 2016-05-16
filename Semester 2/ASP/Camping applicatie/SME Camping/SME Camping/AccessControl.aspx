<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessControl.aspx.cs" Inherits="SME_Camping.WebForm4" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigationHeader.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ucNav:Nav runat="server"/>
        <asp:Button ID="BtnAllGuests" runat="server" OnClick="BtnAllGuests_Click" Text="Ga naar lijst met alle bezoekers" />
        <asp:Panel ID="PnScanned" runat="server" GroupingText="Gescande bezoeker">
            <asp:ListBox ID="LbScannedUser" runat="server" Height="256px" Width="240px"></asp:ListBox>
            <br />
            <asp:Image ID="ImgProfilePic" runat="server" Height="100px" Width="100px" />
        </asp:Panel>
        <asp:Panel ID="PnGuestAtReservation" runat="server" GroupingText="Bezoekers Bij Reservering">
            <asp:ListBox ID="LbGuestAtReservation" runat="server" Height="165px" Width="267px"></asp:ListBox>
        </asp:Panel>
    </form>
</body>
</html>
