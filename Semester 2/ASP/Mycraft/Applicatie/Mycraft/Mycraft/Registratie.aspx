<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="Registratie.aspx.cs" Inherits="Mycraft.Registratie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="jumbotron">
        <h2 id="RegistratieTitle" class="form-signin-heading" runat="server">Registreer hier uw account!</h2>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbNaam" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Gebruikers Naam"></asp:TextBox>
        </div>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email"></asp:TextBox>
        </div>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbWachtwoord" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Wachtwoord"></asp:TextBox>
        </div>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbHerhaalWachtwoord" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Herhaal Wachtwoord"></asp:TextBox>
        </div>
        <asp:Button ID="btnRegistreer" runat="server" Text="Registreer" class="btn btn-lg btn-primary btn-block" OnClick="btnRegistreer_Click"/>
    </div>
</asp:Content>
