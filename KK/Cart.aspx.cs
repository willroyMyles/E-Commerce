using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace KK
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("loaddded");

        }

        public List<Product> GetProducts()
        {
            return Product.productsList;
        }

        public static int GetTotal()
        {
            int total = 0;

            foreach (Product p in Product.productsList)
            {
                total += p.Total;
            }
            return total;
        }

        public void GetHiddenElement(Product prod)
        {

        }


        protected void Button_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;

            if (btn.ID.Equals(hidden_button_1.ID))
            {
                Product p = Product.productsList.Find(x => x.Id == "1");
                int index = Product.productsList.IndexOf(p);
                Product.productsList.Remove(p);
                p.Quantity = int.Parse(hidden_1.Value);
                Product.productsList.Insert(index, p);
            }

            if (btn.ID.Equals(hidden_button_2.ID))
            {
                Product p = Product.productsList.Find(x => x.Id == "2");
                int index = Product.productsList.IndexOf(p);
                Product.productsList.Remove(p);
                p.Quantity = int.Parse(hidden_2.Value);
                Product.productsList.Add(p);
            }

            if (btn.ID.Equals(hidden_button_3.ID))
            {
                Product p = Product.productsList.Find(x => x.Id == "3");
                int index = Product.productsList.IndexOf(p);
                Product.productsList.Remove(p);
                p.Quantity = int.Parse(hidden_3.Value);
                Product.productsList.Add(p);
            }

            Product.productsList.Sort();
        }

        protected void RemoveElement_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;

            if (btn.ID.Equals(delete_prod_1.ID))
                Product.productsList.Remove(Product.productsList.Find(x => x.Id == "1"));
            if (btn.ID.Equals(delete_prod_2.ID))
                Product.productsList.Remove(Product.productsList.Find(x => x.Id == "2"));
            if (btn.ID.Equals(delete_prod_3.ID))
                Product.productsList.Remove(Product.productsList.Find(x => x.Id == "3"));

        }
    }
}