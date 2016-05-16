<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categorieën.aspx.cs" Inherits="induviduele_opdracht_MyCom.Categorieën" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigatieBalk.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ucNav:Nav runat="server"/>

        <asp:Panel ID="Panel1" runat="server">
            <asp:Panel ID="pnCategorie" runat="server" Width="245px">
                <asp:ListBox ID="lbCategorie" runat="server" Height="450px" Width="245px"></asp:ListBox>
            </asp:Panel>
            <asp:Panel ID="pnSubCatImg" runat="server" Width="735px">
                <asp:GridView ID="gvSubCat" runat="server" AutoGenerateColumns="False" Height="145px" Width="735px">
                    <Columns>
                        <asp:ImageField>
                        </asp:ImageField>
                        <asp:ImageField>
                        </asp:ImageField>
                        <asp:ImageField>
                        </asp:ImageField>
                    </Columns>
                </asp:GridView>
                </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
