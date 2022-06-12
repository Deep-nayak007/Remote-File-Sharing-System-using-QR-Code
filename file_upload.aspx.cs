using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Security.Cryptography;

namespace DocShare
{
    public partial class file_upload : System.Web.UI.Page
    {
        Dbconnection db = new Dbconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usercode"] != null)
            {

            }
            else
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                bindView();
            }
        }

        private void bindView()
        {
            String query = "select * from file_details as f join folder_group as fd on f.folderid = fd.id where f.folderid= '" + Request.QueryString["folderid"].ToString() + "' and  fd.usercode = '" + Session["usercode"].ToString() + "'";
            DataSet ds = new DataSet();
            ds = db.ExecuteDataSet(query);

            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        private static void RemoveById(string id)
        {
            file_upload fu = new file_upload();
            Dbconnection dbconnection = new Dbconnection();
            string sql = "delete from file_details where id = " + id + "";
            int result = dbconnection.executeQuery(sql);
            if (result > 0)
            {
                fu.bindView();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
            {
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(postedFile.FileName);

                string input = Server.MapPath("~/Docs/") + fileName;
                //string output = Server.MapPath("~/Docs/") + fileName + "_Encrypted";

                postedFile.SaveAs(Server.MapPath("~/Docs/") + fileName);

                //this.Encrypt(input, output);

                DateTime dt = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                string month = dt.Month.ToString() + "/" + dt.Year.ToString();
                string date = dt.Day.ToString() + "/" + dt.Month.ToString() + "/" + dt.Year.ToString();

                Dbconnection db = new Dbconnection();

                string folder_id = Request.QueryString["folderid"];

                string Query = "insert into file_details(imgname,imgpath,usercode,date1,month1,folderid) values('" + fileName + "','" + fileName + "','" + Session["usercode"].ToString() + "','" + date + "','" + month + "','" + folder_id + "')";

                db.executeQuery(Query);

            }
            lblSuccess.Text = string.Format("{0} files have been uploaded successfully.", FileUpload1.PostedFiles.Count);
            bindView();
        }

        //private void Encrypt(string inputFilePath, string outputfilePath)
        //{
        //    string EncryptionKey = "CODINGVILA";
        //    using (Aes encryptor = Aes.Create())
        //    {
        //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        //        encryptor.Key = pdb.GetBytes(32);
        //        encryptor.IV = pdb.GetBytes(16);
        //        using (FileStream fsOutput = new FileStream(outputfilePath, FileMode.Create))
        //        {
        //            using (CryptoStream cs = new CryptoStream(fsOutput, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
        //            {
        //                using (FileStream fsInput = new FileStream(inputFilePath, FileMode.Open))
        //                {
        //                    int data;
        //                    while ((data = fsInput.ReadByte()) != -1)
        //                    {
        //                        cs.WriteByte((byte)data);
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}

        //[System.Web.Services.WebMethod(EnableSession = true)]
        //public static void DownloadF(string path)
        //{
        //    file_upload fu = new file_upload();
        //    fu.DecryptFile_Click(path);
        //}

        //private void DecryptFile_Click(string filePath)
        //{
        //    //Get the Input File Name and Extension
        //    string fileName = filePath;

        //    //Build the File Path for the original (input) and the decrypted (output) file
        //    string input = Server.MapPath("~/Docs/") + fileName;
        //    string output = Server.MapPath("~/Files/") + fileName;

        //    //Save the Input File, Decrypt it and save the decrypted file in output path.
        //    //FileUpload1.SaveAs(input);
        //    this.Decrypt(input, output);

        //    //Download the Decrypted File.
        //    Response.Clear();
        //    Response.ContentType = FileUpload1.PostedFile.ContentType;
        //    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(output));
        //    Response.WriteFile(output);
        //    Response.Flush();
        //    Response.End();
        //}

        //private void Decrypt(string inputFilePath, string outputfilePath)
        //{
        //    string EncryptionKey = "CODINGVILA";
        //    using (Aes encryptor = Aes.Create())
        //    {
        //        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        //        encryptor.Key = pdb.GetBytes(32);
        //        encryptor.IV = pdb.GetBytes(16);
        //        using (FileStream fsInput = new FileStream(inputFilePath, FileMode.Open))
        //        {
        //            using (CryptoStream cs = new CryptoStream(fsInput, encryptor.CreateDecryptor(), CryptoStreamMode.Read))
        //            {
        //                using (FileStream fsOutput = new FileStream(outputfilePath, FileMode.Create))
        //                {
        //                    int data;
        //                    while ((data = cs.ReadByte()) != -1)
        //                    {
        //                        fsOutput.WriteByte((byte)data);
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}
    }
}
