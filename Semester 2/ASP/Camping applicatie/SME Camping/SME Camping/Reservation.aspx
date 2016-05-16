<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="SME_Camping.Reservering" %>
<%@ Register TagPrefix="ucNav" TagName="Nav" src="NavigationHeader.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <ucNav:Nav runat="server"/>
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="lblVoornaam" runat="server" Text="Voornaam:"></asp:Label>
            <asp:TextBox ID="TbVoornaam" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblTussenvoegsel" runat="server" Text="Tussenvoegsel:"></asp:Label>
            <asp:TextBox ID="Tbtussenvoegsel" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblAchternaam" runat="server" Text="Achternaam:"></asp:Label>
            <asp:TextBox ID="TbAchternaam" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblWoonplaats" runat="server" Text="Woonplaats:"></asp:Label>
            <asp:TextBox ID="TbWoonplaats" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblStraat" runat="server" Text="Straat:"></asp:Label>
            <asp:TextBox ID="TbStraat" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblHuisnr" runat="server" Text="Huisnummer:"></asp:Label>
            <asp:TextBox ID="TbHuisnummer" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblRekeningnr" runat="server" Text="Bankrekeningnr:"></asp:Label>
            <asp:TextBox ID="TbRekeningNr" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="TbEmail" runat="server"></asp:TextBox>
            <br />
            <asp:CheckBox ID="CbMainBooker" runat="server" Text="Hoofd Boeker" />
            <br />
            <asp:Button ID="BtnAdd" runat="server" Text="Voeg Persoon Toe" />
            <br />
            <asp:Button ID="BtnDelete" runat="server" Text="Verwijder Persoon" />
        </asp:Panel><asp:Panel ID="Panel2" runat="server">
            <asp:ListBox ID="LbReservering" runat="server" Height="129px" Width="220px"></asp:ListBox>
            <br />
            <asp:DropDownList ID="DdlPlaatsnr" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ID="BtnMap" runat="server" Text="Bekijk Plattegrond" ValidateRequestMode="Enabled" />
            <br />
            <asp:Button ID="BtnBevestig" runat="server" Text="Bevestig Reservering" />
        </asp:Panel>
        
    </form>
</body>
</html>
