namespace KK.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddedOrdersTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        OrderId = c.String(nullable: false, maxLength: 128),
                        ProductId = c.String(nullable: false, maxLength: 128),
                        CustomerId = c.String(nullable: false),
                        Quantity = c.Int(nullable: false),
                        Subtotal = c.Int(nullable: false),
                        Purchased = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => new { t.OrderId, t.ProductId });
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Orders");
        }
    }
}
