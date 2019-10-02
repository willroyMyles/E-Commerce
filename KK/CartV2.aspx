<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartV2.aspx.cs" Inherits="KK.CartV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>View items in cart</h3>
                <hr>
            </div>
        </div>

        <div class="row">
            <div class="col-md-1">
                <strong><h5>...</h5></strong>
            </div>
            <div class="col-md-2">
                <strong><h5>name</h5></strong>
            </div>
            <div class="col-md-3">
                <strong><h5>Description</h5></strong>
            </div>
            <div class="col-md-1 text-center">
                <strong><h5>Price</h5></strong>
            </div>
            <div class="col-md-2 text-center">
                <strong><h5>Quantity</h5></strong>
            </div>
            <div class="col-md-2 text-center">
                <strong><h5>Total</h5></strong>
            </div>
        </div>

        <% foreach (var prod in KK.CartV2.GetProducts())
            { %>

                <div class="row">
                    <div class="col-md-1">
                        <Button id="<%= GetDeleteButtonid() %>" value ="<%= GetCounter() %>" >X</Button>
                    </div>
                    <div class="col-md-2">
                        <%=prod.Name %>
                    </div>
    
                    <div class="col-md-3">
                        <%=prod.Description %>
                    </div>
                    
                    <div class="col-md-1">
                        <%=prod.Price %>
                    </div>
    
                    <div class="col-md-2 ">
                        $<%=prod.Quantity %>
                    </div>
                </div>


        <%} %>

        


    </div>

    <script>
        $(document).ready((e) => {

            var count = PageMethods.GetProducts.length
            console.log(count);
        });
    </script>
</asp:Content>
