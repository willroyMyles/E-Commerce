<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="KK.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <% var orderList = List; if (orderList == null) return; int j = 1, k =1; %>

            <% for (int i = 0; i < orderList.Count; i++)
            {%>

                <% if( orderList[i]["orderNumber"] == j) {
                        k++;%>

                    <br /> <br /><br />
    <p class="my-n2 text-muted">this order was purchased on <%= orderList[i]["purchased"] %> with a total of <%= GetTotalById(orderList[i]["id"]) %></p>
                        <hr />
                    
                <%} j = orderList[i]["orderNumber"]+1;%>

            <div class="row bg-dark p-3 text-light rounded shadow my-n2">
                <div class="col-md-2">
                    <small class="text-muted">Name</small><br />
                    <%= orderList[i]["productName"] %>
                </div>
                <div class="col-md-4">
                    <small class="text-muted">Description</small><br />
                    <%= orderList[i]["description"] %>
                </div>
                <div class="col-md-2">
                    <small class="text-muted small">Price</small><br />
                    $<%= orderList[i]["price"] %>
                </div>
                <div class="col-md-2">
                    <small class="text-muted">Quantity</small><br />
                    <p class=""><%= orderList[i]["quantity"] %></p>
                </div>
                <div class="col-md-2">
                    <small class="text-muted">Subtotal</small><br />
                    $<%= orderList[i]["subtotal"] %>
                </div>
            </div>

         
                
            
           
        <%} %>
</asp:Content>

