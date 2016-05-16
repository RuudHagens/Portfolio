<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registratie.aspx.cs" Inherits="induviduele_opdracht_MyCom.pages.Registratie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
<br />
<asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblNaam" runat="server" Text="Naam:"></asp:Label>
    <br />
    <asp:TextBox ID="TbNaam" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblWachtwoord" runat="server" Text="Wachtwoord:"></asp:Label>
<br />
<asp:TextBox ID="tbWachtwoord" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblTelnr" runat="server" Text="Telefoon:"></asp:Label>
<br />
<asp:TextBox ID="tbTelefoon" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblGebDatum" runat="server" Text="Geboortedatum:"></asp:Label>
<br />
<asp:TextBox ID="TbGeboorteDatum" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblAdres" runat="server" Text="Adres:"></asp:Label>
<br />
<asp:TextBox ID="TbAdres" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblLand" runat="server" Text="Land:"></asp:Label>
<br />
<asp:TextBox ID="tbLand" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblSocailAccount" runat="server" Text="Social Media:"></asp:Label>
<br />
<asp:TextBox ID="TbSocial" runat="server"></asp:TextBox>
<br />
<asp:RadioButton ID="rbtnParticulier" runat="server" Text="particulier" AutoPostBack="True" Checked="True" OnCheckedChanged="rbtnParticulier_CheckedChanged" />
<asp:RadioButton ID="rbtnZakelijk" runat="server" Text="zakelijk" AutoPostBack="True" OnCheckedChanged="rbtnZakelijk_CheckedChanged" />
<br />
<asp:Label ID="lblNickname" runat="server" Text="Nickname:"></asp:Label>
<br />
<asp:TextBox ID="tbNickname" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblBedrijfsnaam" runat="server" Text="Bedrijfsnaam:"></asp:Label>
<br />
<asp:TextBox ID="tbBedrijfsnaam" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblOndernemingsnummer" runat="server" Text="Ondernemingsnummer:"></asp:Label>
<br />
<asp:TextBox ID="TbOndernemingsnummer" runat="server"></asp:TextBox>
<br />
<asp:Label ID="lblBtwnr" runat="server" Text="Btwnr:"></asp:Label>
<br />
<asp:TextBox ID="TbBtwnr" runat="server"></asp:TextBox>
<br />
<asp:Button ID="btnRegistreer" runat="server" OnClick="btnRegistreer_Click" Text="Registreer" />
    <br />
    <asp:Label ID="lblError" runat="server" Text="Vul alle gegevens in" Visible="False"></asp:Label>
</asp:Content>
