using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KK
{
    public partial class Cats
    {
        private string id;
        private string name;
        private string imageSource;
        private int category;
        private int quantity;
        private int price;
        private string description;

        public Cats()
        {
            id = Guid.NewGuid().ToString();
        }

        public Cats(string name, string imageSource, int category, int quantity, int price, string description) : base()
        {
            
            this.name = name;
            this.imageSource = imageSource;
            this.category = category;
            this.quantity = quantity;
            this.price = price;
            this.description = description;
        }
        public string Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string ImageSource { get => imageSource; set => imageSource = value; }
        public int Category { get => category; set => category = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public int Price { get => price; set => price = value; }
        public string Description { get => description; set => description = value; }
    }
}