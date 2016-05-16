<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="Topicpage.aspx.cs" Inherits="Mycraft.Topicpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron" id="topicAanmaak" runat="server">
        <h2 id="PlaatsTopicTitle" class="form-signin-heading" runat="server">Maak hier je nieuwe topic aan</h2>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbNieuwTopic" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Typ hier je je topic"></asp:TextBox>
        </div>
        <asp:Button ID="btnMaakTopicAan" runat="server" Text="Maak nieuw topic aan" class="btn btn-lg btn-primary btn-block" OnClick="btnMaakTopicAan_Click"/>
    </div>
    <div class="jumbotron">
        <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
                <asp:BoundField DataField="Maker" HeaderText="Maker" SortExpression="Maker" />
                <asp:BoundField DataField="AanmaakDatum" HeaderText="Aanmaak datum" SortExpression="Aanmaak datum" />
                <asp:BoundField DataField="AantalKeer" HeaderText="Aantal keer bekeken" SortExpression="Aantal keer bekeken" />
                <asp:BoundField DataField="AantalPosts" HeaderText="Aantal Posts" />
                <asp:ButtonField ControlStyle-CssClass="btn btn-link btn-sm" CommandName="GaNaarTopic" Text="Ga naar topic" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
