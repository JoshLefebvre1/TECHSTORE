using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class CategoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["category"] != null)
                {
                    Assignment2Entities db = new Assignment2Entities();
                    string categoryName = (String)Request["category"];
                    categoryName.Replace("% 20", "/s");
                    lCategoryName.Text = categoryName;
                    var categoryId= (from r in db.CATEGORies where categoryName == r.Name select r.CategoryId).ToList();

                    foreach (var c in categoryId)
                    {

                        var categoryProducts = (from r in db.PRODUCTs where c == r.CategoryId select r).ToList();

                        ProductsListView.DataSource = categoryProducts;
                        ProductsListView.DataBind();
                    }


                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

    }
}