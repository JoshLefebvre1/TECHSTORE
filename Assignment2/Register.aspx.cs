using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createUser(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Assignment2Entities db = new Assignment2Entities();
                var emailExists = (from row in db.Users where row.Email == email1.Text select row).FirstOrDefault();

                if (emailExists == null)
                {

                    User newUser = new User();
                    newUser.Email = email1.Text;
                    newUser.Password = password1.Text;
                    db.Users.Add(newUser);
                    db.SaveChanges();

                    Session["email"] = email1.Text;
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    errorLabel.Text = "This email already exists, unable to create account";
                }



            }

        }
    }
}