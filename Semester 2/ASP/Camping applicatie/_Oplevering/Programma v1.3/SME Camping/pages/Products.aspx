<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SME_Camping.pages.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Panel ID="PnAvailable" runat="server" GroupingText="Beschikbare producten">
            <asp:ListBox ID="LbAvailable" runat="server" Height="233px" Width="252px"></asp:ListBox>
            <br />
            <asp:Button ID="BtnHireProduct" runat="server" Text="Huur Geselecteerd Product" />
        </asp:Panel>
        <asp:Panel ID="PnScannedUser" runat="server" GroupingText="Gescande gebruiker">
            <asp:ListBox ID="LbScannedGuest" runat="server" Height="175px" Width="251px"></asp:ListBox>
        </asp:Panel>
        <asp:Panel ID="PnGuestsProducts" runat="server" GroupingText="Producten Van Gebruiker">
            <asp:ListBox ID="LbGuestsProducts" runat="server" Height="165px" Width="246px"></asp:ListBox>
            <br />
            <asp:Button ID="BtnHandIn" runat="server" Text="Lever geselcteerd product in" />
        </asp:Panel>
</asp:Content>
