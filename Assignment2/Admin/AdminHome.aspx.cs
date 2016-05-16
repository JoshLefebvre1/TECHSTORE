using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();

            allWords2.DataSource = db.CATEGORies.ToList();
            allWords2.DataBind();

            allWords3.DataSource = db.PRODUCTs.ToList();
            allWords3.DataBind();
        }



        protected void EditDeleteCategory(object sender, GridViewCommandEventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            int currentRowIndex = (Int32.Parse(e.CommandArgument.ToString()));
            int rowID = (Int32.Parse(allWords2.DataKeys[currentRowIndex].Value.ToString()));


            if (e.CommandName == "deleteCategory")
            {
                //Get Category ID
                var categoryToDelete = (from row in db.CATEGORies where row.CategoryId == rowID select row).FirstOrDefault();
                int dCategoryID = categoryToDelete.CategoryId;

                //Get all products for category
                var productsToDelete = (from row in db.PRODUCTs where row.CategoryId == dCategoryID select row).ToList();


                //Delete all products in category
                foreach (var p in productsToDelete)
                {
                    db.PRODUCTs.Remove(p);
                }

                //Delete categorie
                db.CATEGORies.Remove(categoryToDelete);
                db.SaveChanges();

                allWords2.DataSource = db.CATEGORies.ToList();
                allWords2.DataBind();

                Response.Redirect("AdminHome.aspx");
            }
            else if (e.CommandName == "editCategory")
            {
                var categoryToEdit = (from row in db.CATEGORies where row.CategoryId == rowID select row).FirstOrDefault();
                Response.Redirect("EditCategory.aspx?id=" + categoryToEdit.CategoryId);
            }
        }

        protected void EditDeleteProduct(object sender, GridViewCommandEventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            int currentRowIndex = (Int32.Parse(e.CommandArgument.ToString()));
            String word = allWords3.DataKeys[currentRowIndex].Value.ToString();

            int rowID = Int32.Parse(word);


            if (e.CommandName == "deleteProduct")
            {
                //Get Category ID
                var productToDelete = (from row in db.PRODUCTs where row.ProductId == rowID select row).FirstOrDefault();

                //Delete categorie
                db.PRODUCTs.Remove(productToDelete);
                db.SaveChanges();

                allWords2.DataSource = db.PRODUCTs.ToList();
                allWords2.DataBind();

                Response.Redirect("AdminHome.aspx");
            }
            else if (e.CommandName == "editProduct")
            {
                var productToEdit = (from row in db.PRODUCTs where row.ProductId == rowID select row).FirstOrDefault();
                Response.Redirect("EditProduct.aspx?id=" + productToEdit.ProductId);
            }
        }
    }
}