<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="Mycraft.Loginpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h2 id="LoginTitle" class="form-signin-heading" runat="server">Voer je login gegevens in!</h2>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email"></asp:TextBox>
        </div>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbWachtwoord" runat="server" TextMode="Password" CssClass="form-control" placeholder="Wachtwoord"></asp:TextBox>
        </div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-lg btn-primary btn-block" OnClick="btnLogin_Click"/>
        <h4 id="TekstOf" runat="server" style="text-align:center; font-style:italic">Of</h4>
        <asp:Button ID="btnRegistreer" runat="server" Text="Registreer" class="btn btn-lg btn-primary btn-block" OnClick="btnRegistreer_Click"/>
        <h4 id="TekstOf2" runat="server" style="text-align:center; font-style:italic">Of</h4>
        <asp:Button ID="btnWachtwoordVeranderen" runat="server" Text="Wachtwoord Veranderen" class="btn btn-lg btn-primary btn-block" OnClick="btnWachtwoordVeranderen_Click"/>
    </div>
</asp:Content>
