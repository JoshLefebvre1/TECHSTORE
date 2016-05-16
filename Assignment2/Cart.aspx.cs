using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (Request.Cookies["cartItem"] != null)//Cookie exists
            {
                Assignment2Entities db = new Assignment2Entities();
                String currentItems = Request.Cookies["cartItem"].Value;
                List<string> products = currentItems.Split(',').ToList<string>();

                List<PRODUCT> cartProducts = new List<PRODUCT>();
                double priceTotal=0;
                foreach(string p in products)
                {
                    int productID = Int32.Parse(p); 
                    var iProducts = (from r in db.PRODUCTs where r.ProductId == productID select r).First();
                    cartProducts.Add(iProducts);

                    if (iProducts.IsOnSale)
                    {
                        priceTotal += iProducts.SalePrice;
                    }
                    else
                    {
                        priceTotal += iProducts.Price;
                    }
                    
                }

                //Total
                total.Text = String.Format("{0:0.00}", priceTotal);
                //Taxes
                double tax = (priceTotal * 0.15);
                taxes.Text = String.Format("{0:0.00}", tax);
                //SubTotal
                double SubTotal = priceTotal + tax + 11.99;
                subTotal.Text = String.Format("{0:0.00}", SubTotal);

                Repeater1.DataSource = cartProducts;
                Repeater1.DataBind();

            }
            else//Cookie does not exist
            {

            }
        }
    }
}