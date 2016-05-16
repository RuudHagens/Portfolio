<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostBox.ascx.cs" Inherits="Mycraft.PostBox" %>
<link href="css/bootstrap.css" rel="stylesheet" />
<div class="container-fluid">
    <asp:Panel ID="pnPosthouder" runat="server" CssClass ="panel panel-default">
        <div class="panel-heading" style="height:40px;">
            <asp:Label ID="lblGebruikernaam" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="lblDatumPost" runat="server" Text="Label" CssClass="pull-right"></asp:Label>
        </div> 
        <div class="panel-body">
            <div class="col-sm-2">
                <asp:Image ID="imgProfielAfbeelding" runat="server" CssClass="img-responsive" ImageUrl="~/images/CreeperFace.png"/>
            </div>
            <div class="col-sm-10">
                <asp:Label ID="lblPostTekst" runat="server" Text="Label"></asp:Label>
            </div>
        </div>   
    </asp:Panel>
</div>
