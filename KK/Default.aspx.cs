using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static void Print(object obj)
        {
            System.Diagnostics.Debug.WriteLine(obj.ToString());
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;
            Product prod = new Product();

            if (btn.ID.Equals(p1_submit.ID))
            {
                prod.Name = "cat one";
                prod.Price = 400;
                prod.Quantity = int.Parse(hidden_prod_one.Value.ToString());
                prod.Description = "Cyber cat! this cat has the power to control the tv without the remote!";
                prod.Category = 1;
            }

            if (btn.ID.Equals(p2_submit.ID))
            {
                prod.Name = "cat two";
                prod.Price = 400;
                prod.Quantity = int.Parse(hidden_prod_two.Value.ToString());
                prod.Description = "Ninja cat! this cat has the power to stealthly remove food from the fridge!";
                prod.Category = 2;

            }

            if (btn.ID.Equals(p3_submit.ID))
            {
                prod.Name = "cat three";
                prod.Price = 400;
                prod.Quantity = int.Parse(hidden_prod_three.Value.ToString());
                prod.Description = "Vacu-cat! this cat is said to be the cat of vald the impailer himself!";
                prod.Category = 3;

            }

            Product.AddCatToProductList(prod);
            Product.productsList.Sort();
        }
    }
}