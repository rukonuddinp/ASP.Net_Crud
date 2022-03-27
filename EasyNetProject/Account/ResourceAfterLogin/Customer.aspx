

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="EasyNetProject.Account.Customer" %>

<%@ Register Src="~/EasyNetUserControl1.ascx" TagPrefix="uc1" TagName="EasyNetUserControl1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    

    <div class="container" style="background-color:fuchsia; width:500px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="C_Name" HeaderText="C_Name" SortExpression="C_Name" />
            <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Picture") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                <asp:Image ID="img_Show_Dv" runat="server" ImageUrl='<%# Bind ("Picture") %>' Height="50" Width="50" />

                    <asp:Label ID="Label1" runat="server" Text= '<%# Bind("Picture") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="E_CustomerId" HeaderText="E_CustomerId" SortExpression="E_CustomerId" />
        </Columns>
    </asp:GridView>
    </div>

    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>


     <div class="container" style="background-color:greenyellow; width:500px">

         <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnDataBound="DetailsView1_DataBound" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="C_Name" HeaderText="C_Name" SortExpression="C_Name" />
            <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                <EditItemTemplate>

                    <asp:FileUpload ID="FileUpload1" runat="server"  />

                </EditItemTemplate>
                <InsertItemTemplate>

                     <asp:FileUpload ID="FileUpload1" runat="server"  />

                </InsertItemTemplate>
                <ItemTemplate>

                  <asp:Image ID="img_Show_Dv" runat="server" ImageUrl='<%# Bind ("Picture") %>' Height="50" Width="50" />


                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="E_CustomerId" SortExpression="E_CustomerId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("E_CustomerId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("E_CustomerId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("E_CustomerId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
         <uc1:EasyNetUserControl1 runat="server" ID="EasyNetUserControl1" />
     </div>

    




    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Customer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Customer] ([C_Name], [Picture], [E_CustomerId]) VALUES (@C_Name, @Picture, @E_CustomerId)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [C_Name] = @C_Name, [Picture] = @Picture, [E_CustomerId] = @E_CustomerId WHERE [Id] = @Id" OnInserting="SqlDataSource2_Inserting">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="C_Name" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="E_CustomerId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="C_Name" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="E_CustomerId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>




</asp:Content>
