using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();

            if (Request.Cookies["cartItem"] != null)//Cookie exists
            {
                String items = Request.Cookies["cartItem"].Value;
                String[] allItems = items.Split(',');
                double price = 0;
                foreach (String s in allItems)
                {
                    int id = Int32.Parse(s);
                    double priceDB = (from y in db.PRODUCTs where y.ProductId == id select y.SalePrice).First();
                    price += priceDB;
                }

                //Total
                total.Text = String.Format("{0:0.00}", price);
                //Taxes
                double tax = (price * 0.15);
                taxes.Text = String.Format("{0:0.00}", tax);
                //SubTotal
                double SubTotal = price + tax + 11.99;
                subTotal.Text = String.Format("{0:0.00}", SubTotal);

            }
            else//Cookie does not exist
            {
                Response.Redirect("Default.aspx");

            }
        }

        protected void placeOrder(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Request.Cookies["cartItem"] != null)//Cookie exists
                {
                    //Remove Old Cookie
                    Response.Cookies["cartItem"].Expires = DateTime.Now.AddDays(-1);

                    Response.Redirect("ThankYou.aspx");

                }
                else//Cookie does not exist
                {
                    Response.Redirect("Default.aspx");

                }
            }
        }
    }
}