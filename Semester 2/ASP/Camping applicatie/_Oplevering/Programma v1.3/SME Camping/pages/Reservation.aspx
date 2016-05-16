<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="SME_Camping.pages.Reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Styles/Reservation.css" type="text/css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div id="information">

                <div class="left">
                    <asp:Label ID="lblFirstName" runat="server" Text="Voornaam:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbFirstName" runat="server" Width="15%"></asp:TextBox>
                </div>

                <div class="left">
                    <asp:Label ID="LblTussenvoegsel" runat="server" Text="Tussenvoegsel:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbInsertion" runat="server" Width="15%"></asp:TextBox>
                </div> 

                <div class="left">      
                    <asp:Label ID="LblAchternaam" runat="server" Text="Achternaam:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbAchternaam" runat="server" Width="15%"></asp:TextBox> 
                </div>

                <div class="left">          
                    <asp:Label ID="LblWoonplaats" runat="server" Text="Woonplaats:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbWoonplaats" runat="server" Width="15%"></asp:TextBox>
                </div>

                <div class="left">
                    <asp:Label ID="LblStraat" runat="server" Text="Straat:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbStraat" runat="server" Width="15%"></asp:TextBox>
                </div>

                <div class="left">
                    <asp:Label ID="LblHuisnr" runat="server" Text="Huisnummer:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbHuisnummer" runat="server" Width="15%"></asp:TextBox>
                    <asp:Label ID="LbStreetNumberWarning" runat="server" Text="Incorrect huisnummer" Visible="False"></asp:Label>
                </div>

                <div class="left">
                    <asp:Label ID="LblRekeningnr" runat="server" Text="Bankrekeningnr:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbRekeningNr" runat="server" Width="15%"></asp:TextBox>
                </div>

                <div class="left">
                    <asp:Label ID="LblEmail" runat="server" Text="Email:"></asp:Label>
                </div>

                <div class="right">
                    <asp:TextBox ID="TbEmail" runat="server" Width="15%"></asp:TextBox>
                </div>

                <div>
                    <asp:CheckBox ID="CbMainBooker" runat="server" Text="Hoofd Boeker" Checked="True" OnCheckedChanged="CbMainBooker_CheckedChanged" />
                </div>

                <div>
                    <asp:Button ID="BtnAdd" runat="server" Text="Voeg Persoon Toe" OnClick="BtnAdd_Click" />
                </div>

                <div>
                    <asp:Button ID="BtnDelete" runat="server" Text="Verwijder Persoon" OnClick="BtnDelete_Click" Width="162px" />
                </div>

        </div>

        <div id="reservationlist"> 
            <div>
                <asp:ListBox ID="LbReservering" runat="server" Height="129px" Width="220px"></asp:ListBox>
            </div>

            <div>
                <asp:DropDownList ID="DdlPlaatsnr" runat="server"></asp:DropDownList>
            </div>

            <div>
                <asp:Button ID="BtnMap" runat="server" Text="Bekijk Plattegrond" ValidateRequestMode="Enabled" />
            </div>

            <div>
                <asp:Button ID="BtnBevestig" runat="server" Text="Bevestig Reservering" />
            </div>

        </div>
    </asp:Content>
