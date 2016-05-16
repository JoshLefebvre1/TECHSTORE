using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class BadWords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            allWords.DataSource = db.Bad_Words.ToList();
            allWords.DataBind();
        }

        protected void addWord(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Assignment2Entities db = new Assignment2Entities();

                bool wordExist = (from r in db.Bad_Words where r.Word == BlockedWord.Text select r).Any();

                if (wordExist)
                {
                    ErrorLabel.Text = "Word already Exists";
                }
                else
                {
                    Bad_Words newWord = new Bad_Words();
                    newWord.Word = BlockedWord.Text;


                    db.Bad_Words.Add(newWord);
                    db.SaveChanges();
                    Response.Redirect("BadWords.aspx");
                }
            }
        }

        protected void DeleteRow(object sender, GridViewCommandEventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            int currentRowIndex = (Int32.Parse(e.CommandArgument.ToString()));
            int rowID = (Int32.Parse(allWords.DataKeys[currentRowIndex].Value.ToString()));

            var rowToDelete = (from row in db.Bad_Words where row.WordID == rowID select row).FirstOrDefault();

            db.Bad_Words.Remove(rowToDelete);
            db.SaveChanges();

            allWords.DataSource = db.Bad_Words.ToList();
            allWords.DataBind();
        }
    }
}