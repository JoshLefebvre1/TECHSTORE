using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Assignment2
{
    /// <summary>
    /// Summary description for GetFileHandler
    /// </summary>
    public class GetFileHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int productId = Convert.ToInt32(context.Request["productid"]);

            Assignment2Entities db = new Assignment2Entities();
            var product = db.PRODUCTs.Where(f => f.ProductId == productId).FirstOrDefault();

            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the blob client.
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            // Retrieve a reference to a container. 
            CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

            // Create the container if it doesn't already exist.
            container.CreateIfNotExists();

            // Retrieve reference to a blob named from the given file
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(product.ImageName);

            // save the blob data into a readable stream
            System.IO.Stream fileStream = new MemoryStream();
            blockBlob.DownloadToStream(fileStream);

            // return to the beginning of the stream
            fileStream.Seek(0, SeekOrigin.Begin);

            // move the data into a byte array
            byte[] buffer = new byte[fileStream.Length];
            fileStream.Read(buffer, 0, (int)fileStream.Length);

            // close the stream
            if (fileStream != null)
                fileStream.Close();

            context.Response.Clear();
            //context.Response.ContentType = file.ContentType;
            context.Response.BinaryWrite(buffer);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}