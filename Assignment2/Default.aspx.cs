using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            var saleProducts = (from r in db.PRODUCTs where r.IsOnSale == true select r).ToList();

            ProductsSaleView.DataSource = saleProducts;
            ProductsSaleView.DataBind();
        }
    }
}