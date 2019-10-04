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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </div>
        </div>

       <%-- <div class="row">
            <% int i = 0; foreach (KK.Product prod in GetProducts())
                {
                    i++;%>

            <div class="col-lg-3 p-2" >
                
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">
                                <div class="row">
                                        <div class="col-md-7">
                                                <p class=""><%= prod.Name %></p>
                                            </div> 
                                            <div class="col-md-5">
                                                    <p class="mute text-right text-info">$<%= prod.Price %></p>
                                                </div> 
                                </div>
                            </h5>
                            <div class="row my-n4">
                                <div class="col-md-12">
                                    <img src="<%= prod.Img %>" class="img-fluid"  />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <h6><%= prod.Description %></h6>
                                </div>
                                <hr>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <small><p class="help-text text-muted my-3 mb-0">Quantity</p></small>
                                    <asp:TextBox ID="tb" runat="server" ToolTip="<% prod.Id %>" TextMode="Number" Text="<%= prod.Quantity %>" OnInit="Unnamed_Load" ></asp:TextBox>
                                    <input id="input_<%=i %>" class="form-control col-md-12" type="number" value="<%= prod.Quantity %>" onchange="changed(event)" >
                                </div>
                                
                            </div>
                        </div>
                    </div>
                  
            </div>
            <div class="col-lg-1" ></div>



            <%} %>
        </div>--%>

        <asp:UpdatePanel runat="server" ID="panel" >
            <ContentTemplate >
                
                      <div class="row" id="Cont" runat="server">
                          <asp:PlaceHolder ID="placeHolder" runat="server">
                       <%-- <% int i = 0; foreach (var prod in GetProducts() ) 
                                { %>

                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h5><%= prod.Name %></h5>
                                                    </div>
                                                    <div class="col-md-6 text-right">
                                                       <h6 class="text-success">$<%= prod.Price %></h1></div>
                                                </div>
                                                <img src="<%= prod.Img %>" class="img-fluid" />
                                                <h6><%= prod.Description %></h6>
                                                <div class="row">
                                                    <div class="col-md-12" >
                                                        <small class="text-muted">Quantity</small>
                                                        <div id="ok" runat="server" name="i<%=i %>" onload="Unnamed_Load"></div>              
                                                        <asp:Button ID="btn" runat="server" OnClick="panel_Load" Visible="true" />               
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                        <% i++;
                            } %>--%>
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
