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
            if (!IsPostBack)
            {
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
                                                    <div class='col-md-4 text-right'>
                                                       <h6 class='text-success'>$price</h1></div>
                                                </div>
                                                <div class='col-md-3'><i class='fa fa-window-close-o' aria-hidden='true'></i></div>
                                                <img src ='image' class='img-fluid' />
                                                <h6>description</h6>
                                                <div class='row'>
                                                    <div class='col-md-12' >
                                                        <small class='text-muted'>Quantity</small>
                                                        <div id = 'divId' runat='server' onload='Unnamed_Load'></div>              
                                      
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            ";

                    lit.Text = lit.Text.Replace("name", prod[i].Name);
                    lit.Text = lit.Text.Replace("price", prod[i].Price.ToString());
                    lit.Text = lit.Text.Replace("image", prod[i].Img);
                    lit.Text = lit.Text.Replace("description", prod[i].Description);
                    lit.Text = lit.Text.Replace("divId", "divId" + i);

                    var control = ParseControl(lit.Text);

                    placeHolder.Controls.Add(control);
                }

                for (int i = 0; i < GetProducts().Count; i++)
                {
                    var input = new TextBox();
                    input.ID = i.ToString();
                    input.TextMode = TextBoxMode.Number;
                    input.Text = prod[i].Quantity.ToString();
                    input.TextChanged += new EventHandler(UpdateItem);

                    var holder = panel.FindControl("divId" + i);
                    holder.Controls.Add(input);
                }
                panel.UpdateMode = UpdatePanelUpdateMode.Conditional;
                panel.Update();


            }


        }

        protected static String GetDeleteButtonid() => "Delete_"+ counter++;
        protected static int GetCounter() => counter;

        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static void DeleteItem(int num)
        {
            
            System.Diagnostics.Debug.WriteLine("intersting "+ num);

        }

        public int GetProductQuantity( string id)
        {

            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            return pta.GetOneProductById(id)[0].Quantity;
        }

        [WebMethod]
        public void UpdateItem(object sender, EventArgs e)
        {
            
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

            

            for(int i = 0; i < tables.Count; i++)
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