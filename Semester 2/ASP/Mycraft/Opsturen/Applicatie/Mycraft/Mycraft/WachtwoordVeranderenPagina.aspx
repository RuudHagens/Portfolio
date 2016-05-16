<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="WachtwoordVeranderenPagina.aspx.cs" Inherits="Mycraft.WachtwoordVeranderenPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="jumbotron">
        <h2 id="WachtwoordTitle" class="form-signin-heading" runat="server">Verander Hier uw wachtwoord</h2>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email"></asp:TextBox>
        </div>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbWachtwoord" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Wachtwoord"></asp:TextBox>
        </div>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbHerhaalWachtwoord" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Herhaal Wachtwoord"></asp:TextBox>
        </div>
        <asp:Button ID="btnVerander" runat="server" Text="Verander wachtwoord" class="btn btn-lg btn-primary btn-block" OnClick="btnVerander_Click"/>
    </div>
</asp:Content>
