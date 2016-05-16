<%@ Page Title="" Language="C#" MasterPageFile="~/SMECamping.Master" AutoEventWireup="true" CodeBehind="FileSharing.aspx.cs" Inherits="SME_Camping.pages.FileSharing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:Panel ID="Panel1" runat="server">
            <asp:Button ID="BtnWall" runat="server" Text="Naar Wall" OnClick="BtnWall_Click" />
            <asp:TextBox ID="TbZoekOpNaam" runat="server"></asp:TextBox>
            <asp:Button ID="BtnZoekOpNaam" runat="server" Text="Zoek op naam" />
            <asp:Panel ID="PnCat" runat="server" ScrollBars="Vertical">
                <asp:TreeView ID="TrvwCat" runat="server" ImageSet="Arrows">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <Nodes>
                        <asp:TreeNode Text="New Node" Value="New Node">
                            <asp:TreeNode Text="New Node" Value="New Node">
                                <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="New Node" Value="New Node">
                                <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                                <asp:TreeNode Text="New Node" Value="New Node"></asp:TreeNode>
                            </asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                </asp:TreeView>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="PnUploaden" runat="server" GroupingText="Bestand Uploaden">
            <asp:Button ID="BtnBrowe" runat="server" Text="Browse..." /><br />
            <asp:Label ID="lblPath" runat="server" Text="pad:"></asp:Label>
            
            <asp:TextBox ID="TbPath" runat="server" Enabled="False"></asp:TextBox>
            <br />
            <asp:Label ID="LblCategorie" runat="server" Text="Categorie:"></asp:Label>
            <asp:TextBox ID="TbCategorie" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="BtnUpload" runat="server" Text="Upload" />
            
        </asp:Panel>
        <asp:Panel ID="PnFiles" runat="server" GroupingText="Files van geslecteerde categorie">
            <asp:ListBox ID="LbFiles" runat="server" Height="134px" Width="274px"></asp:ListBox>
            <br />
            <asp:Button ID="BtnDownload" runat="server" Text="Download geselecteerde file" />
        </asp:Panel>
</asp:Content>
