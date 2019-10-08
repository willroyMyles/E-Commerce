using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK
{
    public partial class ProductPage : System.Web.UI.Page
    {

        protected override void OnInit( EventArgs e)
        {
            base.OnInit(e);

            if (true)
            {
                DefaultConnectionTableAdapters.CatsTableAdapter cta = new DefaultConnectionTableAdapters.CatsTableAdapter();
                var table = cta.GetCats();

                for (int i = 0; i < table.Count; i++)
                {

                    string txt = @"<div class='col-md-4'>
                                            <div class='card shadow-sm'>
                                            <div class='card-body'>
                                                <div class='row'>
                                                    <div class='col-md-6'>
                                                        <h5>name</h5>
                                                    </div>
                                                    <div class='col-md-6 text-right'>
                                                        <h5>price</h5>
                                                    </div>
                                                </div>
                                                <asp:PlaceHolder ID='placeholder' runat='server' />
                                                <h6>description</h6>
                                            </div>
                                        </div>
                                    </div>
                            ";

                    txt = txt.Replace("name", table[i].Name);
                    txt = txt.Replace("price", table[i].Price.ToString());
                    txt = txt.Replace("imgSrc", "/images/" + table[i].ImageSource + ".png");
                    txt = txt.Replace("description", table[i].Description);
                    txt = txt.Replace("imgHolder", "imgHolder_" + i);
                    txt = txt.Replace("placeholder", "place_" + i);

                    var control = ParseControl(txt);
                    Container1.Controls.Add(control);

                }



                for (int i = 0; i < table.Count; i++)
                {
                    var imgBtn = new ImageButton();
                    imgBtn.ID = i.ToString();
                    imgBtn.ImageUrl = "/images/" + table[i].ImageSource + ".png";
                    imgBtn.Click += new ImageClickEventHandler(ImgBtn_Click);
                    imgBtn.CssClass += "img-fluid";
                    imgBtn.CausesValidation = false;
                    
                    var str = "place_" + i;
                    var holder = panel.FindControl(str);
                    holder.Controls.Add(imgBtn);
                }


                panel.UpdateMode = UpdatePanelUpdateMode.Conditional;
                panel.Update();
            }
        }

        public void ImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            var btn = (ImageButton) sender;
            DefaultConnectionTableAdapters.CatsTableAdapter cta = new DefaultConnectionTableAdapters.CatsTableAdapter();
            var table = cta.GetCats();

            for (int i = 0; i < table.Count; i++)
            {
                if(Int32.Parse(btn.ID) == i)
                {
                    modalTitle.InnerHtml = table[i].Name;
                    ImageModal.ImageUrl = "/images/" + table[i].ImageSource + ".png";
                    priceTag.InnerHtml ="$"+ table[i].Price.ToString();
                    hiddenValue.Value = i.ToString();
                }
            }



            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showmodal();", true);
           
        }


        protected void AddToCartBtn_Click(object sender, EventArgs e)
        {
            if (GV.user == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }
            System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;
            Product prod = new Product();
            DefaultConnectionTableAdapters.CatsTableAdapter cta = new DefaultConnectionTableAdapters.CatsTableAdapter();
            var table = cta.GetCats();


            for (int i = 0; i < table.Count; i++)
            {
                if (Int32.Parse(hiddenValue.Value) == i)
                {
                    prod.Name = table[i].Name;
                    prod.Price = table[i].Price;
                    prod.Quantity = int.Parse(hiddenQuantity.Value);
                    prod.Description = table[i].Description;
                    prod.Img = table[i].ImageSource;
                    prod.Category = table[i].Category;
                }
            }

            DefaultConnectionTableAdapters.ProductsTableAdapter pta = new DefaultConnectionTableAdapters.ProductsTableAdapter();
            var tableowner = pta.GetDataByOwnerId(GV.user.Id);

            for (int i = 0; i < tableowner.Count; i++)
            {
                var row = tableowner[i];
                if (row.Name == prod.Name)
                {
                    pta.UpdateProductCount(row.Quantity + prod.Quantity, GV.user.Id, row.Id);
                    return;
                }
            }
            pta.Insert(Guid.NewGuid().ToString(),
                prod.Name,
                prod.Price,
                prod.Quantity,
                DateTime.Now,
                prod.Category,
                prod.Img,
                prod.Description,
                GV.user.Id, true);

            Response.Redirect("/ProductPage.aspx");
        }
    }
}