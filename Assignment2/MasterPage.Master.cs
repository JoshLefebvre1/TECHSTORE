using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            Assignment2Entities db = new Assignment2Entities();
            var allRows = (from r in db.CATEGORies select r).ToList();

            Repeater1.DataSource = allRows;
            Repeater1.DataBind();

            if (Request.Cookies["cartItem"] != null)//Cookie exists
            {
                String items = Request.Cookies["cartItem"].Value;
                String[] allItems = items.Split(',');
                int itemCount = allItems.Length;
                double price = 0;
                foreach(String s in allItems )
                {
                    int id = Int32.Parse(s);
                    double priceDB=(from y in db.PRODUCTs where y.ProductId == id select y.SalePrice).First();
                    price += priceDB;
                }
                cartLabel.Text = String.Format("{0:0.00}", price) +"(" + itemCount + "items)";
            }
            else
            {
                cartLabel.Text = "$0.00 (0 items)";
            }

                if (Session["email"] != null)
            {

                String currentEmail = (string)Session["email"];
                String userEmail = (from r in db.Users where r.Email == currentEmail select r.Email).First();
                registerUsername.Text = userEmail;
                registerUsername.NavigateUrl = "#";
                
                if(Session["admin"]!=null)
                {
                    registerUsername.Text = userEmail + "<br/>Admin Home";
                    registerUsername.NavigateUrl = "/Admin/AdminHome.aspx";
                    loginLogout.Text = "Logout" + "<br> ";
                }
                else
                {
                    registerUsername.Text = userEmail;
                    registerUsername.NavigateUrl = "#";
                    loginLogout.Text = "Logout";
                }
                
                loginLogout.NavigateUrl = "~/Logout.aspx";
            }
            else
            {
                registerUsername.Text = "Register";
                registerUsername.NavigateUrl = "~/Register.aspx";
                loginLogout.Text = "Login";
                loginLogout.NavigateUrl = "~/Login.aspx";
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