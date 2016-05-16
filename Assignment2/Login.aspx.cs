using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void loginSubmit(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Assignment2Entities db = new Assignment2Entities();

                string emailAddress = inputEmail1.Text;

                var usernameExists = (from row in db.Users where row.Email == emailAddress select row).FirstOrDefault();

                if (usernameExists != null)
                {
                    string password = inputPassword1.Text;
                    var passwordMatch = (from row in db.Users where (row.Email == emailAddress) && row.Password == password select row).FirstOrDefault();

                    if (passwordMatch != null)
                    {
                        Session["email"] = inputEmail1.Text;
                        int isAdmin = (from row in db.Users where row.Email == emailAddress select row.IsAdmin).First();

                        if (isAdmin == 1)
                        {
                            Session["admin"] = inputEmail1.Text;
                            Response.Redirect("~/Admin/AdminHome.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/Default.aspx");
                        }

                    }
                    else
                    {
                        errorLabel.Text = "Incorrect Password";
                    }

                }
                else
                {
                    errorLabel.Text = "User does not exist";
                }
            }
        }
    }
}