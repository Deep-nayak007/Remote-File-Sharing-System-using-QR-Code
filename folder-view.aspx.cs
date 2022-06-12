using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace DocShare
{
    public partial class folder_view : System.Web.UI.Page
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

        public void bindView()
        {
            //String query = "select * from file_details as f join folder_group as fd on f.folderid = fd.id where f.folderid= '" + Request.QueryString["folderid"].ToString() + "' and  fd.usercode = '" + Session["usercode"].ToString() + "'";
            String query = "select * from file_details as f join folder_group as fd on f.folderid = fd.id where f.folderid= '" + Request.QueryString["folderid"].ToString() + "'";
            DataSet ds = new DataSet();
            ds = db.ExecuteDataSet(query);

            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
            
        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void DownloadF(string path)
        {
           
          new folder_view().DecryptFile_Click(path);
         
        }

        private void DecryptFile_Click(string filePath)
        {
            Response.Redirect("WebForm1.aspx?file" + filePath);

            ////Get the Input File Name and Extension
            //string fileName = filePath;

            ////Build the File Path for the original (input) and the decrypted (output) file
            //string input = Server.MapPath("~/Docs/") + fileName;
            ////string output = Server.MapPath("~/Files/") + fileName;

            ////Save the Input File, Decrypt it and save the decrypted file in output path.
            ////FileUpload1.SaveAs(input);
            

            ////Download the Decrypted File.
            //Response.Clear();
            //Response.ContentType = "image/jpeg";
            //Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(input));
            //Response.WriteFile(input);
            //Response.Flush();
            //Response.End();
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void Remove(string id)
        {
            folder_view fv = new folder_view();
            Dbconnection dbconnection = new Dbconnection();

            string sql = "delete from file_details where id = " + id + "";

            int result = dbconnection.executeQuery(sql);

            if (result > 0)
            {
                fv.bindView();
            }
        }
    }
}