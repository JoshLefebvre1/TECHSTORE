using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["id"] != null)
                {
                    Assignment2Entities db = new Assignment2Entities();
                    string stringCategoryId = (String)Request["id"];
                    int intCategoryID = Int32.Parse(stringCategoryId);
                    var currentCategory = (from r in db.CATEGORies where r.CategoryId == intCategoryID select r).First();
                    NameEdit.Text = currentCategory.Name;
                }
            }
        }
        protected void editCategory(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            string stringCategoryId = (String)Request["id"];
            int intCategoryID = Int32.Parse(stringCategoryId);
            var currentCategory = (from r in db.CATEGORies where r.CategoryId == intCategoryID select r).First();
            currentCategory.Name = NameEdit.Text;
            db.SaveChanges();
            Response.Redirect("Admin/AdminHome.aspx");
        }
    }
}