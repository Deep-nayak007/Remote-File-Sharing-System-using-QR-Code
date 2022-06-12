using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DocShare
{
    public partial class History : System.Web.UI.Page
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
                FileHistoryLogs();
            }
        }

        private void FileHistoryLogs()
        {
            string query = "select Id as ID, imgname as fileName,imgpath as filePath,date1 as createdOn,folderid as FolderId from file_details where usercode = '" + Session["usercode"].ToString() + "'";

            DataSet ds;
            ds = db.ExecuteDataSet(query);

            if (ds.Tables[0].Rows.Count > 0)
            {
                fileSharedLogs.DataSource = ds.Tables[0];
                fileSharedLogs.DataBind();
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void Delete(string id, string folderid)
        {
            History history = new History();
            Dbconnection db = new Dbconnection();
            string query = "delete from file_details where Id = '" + id + "' and folderid = '" + folderid + "' and usercode = '" + HttpContext.Current.Session["usercode"].ToString() + "'";

            int result = db.executeQuery(query);

            if(result > 0)
            {
                history.FileHistoryLogs();
            }
        }
    }
}