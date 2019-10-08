using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK
{
    public partial class OrdersPage : System.Web.UI.Page
    {
        private static List<Info> list;

        public static List<Info> List { get => list; set => list = value; }

        public static int GetTotalById(string id)
        {
            DefaultConnectionTableAdapters.OrdersTableAdapter ota = new DefaultConnectionTableAdapters.OrdersTableAdapter();
            var data = ota.GetOrdersByOrderId(id);
            int total = 0;

            foreach(var order in data) total += order.Subtotal;
            return total;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (GV.user == null) return;
            DefaultConnectionTableAdapters.OrdersTableAdapter ota = new DefaultConnectionTableAdapters.OrdersTableAdapter();
            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();

            List = new List<Info>();
            
            var tables = ota.GetDataByOwner(GV.user.Id);
            var orderCount = 0;
            var orderKey = "";
            bool change = true;
            for(int i =0; i < tables.Count; i++)
            {
                var info = new Info();

                info["change"] = change;
                if (orderKey != tables[i].OrderId)
                {
                    orderKey = tables[i].OrderId;
                    orderCount--;
                    change = true;
                }

                var product = pta.GetDataById(tables[i].ProductId)[0];
        
                info["orderNumber"] = Math.Abs( orderCount);
                info["productName"] = product.Name;
                info["quantity"] = product.Quantity;
                info["price"] = product.Price;
                info["description"] = product.Description;
                info["subtotal"] = product.Price * product.Quantity;
                info["purchased"] = tables[i].Purchased;
                info["id"] = tables[i].OrderId;
                List.Add(info);
                change = false;
            }
        }
    }
}