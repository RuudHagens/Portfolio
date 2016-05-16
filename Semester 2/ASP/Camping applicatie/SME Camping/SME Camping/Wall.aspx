<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wall.aspx.cs" Inherits="SME_Camping.WebForm2" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigationHeader.ascx" %>
<%@ Register TagPrefix="ucPost" TagName="Postbox" src="PostScreen.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ucNav:Nav runat="server"/>

        <asp:Button ID="BtnFile" runat="server" OnClick="BtnFile_Click" Text="Naar File Sharing" />

        <asp:Panel ID="Panel2" runat="server" GroupingText="Nieuwe Post">
            <asp:Label ID="LblTitle" runat="server" Text="Titel:"></asp:Label>
            <asp:TextBox ID="TbTitle" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="TbPost" runat="server" Height="89px" Width="348px" TextMode="MultiLine"></asp:TextBox><br/>
            <asp:Button ID="btnPost" runat="server" OnClick="Button1_Click" Text="Plaats Post" />
        </asp:Panel>
            <asp:Panel ID="PnPost" runat="server" GroupingText="Posts" ScrollBars="Vertical">
            <ucPost:Postbox runat="server"/>
            </asp:Panel>
        

    </form>
</body>
</html>
