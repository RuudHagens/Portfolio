<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="AccessControl.aspx.cs" Inherits="SME_Camping.pages.AccessControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Button ID="BtnAllGuests" runat="server" OnClick="BtnAllGuests_Click" Text="Ga naar lijst met alle bezoekers" />
        <asp:Panel ID="PnScanned" runat="server" GroupingText="Gescande bezoeker">
            <asp:ListBox ID="LbScannedUser" runat="server" Height="256px" Width="240px"></asp:ListBox>
            <br />
            <asp:Image ID="ImgProfilePic" runat="server" Height="100px" Width="100px" />
        </asp:Panel>
        <asp:Panel ID="PnGuestAtReservation" runat="server" GroupingText="Bezoekers Bij Reservering">
            <asp:ListBox ID="LbGuestAtReservation" runat="server" Height="165px" Width="267px"></asp:ListBox>
        </asp:Panel>
</asp:Content>
