<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartV2.aspx.cs" Inherits="KK.CartV2" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row my-3">
            <div class="col-md-10">
                <h3>View items in cart</h3>
            </div>
            <div class="col-md-2">
                <button runat="server" id="placeOrderBtn" data-toggle="modal" data-target="#modalConfirm" type="button" class="btn btn-primary btn-lg btn-block fixed-top"><i class="fa fa-plus-circle" aria-hidden="true"></i> place order</button>
            </div>
        </div>
        <hr>

        
         
    
       <!-- Modal -->
       <div class="modal fade" id="modalConfirm" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered modal-dark modal-lg" role="document">
               <div class="modal-content">
                       <div class="modal-header">
                               <h5 class="modal-title">Confirm Order</h5>
                                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                   </button>
                           </div>
                   <div class="modal-body">
                       <div class="" runat="server" id="modalConfirmHolder">
                        <asp:GridView ID="GridView1" CssClass="table table-dark table-borderless table-dark table-hover table-sm .table-responsive" runat="server"  AutoGenerateColumns="False" DataKeyNames="Id">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# (int)Eval("Quantity") * (int)Eval("Price") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                       </div>
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       <button type="button" class="btn btn-primary">Place Order</button>
                   </div>
               </div>
           </div>
       </div>
        
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView" OnLoad="GridView_Load" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1">
                    <Columns>
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
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByOwnerId" TypeName="KK.DefaultConnectionTableAdapters.ProductsTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Price" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Purchased" Type="DateTime" />
                        <asp:Parameter Name="Category" Type="Int32" />
                        <asp:Parameter Name="Img" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Owner" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="owner" SessionField="userId" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Price" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Purchased" Type="DateTime" />
                        <asp:Parameter Name="Category" Type="Int32" />
                        <asp:Parameter Name="Img" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Owner" Type="String" />
                        <asp:Parameter Name="Original_Id" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [Price], [Quantity], [Description] FROM [Products] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Id" SessionField="userId" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ID="panel" >
            <ContentTemplate >
                
                      <div class="row" id="Cont" runat="server">
                          <asp:PlaceHolder ID="placeHolder" runat="server">
        
                </asp:PlaceHolder>

                    </div>
                
                  
                
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script>
        $(document).ready((e) => {

           $("input[type=number]").inputSpinner();
        });

        function changed(e) {
            e = e || window.event;
            var target = e.target;
            console.log(target);


            var str = { msg: str };
            $.ajax({
                method: "POST",
                type: "POST",
                url: "CartV2.aspx/UpdateItem",
                data: JSON.stringify(str),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                },
                success: function (result) {
                    alert("We returned: " + result);
                }
            });
        }
    </script>
</asp:Content>
