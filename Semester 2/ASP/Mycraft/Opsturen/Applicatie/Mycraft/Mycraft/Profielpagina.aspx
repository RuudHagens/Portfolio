<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="Profielpagina.aspx.cs" Inherits="Mycraft.Profielpagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
    <div class="panel panel-default" padding: 10px; margin: 10px">
    <div id="Tabs" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#profielinfo" aria-controls="informatie" role="tab" data-toggle="tab">Profiel informatie</a></li>
            <li><a href="#profielposts" aria-controls="posts" role="tab" data-toggle="tab">Geplaatste posts</a></li>
            <li><a href="#profieltopics" aria-controls="topics" role="tab" data-toggle="tab">Gemaakte topics</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content" style="padding-top: 20px">
            <div role="tabpanel" class="tab-pane active" id="profielinfo">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/CreeperFace.png" Height="100" Width="100" style="padding-left: 10px"/>
                <h4 style="padding-left: 10px">Gebruikernaam</h4>
                <div style="padding-left: 10px; padding-bottom: 5px">
                    <asp:TextBox ID="tbNaam" runat="server" Enabled="False" CssClass="form-control" Width="50%"></asp:TextBox>
                </div>
                <h4 style="padding-left: 10px">Emailadres</h4>
                <div style="padding-left: 10px; padding-bottom: 5px">
                    <asp:TextBox ID="tbEmail" runat="server" Enabled="False" CssClass="form-control" Width="50%"></asp:TextBox>
                </div>
                <h4 style="padding-left: 10px">Soort gebruiker</h4>
                <div style="padding-left: 10px; padding-bottom: 5px">
                    <asp:TextBox ID="tbSoortGebruiker" runat="server" Enabled="False" CssClass="form-control" Width="50%"></asp:TextBox>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profielposts">
                <asp:Table ID="tabProfielPosts" runat="server"></asp:Table>
            </div>
            <div role="tabpanel" class="tab-pane" id="profieltopics">
                <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
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
        </div>
    </div>
</div>
</div>
</asp:Content>
