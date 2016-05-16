using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["product"] != null)
                {
                    Assignment2Entities db = new Assignment2Entities();

                    //Get Product Info
                    string stringProductID = (String)Request["product"];
                    int productID = Int32.Parse(stringProductID);
                    var currentProduct = (from r in db.PRODUCTs where productID == r.ProductId select r).ToList();

                    //Bind Product Info
                    FormView1.DataSource = currentProduct;
                    FormView1.DataBind();
                    FormView2.DataSource = currentProduct;
                    FormView2.DataBind();


                    //Get Review Info
                    var reviews = (from r2 in db.User_Reviews where productID == r2.ProductID select r2).ToList();

                    //Bind Review Info
                    repeater1.DataSource = reviews;
                    repeater1.DataBind();

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();

            //Gets productID of item being added to cart and also determines items price
            String productToAdd = ((Button)sender).CommandArgument;
            int currentProduct = Int32.Parse(productToAdd);
            double itemPrice = (from r in db.PRODUCTs where currentProduct == r.ProductId select r.SalePrice).First();
            String priceString = itemPrice.ToString();

            if (Request.Cookies["cartItem"] != null)//Cookie exists
            {
                //Get Current Cookie
                String currentItems = Request.Cookies["cartItem"].Value;
                String newItemList = currentItems + "," + productToAdd;

                //Remove Old Cookie
                Request.Cookies.Remove("cartItem");

                //Add new cookie
                HttpCookie cartCookie = new HttpCookie("cartItem");
                cartCookie.Value = newItemList;
                Response.Cookies.Add(cartCookie);
            }
            else//Cookie does not exist
            {
                //Item Cookies
                HttpCookie cartCookie = new HttpCookie("cartItem");
                cartCookie.Value = productToAdd;
                Response.Cookies.Add(cartCookie);
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void writeReview(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Assignment2Entities db = new Assignment2Entities();

                //Get all relevant info 
                String currentEmail = (String)Session["email"];
                int userID = (from r in db.Users where r.Email == currentEmail select r.UserID).First();

                int rating = Rating1.CurrentRating;
                string stringProductID = (String)Request["product"];
                int productID = Int32.Parse(stringProductID);

                //Create new review object
                User_Reviews review = new User_Reviews();
                review.Name = name.Text;
                review.Stars = Rating1.CurrentRating;


                string comment = reviewText.Text;
                string[] getAllBadWords = (from r in db.Bad_Words select r.Word).ToArray();
                string output = Filter(comment, getAllBadWords);

                review.UserReview = output;
                review.ProductID = productID;
                review.UserID = userID;
                review.Review_Date = DateTime.Today;

                db.User_Reviews.Add(review);
                db.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                errorLabel.Text = "You must be signed in to leave a review";
            }
        }

        public static string Filter(string input, string[] badWords)
        {
            var re = new Regex(
                @"\b("
                + string.Join("|", badWords.Select(word =>
                    string.Join(@"\s*", word.ToCharArray())))
                + @")\b", RegexOptions.IgnoreCase);
            return re.Replace(input, match =>
            {
                return new string('*', match.Length);
            });
        }

    }
}