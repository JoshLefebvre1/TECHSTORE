using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class MasterPageAdminMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/default.aspx");
            }
            else
            {
                Assignment2Entities db = new Assignment2Entities();

                username.Text = Session["email"].ToString();
                if (Request.Cookies["cartItem"] != null)//Cookie exists
                {
                    String items = Request.Cookies["cartItem"].Value;
                    String[] allItems = items.Split(',');
                    int itemCount = allItems.Length;
                    double price = 0;
                    foreach (String s in allItems)
                    {
                        int id = Int32.Parse(s);
                        double priceDB = (from y in db.PRODUCTs where y.ProductId == id select y.SalePrice).First();
                        price += priceDB;
                    }
                    cartLabel.Text = String.Format("{0:0.00}", price) + "(" + itemCount + "items)";
                }
                else
                {
                    cartLabel.Text = "$0.00 (0 items)";
                }
            }
        }

        protected void deleteCookies(object sender, EventArgs e)
        {
            if (Request.Cookies["cartItem"] != null)
            {
                Response.Cookies["cartItem"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect(Request.RawUrl);
            }
        }

    }
}