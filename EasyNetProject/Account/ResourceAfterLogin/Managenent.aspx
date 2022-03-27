<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Managenent.aspx.cs" Inherits="EasyNetProject.Account.Managenent" %>

<%@ Register Src="~/EasyNetUserControl1.ascx" TagPrefix="uc1" TagName="EasyNetUserControl1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    

    <div class="container" style="background-color:antiquewhite;width:300px; margin-top:50px">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" Width="300px" AllowPaging="true">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="M_Name" HeaderText="M_Name" SortExpression="M_Name" />
        </Columns>
    </asp:GridView>
        <uc1:EasyNetUserControl1 runat="server" id="EasyNetUserControl1" />
    </div>

    

    



    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
          EnablePaging="true" ConflictDetection="CompareAllValues" 
        DeleteMethod="Delete" InsertMethod="Insert" StartRowIndexParameterName="StartRowIndex" MaximumRowsParameterName="MaxRowNum" OldValuesParameterFormatString="original_{0}"
        SelectMethod="select" SelectCountMethod="GetTotalRecord"
        TypeName="EasyNetProject.App_Code.ManagementObjectDataSource" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="M_Name" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_M_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="M_Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="StartRowIndex" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="MaxRowNum" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="M_Name" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_M_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <div class="container" style="background-color:cornsilk; width:300px; margin-top:50px"">
        
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" DataSourceID="ObjectDataSource2" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated">
        <Fields>
            <asp:TemplateField HeaderText="Id" SortExpression="Id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="TextBox3" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="M_Name" HeaderText="M_Name" SortExpression="M_Name" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    </div>






    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="select" TypeName="EasyNetProject.App_Code.ManagementObjectDataSource" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="M_Name" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_M_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="M_Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" DefaultValue="0" Name="StartRowIndex" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="MaxRowNum" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="M_Name" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
            <asp:Parameter Name="Original_M_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>





</asp:Content>
