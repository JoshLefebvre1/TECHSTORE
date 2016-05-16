using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["id"] != null)
                {
                    Assignment2Entities db = new Assignment2Entities();
                    string stringProductId = (String)Request["id"];
                    int intProductID = Int32.Parse(stringProductId);
                    var currentProduct = (from r in db.PRODUCTs where r.ProductId == intProductID select r).First();

                    pName.Text = currentProduct.Name;
                    pCategory.SelectedValue = currentProduct.CategoryId.ToString();
                    sDescription.Text = currentProduct.ShortDescription;
                    lDescription.Text = currentProduct.LongDescription;
                    pPrice.Text = currentProduct.Price.ToString();
                    pSalePrice.Text = currentProduct.SalePrice.ToString();
                    if (currentProduct.IsOnSale == true)
                    {
                        CheckBox1.Checked =true;
                    }
                    else
                    {
                        CheckBox1.Checked = false;
                    }
                    pCategory.DataSource = db.CATEGORies.ToList();
                    pCategory.DataTextField = "Name";
                    pCategory.DataValueField = "CategoryId";
                    pCategory.DataBind();
                }
            }
        }
        protected void eProduct(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            string stringProductId = (String)Request["id"];
            int intproductID = Int32.Parse(stringProductId);
            var currentproduct = (from r in db.PRODUCTs where r.ProductId == intproductID select r).First();

            currentproduct.Name = pName.Text;
            currentproduct.CategoryId= Int32.Parse(pCategory.SelectedValue);
            currentproduct.ShortDescription=sDescription.Text;
            currentproduct.LongDescription=lDescription.Text;
            currentproduct.Price=Double.Parse(pPrice.Text);
            currentproduct.SalePrice= Double.Parse(pSalePrice.Text);
            if (CheckBox1.Checked == true)
            {
                currentproduct.IsOnSale = true;
            }
            else
            {
                currentproduct.IsOnSale = false;
            }

            if (pUpload.HasFile)
            {
                try
                {
                    // Retrieve storage account from connection string.
                    CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));

                    // Create the blob client.
                    CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

                    // Retrieve a reference to a container. 
                    CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

                    // Create the container if it doesn't already exist.
                    container.CreateIfNotExists();

                    // Retrieve reference to a blob named from the given file
                    CloudBlockBlob blockBlob = container.GetBlockBlobReference(Path.GetFileName(pUpload.PostedFile.FileName));

                    if (blockBlob.Exists())
                        blockBlob.Delete();

                    // Create the blob
                    using (MemoryStream memoryStream = new MemoryStream(pUpload.FileBytes))
                    {
                        blockBlob.UploadFromStream(memoryStream);
                    }

                    // now the file is in the cloud make a note of that in our database so we can pull it later

                    currentproduct.ImageName = Path.GetFileName(pUpload.PostedFile.FileName);

                }
                catch (Exception ex)
                {

                }
            }

            db.SaveChanges();
            Response.Redirect("~/Admin/AdminHome.aspx");
        }
    }
}