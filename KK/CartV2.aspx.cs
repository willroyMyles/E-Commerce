using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK
{
    public partial class CartV2 : System.Web.UI.Page
    {

        public static int counter = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                counter = 0;
        }

        protected static String GetDeleteButtonid() => "Delete_"+ counter++;
        protected static int GetCounter() => counter;

        [System.Web.Services.WebMethod()]
        [System.Web.Script.Services.ScriptMethod()]
        public static void DeleteItem(int num)
        {
            
            System.Diagnostics.Debug.WriteLine("intersting "+ num);

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
                list.Add(p);
                
            }

          
            return list;
        }

        protected void BindButton(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            btn.ID = GetDeleteButtonid();
        }
    }
}