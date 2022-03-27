

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="EasyNetProject.Account.Department" %>

<%@ Register Src="~/EasyNetUserControl1.ascx" TagPrefix="uc1" TagName="EasyNetUserControl1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    


    <table>
        <tr>
            <td style="background-color:yellow; margin-left:50px">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            D_Name:
            <asp:Label ID="D_NameLabel" runat="server" Text='<%# Eval("D_Name") %>' />
            <br />
            M_DepartmentId:
            <asp:Label ID="M_DepartmentIdLabel" runat="server" Text='<%# Eval("M_DepartmentId") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [D_Name], [M_DepartmentId] FROM [Department]" DeleteCommand="DELETE FROM [Department] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Department] ([D_Name], [M_DepartmentId]) VALUES (@D_Name, @M_DepartmentId)" UpdateCommand="UPDATE [Department] SET [D_Name] = @D_Name, [M_DepartmentId] = @M_DepartmentId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="D_Name" Type="String" />
            <asp:Parameter Name="M_DepartmentId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="D_Name" Type="String" />
            <asp:Parameter Name="M_DepartmentId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <uc1:EasyNetUserControl1 runat="server" ID="EasyNetUserControl1" />
            </td>

            <td style="background-color:greenyellow; margin-left:500px">

                <asp:DetailsView ID="DetailsView1" runat="server"  AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" Width="125px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="D_Name" HeaderText="D_Name" SortExpression="D_Name" />
            <asp:TemplateField HeaderText="M_DepartmentId" SortExpression="M_DepartmentId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("M_DepartmentId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>

                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("M_DepartmentId") %>' DataSourceID="SqlDataSource3" DataTextField="M_Name" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [M_Name] FROM [Management]"></asp:SqlDataSource>

                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("M_DepartmentId") %>' DataSourceID="SqlDataSource4" DataTextField="M_Name" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [M_Name] FROM [Management]"></asp:SqlDataSource>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Department] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Department] ([D_Name], [M_DepartmentId]) VALUES (@D_Name, @M_DepartmentId)" SelectCommand="SELECT [Id], [D_Name], [M_DepartmentId] FROM [Department]" UpdateCommand="UPDATE [Department] SET [D_Name] = @D_Name, [M_DepartmentId] = @M_DepartmentId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="D_Name" Type="String" />
            <asp:Parameter Name="M_DepartmentId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="D_Name" Type="String" />
            <asp:Parameter Name="M_DepartmentId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    

            </td>

        </tr>
    </table>
   
    



</asp:Content>
