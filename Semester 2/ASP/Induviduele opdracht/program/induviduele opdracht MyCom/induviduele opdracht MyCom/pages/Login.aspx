<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="induviduele_opdracht_MyCom.pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Styles/login.css" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblNaam" runat="server" Text="E-mail:"></asp:Label>
    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LblPassword" runat="server" Text="Wachtwoord:"></asp:Label>
    <asp:TextBox ID="TbPassword" runat="server"></asp:TextBox>
    <br />
<asp:Label ID="lblLoginFailed" runat="server" Text="Inloggen mislukt" Visible="False"></asp:Label>
    <br />
    <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
</asp:Content>
