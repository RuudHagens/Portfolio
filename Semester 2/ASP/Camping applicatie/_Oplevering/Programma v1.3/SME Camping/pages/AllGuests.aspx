<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="AllGuests.aspx.cs" Inherits="SME_Camping.pages.AllGuests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
