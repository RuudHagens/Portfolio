<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="Wall.aspx.cs" Inherits="SME_Camping.pages.Wall" %>
<%@ Register TagPrefix="ucPost" TagName="Postbox" src="~/PostScreen.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Button ID="BtnFileSharing" runat="server" Text="Naar File Sharing" OnClick="BtnFileSharing_Click" />
    </div>
    <asp:Panel ID="Panel2" runat="server" GroupingText="Nieuwe Post" HorizontalAlign="Left" Width="75%">
        <asp:Label ID="LblTitle" runat="server" Text="Titel:"></asp:Label>
        <asp:TextBox ID="TbTitle" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="TbPost" runat="server" Height="89px" Width="348px" TextMode="MultiLine"></asp:TextBox><br/>
        <asp:Button ID="btnPost" runat="server" Text="Plaats Post" />
        
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Width="75%">
        <ucPost:Postbox runat="server"/>

    </asp:Panel>
    
</asp:Content>
