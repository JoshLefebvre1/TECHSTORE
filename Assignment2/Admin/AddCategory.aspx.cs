using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            allWords.DataSource = db.CATEGORies.ToList();
            allWords.DataBind();
        }

        protected void addWord(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Assignment2Entities db = new Assignment2Entities();

                bool wordExist = (from r in db.CATEGORies where r.Name == BlockedWord.Text select r).Any();

                if (wordExist)
                {
                    ErrorLabel.Text = "Word already Exists";
                }
                else
                {
                    CATEGORY newWord = new CATEGORY();
                    newWord.Name = BlockedWord.Text;


                    db.CATEGORies.Add(newWord);
                    db.SaveChanges();
                    Response.Redirect("AddCategory.aspx");
                }
            }
        }




    }
}