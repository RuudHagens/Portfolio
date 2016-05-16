<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Mycraft.Home" %>
<%@ Register TagPrefix="ucp" TagName="Post" Src="PostBox.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <h1>Welkom op Mycraft!</h1>
        <p>Hier kan je praten met mensen die net zo'n fanatieke Minecrafters zijn als jij.</p>
        <p>Op deze pagina vindt u de meest recente posts die geplaatst zijn op dit forum.</p>
    </div>
    <div class="jumbotron">
        <asp:Table ID="PostTable" runat="server" Width="100%" CssClass="table"></asp:Table>
    </div>  
</asp:Content>
