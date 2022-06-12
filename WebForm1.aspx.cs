using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocShare
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["file"] != null)
            {

                string file = Request.QueryString["file"];
                DecryptFile_Click(file);    
            }
        }


        private void DecryptFile_Click(string filePath)
        {
            //Get the Input File Name and Extension
            string fileName = filePath;

            //Build the File Path for the original (input) and the decrypted (output) file
            string input = Server.MapPath("~/Docs/") + fileName;
            //string output = Server.MapPath("~/Files/") + fileName;

            //Save the Input File, Decrypt it and save the decrypted file in output path.
            //FileUpload1.SaveAs(input);


            //Download the Decrypted File.
            Response.Clear();
            Response.ContentType = "image/jpeg";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(input));
            Response.WriteFile(input);
            Response.Flush();
            Response.End();
        }
    }
}