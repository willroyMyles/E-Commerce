<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="KK.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container my-5">
        
        <div class="row">
            <div class="col-md-12">
                <h4>View items in your cart</h1>
            </div>
        </div>
        <hr>
    </div>

    <div class="container card-body bg-grey" id="contentDiv" runat="server">
        <div class="row">
            <div class="col-md-1">
                <strong><h5>...</h5></strong>
            </div>
            <div class="col-md-2">
                <strong><h5>name</h5></strong>
            </div>
            <div class="col-md-1">
                <strong><h5>Id</h5></strong>
            </div>
            <div class="col-md-2">
                <strong><h5>Description</h5></strong>
            </div>
            <div class="col-md-2 text-center">
                <strong><h5>Price</h5></strong>
            </div>
            <div class="col-md-2 text-center">
                <strong><h5>Quantity</h5></strong>
            </div>
            <div class="col-md-2 text-center">
                <strong><h5>Total</h5></strong>
            </div>
        </div>
        <hr>
        <% foreach (KK.Product prod in GetProducts())
            { %>
            <div class="row">
                <div class="col-md-1">
                    <div style="display:none;">                    
                     <% if (prod.Id == "1") {%><asp:Button ID="delete_prod_1" runat="server" OnClick="RemoveElement_Click" CausesValidation="false" /><%} %>
                     <% if (prod.Id == "2") {%><asp:Button ID="delete_prod_2" runat="server" OnClick="RemoveElement_Click" CausesValidation="false" /><%} %>
                     <% if (prod.Id == "3") {%><asp:Button ID="delete_prod_3" runat="server" OnClick="RemoveElement_Click" CausesValidation="false" /><%} %>
                    </div>
                     <% if (prod.Id == "1") {%><a name="" id="remove_1" class="btn btn-primary" href="javascript:void(0);" onclick="deleteCat(1, '<%=prod.Name %>')" role="button"><i class="fa fa-times-circle" aria-hidden="true"></i></a><%} %>
                     <% if (prod.Id == "2") {%><a name="" id="remove_2" class="btn btn-primary" href="#" onclick="deleteCat(2, '<%=prod.Name %>')" role="button"><i class="fa fa-times-circle" aria-hidden="true"></i></a><%} %>
                     <% if (prod.Id == "3") {%><a name="" id="remove_3" class="btn btn-primary" href="#" onclick="deleteCat(3, '<%=prod.Name %>')" role="button"><i class="fa fa-times-circle" aria-hidden="true"></i></a><%} %>

                </div>
                <div class="col-md-2">
                    <%=prod.Name %>
                </div>

                <div class="col-md-1">
                    <%=prod.Id %>
                </div>
                
                <div class="col-md-2">
                    <%=prod.Description %>
                </div>

                <div class="col-md-2 text-center">
                    $<%=prod.Price %>
                </div>

                <div class="col-md-2 text-center">
                     <%GetHiddenElement(prod); %>
                    <input id="input_<%=prod.Id%>" type="number" value="<%=prod.Quantity%>" min="1" max="100" step="1"/>
                    <div style="display : none;" id="tag" >

                        <% if (prod.Id == "1") {%>
                        <asp:Button ID="hidden_button_1" runat="server" OnClick="Button_Click" CausesValidation="false" />
                        <asp:HiddenField ID="hidden_1" runat="server" value="1"/>
                        <%} %>
                        <% if (prod.Id == "2") {%><asp:Button ID="hidden_button_2" runat="server" OnClick="Button_Click" CausesValidation="false" />
                        <asp:HiddenField ID="hidden_2" runat="server" value="1"/>
                        <%} %>
                        <% if (prod.Id == "3") {%><asp:Button ID="hidden_button_3" runat="server" OnClick="Button_Click" CausesValidation="false" />
                        <asp:HiddenField ID="hidden_3" runat="server" value="1"/>
                        <%} %>

                        
                    </div>
                   
                </div>

                <div class="col-md-2 text-center">
                    $<%=prod.Total %>
                </div>
            </div>
        
      <%  } %>

      <hr class="">
      <div class="row my-1">
          <hr>
          <div class="col-md-10 text-right">
              <p>grand total : </p>
          </div>
          <div class="col-md-2 text-center">
              <strong>$<%=GetTotal()%></strong>
          </div>
      </div>
    </div>

     <script>
        $(document).ready( ()=> {
            console.log("loaded");


            var prodOne = $("#input_1");
            var prodTwo = $("#input_2");
            var prodThree = $("#input_3");
            prodOne.inputSpinner({});
            prodTwo.inputSpinner({});
            prodThree.inputSpinner({});

            changes(prodOne, $("[id$=hidden_1"), $("[id$=hidden_button_1]"), 1);
            changes(prodTwo, $("[id$=hidden_2"), $("[id$=hidden_button_2]"), 2);
            changes(prodThree, $("[id$=hidden_3"), $("[id$=hidden_button_3]"), 3);

            updateValues(prodOne, $("[id$=_hidden_1"));
            updateValues(prodTwo, $("[id$=_hidden_2"));
            updateValues(prodThree, $("[id$=_hidden_3"));

            function updateValues(spinner, hidden) {
                hidden.val(parseInt(spinner.val()));
            }

            
            function changes(spinner, hidden, hiddenButton, prodIndex) {

                spinner.on("change", (e) => {
                    console.log("tempting");
                    hidden.val(parseInt(spinner.val()));
                    hiddenButton.click();
                  
                })
            }

           

        });

         function deleteCat(index, name) {
             var cat = '/images/cat' + index + '.png';
             console.log(cat);

             Swal.fire({
                 title: 'Oh-My',
                 text: 'Are you sure you want to remove '+ name + ' from cart?',
                 imageUrl: cat,
                 imageWidth: 400,
                 imageHeight: 300,
                 imageAlt: 'Custom image',
                 animation: false,
                 showCancelButton: true,
                 confirmButtonColor: '#3085d6',
                 cancelButtonColor: '#d33',
                 confirmButtonText: 'Yes, delete it!'
                 
             }).then((results) => {
                 if (results.value) {
                     //remove
                     var btn = $("[id$=delete_prod_" + index + "");
                     btn.click();
                 }
             })
         }
        </script>

</asp:Content>
