<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="KK.Manage.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container my-5 p-3">
          <div class="row">
            <div class="col-md-10">
                <h2>Manage Products</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">ID </div>
            <div class="col-md-10">
                <asp:TextBox ID="Id" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Name </div>
            <div class="col-md-10">
                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Price </div>
            <div class="col-md-10">
                <asp:TextBox ID="Price" runat="server" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Quantity </div>
            <div class="col-md-10">
                <asp:TextBox ID="Quantity" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
        <div class="col-md-2">Purchased </div>
            <div class="col-md-10">
                <asp:TextBox ID="Purchased" runat="server" TextMode="DateTime"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Category </div>
            <div class="col-md-10">
                <asp:TextBox ID="Category" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Img </div>
            <div class="col-md-10">
                <asp:TextBox ID="Img" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Description </div>
            <div class="col-md-10">
                <asp:TextBox ID="Description" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Qwner Id </div>
            <div class="col-md-10">
                <asp:TextBox ID="Owner" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">Owner Name </div>
            <div class="col-md-10">
                <asp:TextBox ID="QwnerName" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>



    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Purchased" HeaderText="Purchased" SortExpression="Purchased" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Img" HeaderText="Img" SortExpression="Img" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
</asp:Content>
