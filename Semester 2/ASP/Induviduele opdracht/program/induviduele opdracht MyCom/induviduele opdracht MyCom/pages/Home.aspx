<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="induviduele_opdracht_MyCom.pages.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Lijst die de hoofdcategoriën ophaalt--%>
    <asp:ListBox ID="LbHoofdCategegorie" runat="server" DataSourceID="HoofdCategorieData" DataTextField="CAT_NAAM" DataValueField="CAT_NAAM" Width="30%" Height="200px" OnSelectedIndexChanged="LbHoofdCategegorie_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
<asp:SqlDataSource ID="HoofdCategorieData" runat="server" ConnectionString="<%$ ConnectionStrings:oracleVPNdatabase %>" ProviderName="<%$ ConnectionStrings:oracleVPNdatabase.ProviderName %>" SelectCommand="SELECT ca.cat_naam
FROM categorie ca
WHERE ca.parent_cat_id is null"></asp:SqlDataSource>

    <%--lijst die de subcategoriën ophaalt van de hoofdcategorie--%>
<asp:ListBox ID="LbSubcategorie" runat="server" Width="30%" DataSourceID="SubCategorieData" DataTextField="CAT_NAAM" DataValueField="CAT_NAAM" Height="200px" AutoPostBack="True" OnSelectedIndexChanged="LbSubcategorie_SelectedIndexChanged"></asp:ListBox>
<asp:SqlDataSource ID="SubCategorieData" runat="server" ConnectionString="<%$ ConnectionStrings:oracleVPNdatabase %>" ProviderName="<%$ ConnectionStrings:oracleVPNdatabase.ProviderName %>" SelectCommand="SELECT cat_naam
FROM categorie
WHERE parent_cat_id IS NOT NULL"></asp:SqlDataSource>

    <%--lijst die alle producten ophaalt van de subcategorie--%>
<asp:ListBox ID="LbSubArtikel" runat="server" Width="30%" Height="200px" AutoPostBack="True" DataSourceID="ProductFromCat" DataTextField="NAAM" DataValueField="NAAM" OnSelectedIndexChanged="LbSubArtikel_SelectedIndexChanged"></asp:ListBox>
<asp:SqlDataSource ID="ProductFromCat" runat="server" ConnectionString="<%$ ConnectionStrings:oracleVPNdatabase %>" ProviderName="<%$ ConnectionStrings:oracleVPNdatabase.ProviderName %>" SelectCommand="SELECT naam
FROM artikel"></asp:SqlDataSource>
</asp:Content>
