using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK.Manage
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DefaultConnectionTableAdapters.ProductsTableAdapter ap = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            DefaultConnection.ProductsDataTable products = ap.GetData();
        }
    }
}