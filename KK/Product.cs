using System;
using System.Collections.Generic;
using System.Web;

namespace KK
{
    public class Product : IHttpModule, IComparable<Product>
    {
        /// <summary>
        /// You will need to configure this module in the Web.config file of your
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: https://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpModule Members

        public void Dispose()
        {
            //clean-up code here.
        }

        public void Init(HttpApplication context)
        {
            // Below is an example of how you can handle LogRequest event and provide 
            // custom logging implementation for it
            context.LogRequest += new EventHandler(OnLogRequest);
        }

        #endregion

        private string name;
        private int price = 400;
        private int total;
        private int category = 1;
        private string img;
        private int quantity = 1;
        private DateTime purchased;
        private string id;
        private string description;
        private string owner;
        private bool show = true;

        public static List<Product> productsList = new List<Product>();
        private static int counter = 0;

    
        public string Name { get => name; set => name = value; }
        public int Price { get => price; set => price = value; }
        public int Total { get => price * quantity; }
        public int Quantity { get => quantity; set => quantity = value; }
        public DateTime Purchased { get => purchased; set => purchased = value; }
        public string Id { get => id; set => id = value; }
        public int Category { get => category; set => category = value; }
        public string Img { get => img; set => img = value; }
        public string Description { get => description; set => description = value; }
        public string Owner { get => owner; set => owner = value; }
        public bool Show { get => show; set => show = value; }

        public Product()
        {
            counter++;
            purchased = new DateTime().ToUniversalTime();
            Id = counter.ToString();
            show = true;
        }

        public Product GetProductById(string id)
        {
            return productsList.Find(x => x.id == id);
        }

        public static void AddCatToProductList(Product prod)
        {

            if (productsList.Exists(x => x.Category == prod.category))
            {
                Product p = productsList.Find(x => x.category == prod.category);
                productsList.Remove(p);
                p.Quantity += prod.quantity;
                productsList.Add(p);
            }
            else
                productsList.Add(prod);
        }

        public static void UpdateProduct(int quantity, Product prod)
        {

        }

        public void OnLogRequest(Object source, EventArgs e)
        {
            //custom logging logic can go here
        }

        public int CompareTo(Product other)
        {
            if (other == null)
                return 1;

            else
                return this.Id.CompareTo(other.id);
        }
    }
}
