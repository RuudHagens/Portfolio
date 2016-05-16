<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="SME_Camping.LogInPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblUserName" runat="server" Text="Gebruikers naam:"></asp:Label>
    <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LblPassword" runat="server" Text="Wachtwoord:"></asp:Label>
    <asp:TextBox ID="TbPassword" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LblNewPassword" runat="server" Text="Nieuw Wachtwoord:" Visible="False"></asp:Label>
    <asp:TextBox ID="TbNewPassword" runat="server" Visible="False"></asp:TextBox>
    <br />
    <asp:Label ID="LblRepeatPassword" runat="server" Text="Herhaal wachtwoord" Visible="False"></asp:Label>
    <asp:TextBox ID="TbRepeatPassword" runat="server" Visible="False"></asp:TextBox>
    <br />
    <asp:CheckBox ID="CbChangePassword" runat="server" OnCheckedChanged="CbChangePassword_CheckedChanged" Text="Verander Wachtwoord" />
    <br />
    <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
    <br />
    <asp:Label ID="lblLoginFail" runat="server" Text="ERROR: Login failed." Visible="False"></asp:Label>
</asp:Content>
