using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK
{
    public partial class CartV2 : System.Web.UI.Page
    {

        public static int counter = 0;

        protected override void OnInit(EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            counter = 0;

            var prod = GetProducts();
            for (int i = 0; i < GetProducts().Count; i++)
            {
                LiteralControl lit = new LiteralControl();
                lit.Text = @"<div class='col-md-4'>
                                            <div class='card shadow-sm'>
                                            <div class='card-body'>
                                                <div class='row'>
                                                    <div class='col-md-5'>
                                                        <h5>name</h5>
                                                    </div>
                                                    <div class='col-md-6 text-right align-bottom'>
                                                       <h6 class='text-success'>$price</h1></div>
                                                       <a class='' href='#' ><i class='fa fa-times-circle' aria-hidden='true'></i></a>
                                                </div>
                                                
                                                <img src ='image' class='img-fluid' />
                                                <h6>description</h6>
                                                <div class='row'>
                                                    <div class='col-md-12' >
                                                         <div class='row'>
                                                            <small class='text-muted col-md-8'>Quantity</small>
                                                            <small class='text-muted col-md-3'>Price</small>
                                                        </div>        
                                                        <div class='row'>
                                                        <div id = 'divId' runat='server' class='col-md-8'></div>              
                                                        <div class='col-md-3 text-center align-middle form-control'>$total</div>              
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            ";

                lit.Text = lit.Text.Replace("name", prod[i].Name);
                lit.Text = lit.Text.Replace("price", prod[i].Price.ToString());
                lit.Text = lit.Text.Replace("image","/images/"+ prod[i].Img +".png");
                lit.Text = lit.Text.Replace("description", prod[i].Description);
                lit.Text = lit.Text.Replace("divId", "divId" + i);
                lit.Text = lit.Text.Replace("total", prod[i].Total.ToString());

                var control = ParseControl(lit.Text);

                placeHolder.Controls.Add(control);
            }

            for (int i = 0; i < GetProducts().Count; i++)
            {
                var input = new TextBox();
                input.ID = i.ToString();
                input.TextMode = TextBoxMode.Number;
                input.Text = prod[i].Quantity.ToString();
                input.TextChanged += new EventHandler(this.UpdateItem);
                input.TextChanged += UpdateItem;
                

                var holder = panel.FindControl("divId" + i);
                holder.Controls.Add(input);
            }
            panel.UpdateMode = UpdatePanelUpdateMode.Conditional;
            panel.Update();

            updateTotal();




        }

        private void updateTotal()
        {
            var prod = GetProducts();
            int total = 0;
            for (int i = 0; i < prod.Count; i++)
            {
                var subTotal = prod[i].Price * prod[i].Quantity;
                total += subTotal;
            }
            placeOrderBtn.InnerText = "Place Order | Total : $" + total;
            updateTotalTable();
        }

        private void updateTotalTable()
        {
            if (GV.user == null) return;
            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            var td = pta.GetDataByOwnerId(GV.user.Id);
            GridView1.DataSource = td;
            GridView1.DataBind();
        }

        protected static int GetCounter() => counter;

        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static void DeleteItem(int num)
        {

            System.Diagnostics.Debug.WriteLine("intersting " + num);

        }

        public int GetProductQuantity(string id)
        {

            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            return pta.GetOneProductById(id)[0].Quantity;
        }

        [WebMethod]
        public void UpdateItem(object sender, EventArgs e)
        {
            return;
        }

        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static List<Product> GetProducts()
        {
            if (GV.user == null) return new List<Product>();
            var id = GV.user.Id;
            List<Product> list = new List<Product>();
            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            var tables = pta.GetDataByOwnerId(id);



            for (int i = 0; i < tables.Count; i++)
            {
                var row = tables[i];
                Product p = new Product();
                p.Description = row.Description;
                p.Name = row.Name;
                p.Price = row.Price;
                p.Quantity = row.Quantity;
                p.Img = row.Img;
                list.Add(p);

            }


            return list;
        }



        protected void GridView_Load(object sender, EventArgs e)
        {
            if (GV.user == null) return;
            var id = GV.user.Id;
            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            var tables = pta.GetDataByOwnerId(id);

        }


    }
}