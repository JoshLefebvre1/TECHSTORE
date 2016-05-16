using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Collections.Specialized;
using Microsoft.Azure;
using System.Diagnostics;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;

namespace Assignment2
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Assignment2Entities db = new Assignment2Entities();
            pCategory.DataSource = db.CATEGORies.ToList();
            pCategory.DataTextField = "Name";
            pCategory.DataValueField = "CategoryId";
            pCategory.DataBind();
        }

        protected void addProduct(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Assignment2Entities db = new Assignment2Entities();

                PRODUCT newProduct = new PRODUCT();

                int categoryValue = Int32.Parse(pCategory.SelectedValue);
                float decimalPrice = float.Parse(pPrice.Text);
                float decimalSalePrice = float.Parse(pSalePrice.Text);

                newProduct.CategoryId = categoryValue;
                newProduct.Name = pName.Text;
                newProduct.ShortDescription = sDescription.Text;
                newProduct.LongDescription = lDescription.Text;
                newProduct.Price = decimalPrice;
                newProduct.SalePrice = decimalSalePrice;

                if (CheckBox1.Checked == true)
                {
                    newProduct.IsOnSale = true;
                }
                else
                {
                    newProduct.IsOnSale = false;
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

                        newProduct.ImageName = Path.GetFileName(pUpload.PostedFile.FileName);

                    }
                    catch (Exception ex)
                    {

                    }
                }



                db.PRODUCTs.Add(newProduct);
                db.SaveChanges();
                Response.Redirect("AdminHome.aspx");
            }

        }
    }
}