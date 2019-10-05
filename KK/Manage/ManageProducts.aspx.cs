using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK.Manage
{
    public partial class ManageProducts : System.Web.UI.Page
    {

        private static bool firstRun = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || firstRun)
            {
                SelectUpdate.DataBind();
            }
            firstRun = false;
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            DefaultConnectionTableAdapters.ProductsTableAdapter ap = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            DefaultConnection.ProductsDataTable products = ap.GetData();

            CatDataSetTableAdapters.CatsTableAdapter catsAdapter = new CatDataSetTableAdapters.CatsTableAdapter();

            if (FileUploadCreate.HasFile)
            {
                try
                {
                    if (FileUploadCreate.PostedFile.ContentType == "image/jpeg" || FileUploadCreate.PostedFile.ContentType == "image/png")
                    {
                        if (FileUploadCreate.PostedFile.ContentLength < 102400)
                        {
                            var ext = Path.GetExtension(FileUploadCreate.FileName);
                            FileUploadCreate.SaveAs(Server.MapPath("~/images/") + Img.Text+ext);
                        }
                        else { }
                    }
                    else { }
                }
                catch (Exception ex)
                {
                    //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }

            var price = int.Parse(Price.Text);
            var quantity = int.Parse(Quantity.Text);
            var cat = int.Parse(Category.Text);

            catsAdapter.Insert(Guid.NewGuid().ToString(), Name.Text, Img.Text, cat, quantity, price, Description.Text);
            GridView1.DataBind();

        }

        protected void SelectUpdate_SelectedIndexChanged(object sender, EventArgs e)
        {

           
                var id = SelectUpdate.SelectedValue;
                CatDataSetTableAdapters.CatsTableAdapter catsAdapter = new CatDataSetTableAdapters.CatsTableAdapter();
                var cat = catsAdapter.GetCatById(id).FindById(id);
                //var foundData = cat.FindById(id);



                IdUpdate.Text = cat.Id;
                NameUpdate.Text = cat.Name;
                PriceUpdate.Text = cat.Price.ToString();
                QuantityUpdate.Text = cat.Quantity.ToString();
                CategoryUpdate.Text = cat.Category.ToString();
                ImgUpdate.Text = cat.ImageSource;
                DescriptionUpdate.Text = cat.Description;

            UpdateUpdatePanel.Update();
           


        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (FileUploadEdit.HasFile)
            {
                try
                {
                    if (FileUploadEdit.PostedFile.ContentType == "image/jpeg" || FileUploadEdit.PostedFile.ContentType == "image/png")
                    {
                        if (FileUploadEdit.PostedFile.ContentLength < 102400)
                        {
                            var ext = Path.GetExtension(FileUploadEdit.FileName);
                            FileUploadEdit.SaveAs(Server.MapPath("~/images/") + Img.Text + ext);
                        }
                        else { }
                    }
                    else { }
                }
                catch (Exception ex)
                {
                    //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            CatDataSetTableAdapters.CatsTableAdapter catsAdapter = new CatDataSetTableAdapters.CatsTableAdapter();
            var price = int.Parse(PriceUpdate.Text);
            var quantity = int.Parse(QuantityUpdate.Text);
            var cat = int.Parse(CategoryUpdate.Text);
            catsAdapter.Update(IdUpdate.Text, NameUpdate.Text, ImgUpdate.Text, cat, quantity, price, DescriptionUpdate.Text, IdUpdate.Text);
            GridView1.DataBind();
        }

        protected void DropDownDelete_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DeleteCatBtn_Click(object sender, EventArgs e)
        {
            CatDataSetTableAdapters.CatsTableAdapter catsAdapter = new CatDataSetTableAdapters.CatsTableAdapter();
            catsAdapter.Delete(DropDownDelete.SelectedValue);
            GridView1.DataBind();
            SelectUpdate.DataBind();
            DropDownDelete.DataBind();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridView1_UpdateItem(int id)
        {
            System.Diagnostics.Debug.WriteLine("writing a line");
        }

        // The id parameter name should match the DataKeyNames value set on the control
        

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete") System.Diagnostics.Debug.WriteLine("deleting");
            if (e.CommandName == "Add") System.Diagnostics.Debug.WriteLine("Add sql");

           

        }

    
    }
}