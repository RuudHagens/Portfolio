<%@ Page Title="" Language="C#" MasterPageFile="~/MycraftMaster.Master" AutoEventWireup="true" CodeBehind="ZoekPagina.aspx.cs" Inherits="Mycraft.ZoekPagina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <table style="width: 100%">
            <tr>
                <td style="float:left; width: 50%">            
                    <asp:GridView CssClass="table table-hover" ID="gvProfielen" runat="server" AutoGenerateColumns="False" OnRowCommand="gvProfielen_RowCommand">
                        <Columns>
                            <asp:ButtonField DataTextField="Profiel" HeaderText="Gevonden Profielen" CommandName="GaNaarGevondenProfiel" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="float:right; width: 50%">
                    <asp:GridView CssClass="table table-hover" ID="gvTopics" runat="server" AutoGenerateColumns="False" OnRowCommand="gvTopics_RowCommand">
                        <Columns>
                            <asp:ButtonField DataTextField="Topic" HeaderText="Gevonden Topics" CommandName="GaNaarGevondenTopic" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
