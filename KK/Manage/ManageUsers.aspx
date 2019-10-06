<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="KK.Manage.MangaeUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container my-5">
    <div class="row">
        <div class="col-md-12">
            <h2>Manage Users</h2>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table table-dark" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                            <asp:BoundField DataField="Dob" HeaderText="Dob" SortExpression="Dob" />
                            <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" SortExpression="IsAdmin" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        </Columns>
                </asp:GridView>
        </div>
    </div>
</div>

   
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [Email], [PhoneNumber], [FirstName], [LastName], [Dob], [IsAdmin], [UserName] FROM [AspNetUsers]" DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AspNetUsers] ([Id], [Email], [PhoneNumber], [FirstName], [LastName], [Dob], [IsAdmin], [UserName]) VALUES (@Id, @Email, @PhoneNumber, @FirstName, @LastName, @Dob, @IsAdmin, @UserName)" UpdateCommand="UPDATE [AspNetUsers] SET [Email] = @Email, [PhoneNumber] = @PhoneNumber, [FirstName] = @FirstName, [LastName] = @LastName, [Dob] = @Dob, [IsAdmin] = @IsAdmin, [UserName] = @UserName WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Id" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Dob" Type="DateTime" />
        <asp:Parameter Name="IsAdmin" Type="Boolean" />
        <asp:Parameter Name="UserName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Dob" Type="DateTime" />
        <asp:Parameter Name="IsAdmin" Type="Boolean" />
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="Id" Type="String" />
    </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

