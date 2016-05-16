<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigatieBalk.ascx.cs" Inherits="induviduele_opdracht_MyCom.WebUserControl1" %>
<asp:Panel ID="pnNavigatie" runat="server">
<asp:ImageButton ID="ImageButton1" runat="server" Height="82px" ImageUrl="~/images/logo mycom.png" Width="250px" />
<br />
<asp:Button ID="btnLaptop" runat="server" Text="Laptops" OnClick="btnLaptop_Click" />
<asp:Button ID="btnDesktop" runat="server" Text="Desktops &amp; Randapparatuur" OnClick="btnDesktop_Click" Width="195px" />
<asp:Button ID="btnComponenten" runat="server" Text="Componenten" OnClick="btnComponenten_Click" Width="101px" />
<asp:Button ID="btnOpslag" runat="server" Text="Opslag" OnClick="btnOpslag_Click" />
<asp:Button ID="btnTablets" runat="server" Text="Tablets &amp; E-Readers" OnClick="btnTablets_Click" Width="153px" />
<asp:Button ID="btnBeeld" runat="server" Text="Beeld &amp; Geluid" OnClick="btnBeeld_Click" Width="123px" />
<asp:Button ID="btnNetwerk" runat="server" Text="Netwerk &amp; Telefonie" OnClick="btnNetwerk_Click" Width="138px" />
<asp:Button ID="Gaming" runat="server" Text="Gaming &amp; Software" OnClick="Gaming_Click" style="margin-bottom: 0px" Width="142px" />
<asp:Button ID="btnMerken" runat="server" Text="Merken" Width="70px" />
<asp:Button ID="btnVeiling" runat="server" Text="Veiling" Width="60px" />
</asp:Panel>

