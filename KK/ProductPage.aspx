<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="KK.ProductPage" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    hello

    <asp:UpdatePanel ID="panel" runat="server" >
        <ContentTemplate >
            <div class="container">
                <div class="row" ID="Container1" runat="server">

                </div>
            </div>

            <!-- Button trigger modal -->
            <button type="button" runat="server" id="showmodal" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelId">
              Launch
            </button>
            
            <!-- Modal -->
            <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                            <div class="modal-header">
                                    <h5 class="modal-title" id="modalTitle" runat="server">
                                        
                                    </h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <asp:Image ID="ImageModal" runat="server"  CssClass="img-fluid" />
                                <div class="row">
                                    <div class="col-md-3">
                                        <h5 class="text-center" runat="server" id="priceTag">$</h5>
                                    </div>
                                    <div class="col-md-6">
                                        <input id="quant" type="number" min="1" onchange="updatePriceTag()" />
                                    <%--<asp:TextBox ID="quant" runat="server" TextMode="Number" AutoPostBack="false" OnTextChanged="TextBox1_TextChanged" Text="0"></asp:TextBox>--%> 
                                    </div>
                                     <div class="col-md-3">
                                    <h5 class="text-center" runat="server" id="totalTag">total</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button ID="AddToCartBtn" OnClick="AddToCartBtn_Click" runat="server" Text="Add to Cart" CssClass="btn btn-primary btn-block" />
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hiddenValue" runat="server" />
            <asp:HiddenField ID="hiddenQuantity" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>

<script type="text/javascript">

    function showmodal() {
        $("input[type=number]").inputSpinner();
        $("#modelId").modal("show");
    }

    function updatePriceTag() {
        var quantity = $("#quant");
        var pricetag = $("[id$=priceTag]");
        var total = $("[id$=totalTag]");
        var price = pricetag.text().split('$')[1];

        total.text("total : $" + parseInt(quantity.val()) * parseInt( price))
        $("[id$=hiddenQuantity]").val(parseInt(quantity.val()));

    }

$(document).ready((e)=>{

    


});
</script>

</asp:Content>
