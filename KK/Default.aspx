<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KK._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ProductContent" runat="server">

     <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <img class="img-rounded display-block" src="images/banner.png" style="display: block; max-width: 100%; height: 80%;" />
            </div>
        </div>

         
             <div class="container shadow-sm" style=" width:100vw; margin-left:0px; left:auto;">
                    <div class="row">
                            <div class="col-md-4">
                                <img class="img-rounded display-block mx-5" src="images/kitty-eth.svg" style="display: block; max-width: 100%; height: 80%;" />
                            </div>
                             <div class="col-md-8 p-3 text-center">
                                 <h2>What is KrypyoKitties</h2>
                                 <br />
                                 <p class="text-muted">CryptoKitties is a game centered around breedable, collectible, and oh-so-adorable creatures we call CryptoKitties! Each cat is one-of-a-kind and 100% owned by you; it cannot be replicated, taken away, or destroyed.</p>
                            </div>
                        </div>
             </div>
         

        
        



        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <asp:ImageButton ID="cat1" CssClass="img-fluid" OnClientClick="return false;" ImageUrl="~/images/cat1.png" data-toggle="modal" data-target="#product_1_modal" runat="server"  />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="cat2" CssClass="img-fluid" OnClientClick="return false;" ImageUrl="~/images/cat2.png" data-toggle="modal" data-target="#product_2_modal" runat="server" />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="cat3" CssClass="img-fluid" OnClientClick="return false;" ImageUrl="~/images/cat3.png" data-toggle="modal" data-target="#product_3_modal" runat="server" />
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="product_1_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">cat one</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container">

                        <div class="row">
                            <div class="col-md-12">
                                <img src="/images/cat1.png" class="img-fluid bg-transparent" alt="">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">price</span>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text">$400</span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <input id="input_one" type="number" value="1" min="1" max="100" step="1" />
                                <asp:HiddenField ID="hidden_prod_one" runat="server" value="1"/>
                            </div>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">total</span>
                                    </div>
                                    <div class="input-group-append">
                                        <span id="prod_1_total" class="input-group-text">$400</span>
                                    </div>
                                </div>
                            </div>



                        </div>


                    </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="p1_submit" Text="Add to cart" runat="server" OnClick="Submit_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="product_2_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">cat one</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container">

                        <div class="row">
                            <div class="col-md-12">
                                <img src="/images/cat2.png" class="img-fluid bg-transparent" alt="">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">price</span>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text">$400</span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <input id="input_two" type="number" value="1" min="1" max="100" step="1" />
                                <asp:HiddenField ID="hidden_prod_two" runat="server" Value="1" />
                            </div>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">total</span>
                                    </div>
                                    <div class="input-group-append">
                                        <span id="prod_2_total" class="input-group-text">$400</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="p2_submit" Text="Add to cart" runat="server" OnClick="Submit_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="product_3_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >cat one</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body container">

                        <div class="row">
                            <div class="col-md-12">
                                <img src="/images/cat3.png" class="img-fluid bg-transparent" alt="">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">price</span>
                                    </div>
                                    <div class="input-group-append">
                                        <span class="input-group-text">$400</span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <input id="input_three" type="number" value="1" min="1" max="100" step="1" />
                                <asp:HiddenField ID="hidden_prod_three" runat="server" value="1"/>
                            </div>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">total</span>
                                    </div>
                                    <div class="input-group-append">
                                        <span id="prod_3_total" class="input-group-text">$400</span>
                                    </div>
                                </div>
                            </div>



                        </div>


                    </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="p3_submit" Text="Add to cart" runat="server" OnClick="Submit_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>


    <script>

        
        $(document).ready( ()=> {
            console.log("loaded");


            var prodOne = $("#input_one");
            var prodTwo = $("#input_two");
            var prodThree = $("#input_three");
            prodOne.inputSpinner({});
            prodTwo.inputSpinner({});
            prodThree.inputSpinner({});

            changes(prodOne, $("#prod_1_total"), $("[id$=_hidden_prod_one"));
            changes(prodTwo, $("#prod_2_total"), $("[id$=_hidden_prod_two"));
            changes(prodThree, $("#prod_3_total"), $("[id$=_hidden_prod_three"));

            console.log($("[id$=_hidden_prod_two"))
            
            function changes(spinner, total, hidden) {

                spinner.on("change", (e) => {
                    console.log("tempting");
                    total.text("$" + (400 * parseInt(spinner.val())));
                    hidden.val(parseInt(spinner.val()));
                })
            }


            });
        </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
