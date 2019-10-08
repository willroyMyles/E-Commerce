<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartV2.aspx.cs" Inherits="KK.CartV2" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
   

         <asp:UpdatePanel runat="server" ID="panel" >
            <ContentTemplate >   
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

                      <div class="row" id="Cont" runat="server">
                          
                    </div>

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
                       <asp:Button CssClass="btn btn-primary btn-block" ID="OrderBtn" runat="server" Text="Place Order" OnClick="OrderBtn_Click" />
                   </div>
               </div>
           </div>
       </div>
        
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView" OnLoad="GridView_Load" runat="server" CssClass="table table-dark" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" SortExpression="Description" />
                        <asp:BoundField DataField="Img" HeaderText="Img" ReadOnly="True" SortExpression="Img" />
                        <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# (int)Eval("Price") * (int)Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, Name, Price, Quantity, Category, Img, Description, Owner FROM Products WHERE (Owner = @owner)" DeleteCommand="DELETE FROM [Products] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Products] ([Id], [Name], [Price], [Quantity], [Category], [Img], [Description], [Owner]) VALUES (@Id, @Name, @Price, @Quantity, @Category, @Img, @Description, @Owner)" UpdateCommand="UPDATE Products SET Quantity = @Quantity WHERE (Id = @Id)">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Price" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Category" Type="Int32" />
                        <asp:Parameter Name="Img" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Owner" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="owner" SessionField="userId" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Id" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
         
    
     

    <script>
        $(document).ready((e) => {

            $("input[type=number]").inputSpinner();
           
        });

        function showbutton(e) {
            var id = e.id.split('_')[1];
            var btn = $("#buttonn_" + id);
            var spin = $("#spin_" + id);

            btn.attr("hidden", false);
            

            if (spin.val() == 0) {
                $(btn).removeClass("btn-primary");
                $(btn).addClass("btn-danger");
                btn.text("Remove")
            } else {
                btn.removeClass("btn-danger");
                btn.addClass("btn-primary");
                btn.text("Update")
            }
            
        }

        function changeHiddenValue(e) {
            var num = e.id.split('_')[1];
            var hiddenId = "hiddenValue_" + num;
            var spin = $("#spin_" + num);
            var hiddenElement = $("[id$=" + hiddenId + "]");
            hiddenElement.val(spin.val())
            console.log(hiddenElement);
            __doPostBack();
        }


       
    </script>
</asp:Content>
