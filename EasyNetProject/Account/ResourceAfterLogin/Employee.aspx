<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EasyNetProject.Account.Employee" %>

<%@ Register Src="~/EasyNetUserControl1.ascx" TagPrefix="uc1" TagName="EasyNetUserControl1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    

    <div class="container" style="background-color:cadetblue;width:500px">

        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="Id" DataSourceID="SqlDataSource1" width="500px">
        <EditItemTemplate>
            Id:
            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            E_Name:
            <asp:TextBox ID="E_NameTextBox" runat="server" Text='<%# Bind("E_Name") %>' />
            <br />
            Post:
            <asp:TextBox ID="PostTextBox" runat="server" Text='<%# Bind("Post") %>' />
            <br />
            JoiningDate:
            <asp:TextBox ID="JoiningDateTextBox" runat="server" Text='<%# Bind("JoiningDate") %>' />
            <br />
            D_EmployeeId:
            <asp:TextBox ID="D_EmployeeIdTextBox" runat="server" Text='<%# Bind("D_EmployeeId") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            E_Name:
            <asp:TextBox ID="E_NameTextBox" runat="server" Text='<%# Bind("E_Name") %>' />
            <br />
            Post:
            <asp:TextBox ID="PostTextBox" runat="server" Text='<%# Bind("Post") %>' />
            <br />
            JoiningDate:
            <asp:TextBox ID="JoiningDateTextBox" runat="server" Text='<%# Bind("JoiningDate") %>' />
            <br />
            D_EmployeeId:
            <asp:TextBox ID="D_EmployeeIdTextBox" runat="server" Text='<%# Bind("D_EmployeeId") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            E_Name:
            <asp:Label ID="E_NameLabel" runat="server" Text='<%# Bind("E_Name") %>' />
            <br />
            Post:
            <asp:Label ID="PostLabel" runat="server" Text='<%# Bind("Post") %>' />
            <br />
            JoiningDate:
            <asp:Label ID="JoiningDateLabel" runat="server" Text='<%# Bind("JoiningDate") %>' />
            <br />
            D_EmployeeId:
            <asp:Label ID="D_EmployeeIdLabel" runat="server" Text='<%# Bind("D_EmployeeId") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
        <uc1:EasyNetUserControl1 runat="server" ID="EasyNetUserControl1" />
    </div>
    




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>


    <div class="container" style="background-color:darkgray;width:500px">

        

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Id" 
        DataSourceID="SqlDataSource3" OnItemDeleted="DetailsView1_ItemDeleted"
        OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="E_Name" HeaderText="E_Name" SortExpression="E_Name" />
            <asp:BoundField DataField="Post" HeaderText="Post" SortExpression="Post" />
            <asp:TemplateField HeaderText="JoiningDate" SortExpression="JoiningDate">
                <EditItemTemplate> 
                    <asp:Calendar ID="cld" runat="server" SelectedDate='<%# Bind("JoiningDate") %>' ></asp:Calendar>
             
                </EditItemTemplate>
                <InsertItemTemplate>

                    <asp:Calendar ID="cld" runat="server" SelectedDate='<%# Bind("JoiningDate") %>' ></asp:Calendar>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Calender" runat="server" Text='<%# Bind("JoiningDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="D_EmployeeId" SortExpression="D_EmployeeId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("D_EmployeeId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    

                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("D_EmployeeId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("D_EmployeeId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>

    </div>



    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Employee] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Employee] ([E_Name], [Post], [JoiningDate], [D_EmployeeId]) VALUES (@E_Name, @Post, @JoiningDate, @D_EmployeeId)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [E_Name] = @E_Name, [Post] = @Post, [JoiningDate] = @JoiningDate, [D_EmployeeId] = @D_EmployeeId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="E_Name" Type="String" />
            <asp:Parameter Name="Post" Type="String" />
            <asp:Parameter DbType="Date" Name="JoiningDate" />
            <asp:Parameter Name="D_EmployeeId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="E_Name" Type="String" />
            <asp:Parameter Name="Post" Type="String" />
            <asp:Parameter DbType="Date" Name="JoiningDate" />
            <asp:Parameter Name="D_EmployeeId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
