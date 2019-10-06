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

        public void Page_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("called");
        }

        public static int counter = 0;
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            counter = 0;

            var prod = GetProducts();
            for (int i = 0; i < prod.Count; i++)
            {
                string lit = @"<div class='col-md-4'>
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
                                                        <div class='col-md-8'>
                                                            <input class='col-md-8' id='somid' text='somtext' type='number' value='somtext' min='1' onchange='showbutton(this)' />
                                                        </div>              
                                                        <div class='col-md-3 text-center align-middle form-control'>$total</div>              
                                                        </div>
                                                            
                                                        <div class='my-2'>
                                                        <button type='button' hidden='true' id='buttonn' onclick='changeHiddenValue(this)' class='btn btn-primary btn-block'>Update</button>
<asp:PlaceHolder ID='placeholder' runat='server' /> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            ";

                lit = lit.Replace("name", prod[i].Name);
                lit = lit.Replace("price", prod[i].Price.ToString());
                lit = lit.Replace("image","/images/"+ prod[i].Img +".png");
                lit = lit.Replace("description", prod[i].Description);
                //lit = lit.Replace("divId", "divId" + i);
                lit = lit.Replace("total", prod[i].Total.ToString());
                lit = lit.Replace("placeholder", "place_"+i);
                
                lit = lit.Replace("somid", "spin_"+i);
                lit = lit.Replace("somtext", prod[i].Quantity.ToString());
                lit = lit.Replace("buttonn", "buttonn_"+i);

                var control = ParseControl(lit);
                Cont.Controls.Add(control);
            }

            for (int i = 0; i < GetProducts().Count; i++)
            {
                //var input = new TextBox();
                //input.ID = i.ToString();
                //input.TextMode = TextBoxMode.Number;
                //input.Text = prod[i].Quantity.ToString();
                //input.TextChanged += TextBox1_TextChanged;
                //input.CausesValidation = false;
                //input.AutoPostBack = true;


                var btn = new HiddenField();
                btn.ID = "hiddenValue_"+i.ToString();
                btn.Value = "";
                btn.ValueChanged += UpdateItem;
                
               

                var holder = panel.FindControl("place_" + i);
                //holder.Controls.Add(input);
                holder.Controls.Add(btn);
            }

            updateTotal();
            panel.UpdateMode = UpdatePanelUpdateMode.Conditional;
            panel.Update();
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

        public int GetProductQuantity(string id)
        {

            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            return pta.GetOneProductById(id)[0].Quantity;
        }

        public void UpdateItem(object sender, EventArgs e)
        {
            var senderBtn = (Button)sender;
            senderBtn.Visible = false;
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

        public void TextBox1_TextChanged(object sender, EventArgs e)
        {
            var senderBtn = (TextBox)sender;
            var btn = panel.FindControl("btn_" + senderBtn.ID);
            if (btn.Visible == false) btn.Visible = true;
             ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('inout[type=number]').inputSpinner();", true);
            panel.Update();
        }

    }
}