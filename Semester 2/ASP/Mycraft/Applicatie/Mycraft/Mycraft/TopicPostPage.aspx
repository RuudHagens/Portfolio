<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="TopicPostPage.aspx.cs" Inherits="Mycraft.TopicPostPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h2 id="PlaatsPostTitle" class="form-signin-heading" runat="server">Maak hier je nieuwe post aan</h2>
        <div style="padding-bottom: 10px">
            <asp:TextBox ID="tbPlaatsPost" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Typ hier je post" style="resize:none"></asp:TextBox>
        </div>
        <asp:Button ID="btnPlaatsPost" runat="server" Text="Plaats Post" class="btn btn-lg btn-primary btn-block" OnClick="btnPlaatsPost_Click"/>
    </div>
    <div class="jumbotron">
        <asp:Table ID="tabTopicPosts" runat="server" Width="100%" CssClass="table"></asp:Table>
    </div>
</asp:Content>
