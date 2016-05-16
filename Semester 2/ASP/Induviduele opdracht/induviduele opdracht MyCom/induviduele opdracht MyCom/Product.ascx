<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Product.ascx.cs" Inherits="induviduele_opdracht_MyCom.Product1" %>
<asp:Panel ID="pnProductItem" runat="server" GroupingText="ProductNaam">
    <asp:Image ID="Image1" runat="server" Height="190px" Width="245px" />
    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Height="190px" ReadOnly="True" Width="390px"></asp:TextBox>
    <br />
    <asp:Label ID="lblPrijs" runat="server" Height="55px" Text="Prijs"></asp:Label>
    <asp:Button ID="btnBestellen" runat="server" Height="55px" Text="Bestellen" Width="200px" />
</asp:Panel>

