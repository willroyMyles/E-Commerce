<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="KK.Manage.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container my-5">
            <div class="row">
                    <div class="col-md-10">
                        <h2>Manage Products</h2>
                        <hr>
                    </div>
            </div>

        <div class="row my-4">
            <div class="col-md-4 text-center ">
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#createModal">
                    Create Product
                  </button>
            </div>
            <div class="col-md-4 text-center">
                <button runat="server" onclick="SelectUpdate_SelectedIndexChanged" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#updateModal">
                    Update Product
                  </button>
            </div>
            <div class="col-md-4 text-center">
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#deleteModal">
                    Delete Product
                  </button>
            </div>
        </div>
    </div>

    <!-- Button trigger modal -->
   
    
    <!-- Modal -->
    <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                        <div class="modal-header">
                                <h5 class="modal-title">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                            </div>
                    <div class="modal-body">
                        <div class="container-fluid p-3 ">
                            
                               <%-- <div class="row p-1">
                                        <div class="col-md-2">ID </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Id" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>--%>
                                    <div class="row p-1">
                                        <div class="col-md-2">Name </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Name" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-2">Price </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Price" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-2">Quantity </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Quantity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-2">Category </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Category" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-2">Img </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Img" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-2">Description </div>
                                        <div class="col-md-10">
                                            <asp:TextBox ID="Description" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="Create" runat="server" Text="Create Product" OnClick="Create_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>



        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                            <div class="modal-header">
                                    <h5 class="modal-title">Modal title</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                </div>
                        <div class="modal-body">
                            <asp:UpdatePanel runat="server" ID="UpdateUpdatePanel" ChildrenAsTriggers="false" UpdateMode="Conditional"><ContentTemplate>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col col-md-12">
                                        <asp:DropDownList OnDataBound="SelectUpdate_SelectedIndexChanged" ID="SelectUpdate" AutoPostBack="true" OnSelectedIndexChanged="SelectUpdate_SelectedIndexChanged" runat="server" DataSourceID="catsData" CssClass="form-control"  DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                                    </div>
                                </div>

                                    <div class="row p-1">
                                            <div class="col-md-2">ID </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="IdUpdate" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row p-1">
                                            <div class="col-md-2">Name </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="NameUpdate" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row p-1">
                                            <div class="col-md-2">Price </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="PriceUpdate" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row p-1">
                                            <div class="col-md-2">Quantity </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="QuantityUpdate" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row p-1">
                                            <div class="col-md-2">Category </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="CategoryUpdate" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row p-1">
                                            <div class="col-md-2">Img </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="ImgUpdate" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row p-1">
                                            <div class="col-md-2">Description </div>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="DescriptionUpdate" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                            </div>
                                </ContentTemplate></asp:UpdatePanel>
                            </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button ID="UpdateBtn" runat="server" Text="Update Product" OnClick="UpdateBtn_Click" CssClass="btn btn-primary" />

                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                                <div class="modal-header">
                                        <h5 class="modal-title">Modal title</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                    </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="row">
                                    <div class="col col-md-12">
                                        <asp:DropDownList ID="DropDownDelete" OnSelectedIndexChanged="DropDownDelete_SelectedIndexChanged" runat="server" DataSourceID="catsData" CssClass="form-control"  DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button ID="DeleteCatBtn" runat="server" Text="Delete Product" OnClick="DeleteCatBtn_Click" CssClass="btn btn-danger" />
                           
                            </div>
                        </div>
                    </div>
                </div>
    
    <script>
      
        function loadSpins() {
            var p = $("[id$=PriceUpdate]")
            var q = $("[id$=_Price]")
            var r = $("[id$=QuantityUpdate]")
            var s = $("[id$=_Quantity]")

            p.inputSpinner();
            q.inputSpinner({})
            r.inputSpinner({})
            s.inputSpinner({})
        }


        $(document).ready((e) => {

            
            $("[id$=SelectUpdate]").trigger('onchange');

            console.log("changed");
            console.log($("[id$=PriceUpdate]"));

            loadSpins();


        })
    </script>

    <asp:GridView ID="GridView1" CssClass="table table-dark rounded" runat="server" AutoGenerateColumns="False" DataSourceID="catsData" AllowPaging="True" BorderWidth="0px">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Width="223px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Width="223px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Width="223px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("ImageSource") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Width="223px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Width="223px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cat">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Width="223px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Width="223px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Operations" Visible="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update">Update</asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Insert">Add</asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <asp:SqlDataSource ID="catsData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Cats] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Cats] ([Name], [ImageSource], [Quantity], [Price], [Description], [Category], [Id]) VALUES (@Name, @ImageSource, @Quantity, @Price, @Description, @Category, @Id)" SelectCommand="SELECT [Name], [ImageSource], [Quantity], [Price], [Description], [Category], [Id] FROM [Cats]" UpdateCommand="UPDATE [Cats] SET [Name] = @Name, [ImageSource] = @ImageSource, [Quantity] = @Quantity, [Price] = @Price, [Description] = @Description, [Category] = @Category WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ImageSource" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Category" Type="Int32" />
            <asp:Parameter Name="Id" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ImageSource" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Category" Type="Int32" />
            <asp:Parameter Name="Id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    </asp:Content>
