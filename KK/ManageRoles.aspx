﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="KK.ManageRoles" %>



<asp:Content ContentPlaceHolderID="MainContent" ID="RC" runat="server">

        <b>Create a New Role: </b>
<asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
<br />
<asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" />

    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</asp:Content>
