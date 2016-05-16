<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="induviduele_opdracht_MyCom.pages.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="tbZoek" runat="server"></asp:TextBox>
<asp:Button ID="btnZoek" runat="server" OnClick="btnZoek_Click" Text="Zoek" />
<br />
<asp:DropDownList ID="DdlMerk" runat="server" AutoPostBack="True" DataSourceID="MerkNamen" DataTextField="MERK" DataValueField="MERK" OnSelectedIndexChanged="DdlMerk_SelectedIndexChanged"></asp:DropDownList>
    <asp:SqlDataSource ID="MerkNamen" runat="server" ConnectionString="<%$ ConnectionStrings:oracleVPNdatabase %>" ProviderName="<%$ ConnectionStrings:oracleVPNdatabase.ProviderName %>" SelectCommand="SELECT Merk
FROM artikel"></asp:SqlDataSource>
    <asp:GridView ID="GvProducten" runat="server" AutoGenerateColumns="False" DataSourceID="product" style ="text-align: center" HorizontalAlign="Right" OnSorting="GvProducten_Sorting" AllowSorting="True" OnRowCommand="GvProducten_RowCommand">
        <Columns>
            <asp:ImageField DataImageUrlField="AFBEELDING_URL">
                <ControlStyle Height="75px" Width="75px" />
                <ItemStyle Height="25px" Width="25px" />
            </asp:ImageField>
            <asp:BoundField DataField="ARTIKELNR" HeaderText="ARTIKELNR" />
            <asp:BoundField DataField="NAAM" HeaderText="NAAM" SortExpression="NAAM" />
            <asp:BoundField DataField="PRIJS" HeaderText="PRIJS" SortExpression="PRIJS">
            <ItemStyle Height="75px" Width="75px" />
            </asp:BoundField>
            <asp:BoundField DataField="BESCHRIJVING" HeaderText="BESCHRIJVING" />
            <asp:BoundField DataField="MERK" HeaderText="MERK" SortExpression="MERK" />
            <asp:ButtonField ButtonType="Button" Text="Kopen" CommandName="AddToCart" />
        </Columns>
    </asp:GridView>
    <br />

    <asp:SqlDataSource ID="product" runat="server" ConnectionString="<%$ ConnectionStrings:oracleVPNdatabase %>" ProviderName="<%$ ConnectionStrings:oracleVPNdatabase.ProviderName %>" SelectCommand="SELECT af.afbeelding_url, ar.artikelnr, ar.naam, ar.prijs, ar.beschrijving, ar.merk
    FROM artikel ar, afbeelding af
    WHERE ar.artikelnr = af.artikelnr"></asp:SqlDataSource>    
    <asp:DropDownList ID="ddlShoppingCart" runat="server">
    </asp:DropDownList>
</asp:Content>
