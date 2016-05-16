<%@ Control Language="C#" ClassName="Navigation" AutoEventWireup="true" CodeBehind="NavigationHeader.ascx.cs" Inherits="SME_Camping.WebUserControl1" %>
<asp:Panel ID="Panel1" runat="server">
    <asp:ImageButton ID="ImgBtnIcon" runat="server" Height="100px" Width="100px" ImageUrl="~/Images/icon.png" OnClick="ImgBtnIcon_Click" />
    <asp:Button ID="BtnHome" runat="server" Text="Home" OnClick="BtnHome_Click" />
    <asp:Button ID="BtnReserve" runat="server" Text="Reserveer" OnClick="BtnReserve_Click" />
    <asp:Button ID="BtnWall" runat="server" Text="Wall" OnClick="BtnWall_Click" />
    <asp:Button ID="BtnProducts" runat="server" Text="Producten" OnClick="BtnProducts_Click" />
    <asp:Button ID="BtnControle" runat="server" OnClick="BtnControle_Click" Text="Toegangs Controle" />
    <asp:Button ID="BtnLogIn" runat="server" Text="Log In" />
</asp:Panel>

