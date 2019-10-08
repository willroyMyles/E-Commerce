namespace KK.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateProductTable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Show", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "Show");
        }
    }
}
