using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DocShare
{
    public partial class dashboard : System.Web.UI.Page
    {
        Dbconnection db = new Dbconnection();
        DataSet ds;
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
                FolderCount();
                FilesCount();
                QrCount();
                TotalScan();
                table_data();
            }
        }

        private void FolderCount()
        {
            string Sql = "select COUNT(*) as totalFolders from folder_group where usercode = '" + Session["usercode"].ToString() + "'";

            ds = db.ExecuteDataSet(Sql);

            if (ds.Tables[0] != null)
            {
                datalist1.DataSource = ds.Tables[0];
                datalist1.DataBind();
            }
        }

        private void FilesCount()
        {
            string Sql = "select COUNT(*) as totalFiles from file_details where usercode = '" + Session["usercode"].ToString() + "'";

            ds = db.ExecuteDataSet(Sql);

            if (ds.Tables[0] != null)
            {
                datalist2.DataSource = ds.Tables[0];
                datalist2.DataBind();
            }
        }

        private void QrCount()
        {
            string Sql = "select Count(QrCode) as totalQr from folder_group where usercode = '" + Session["usercode"].ToString() + "'";

            ds = db.ExecuteDataSet(Sql);

            if (ds.Tables[0] != null)
            {
                datalist3.DataSource = ds.Tables[0];
                datalist3.DataBind();
            }
        }

        private void TotalScan()
        {
            string Sql = "select Count(qr_code_number) as totalScan from tbl_Otp_Number where usercode = '" + Session["usercode"].ToString() + "'";

            ds = db.ExecuteDataSet(Sql);

            if (ds.Tables[0] != null)
            {
                datalist4.DataSource = ds.Tables[0];
                datalist4.DataBind();
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void LogOut()
        {
            dashboard dash = new dashboard();
            dash.logout();
        }

        private void logout()
        {
            Session.Clear();
            Session.Abandon();
        }

        private void table_data()
        {
            DataSet ds;
            ds = db.ExecuteDataSet("select * from folder_group where usercode='" + Session["usercode"].ToString() + "'");
            if (ds.Tables[0] != null)
            {
                table_datalist.DataSource = ds.Tables[0];
                table_datalist.DataBind();
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void Deleteid(string folderid)
        {

            Dbconnection dbconnection = new Dbconnection();
            string query = "delete from folder_group where id='" + folderid + "'";
            int result = dbconnection.executeQuery(query);
            if (result > 0)
            {
                dashboard d = new dashboard();
                d.table_data();
            }
        }
    }
}