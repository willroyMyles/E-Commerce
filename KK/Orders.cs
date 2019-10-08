using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace KK
{
    public partial class Orders
    {
        
        private string id;
        private string productId;
        private string customerId;
        private int quantity;
        private int subtotal;
        private DateTime purchased;

        public static Orders GenerateOrders(string id){
            var order = new Orders();
            order.id = id;
            order.purchased = DateTime.Now;

            return order;
        }
        public Orders()
        {
            id = Guid.NewGuid().ToString();
            purchased = DateTime.Now;
        }

        public Orders( string productId, string customerId, int quantity, int subtotal) : base()
        {
            this.productId = productId;
            this.customerId = customerId;
            this.quantity = quantity;
            this.subtotal = subtotal;
            
        }
        [Key, Column(Order=0)]
        public string OrderId { get => id; set => id = value; }
        [Key, Column(Order =1)]
        public string ProductId { get => productId; set => productId = value; }
        public string CustomerId { get => customerId; set => customerId = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public int Subtotal { get => subtotal; set => subtotal = value; }
        public DateTime Purchased { get => purchased; set => purchased = value; }
    }
}