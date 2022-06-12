using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DocShare
{
    public partial class ScanedQrList : System.Web.UI.Page
    {
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
                GetDataFromQr(Session["current_qr_id"].ToString());
            }
        }

        private void GetDataFromQr(string id)
        {
            DataSet ds;
            Dbconnection db = new Dbconnection();

            string Query = "select * from folder_group where id = '" + id + "'";

            // string Query = "select * from folder_group where id = '" + id + "' and usercode = '" + HttpContext.Current.Session["usercode"].ToString() + "'";

            ds = db.ExecuteDataSet(Query);

            if (ds.Tables[0].Rows.Count > 0)
            {
                scanedQrDataList.DataSource = ds.Tables[0];
                scanedQrDataList.DataBind();
            }
        }
    }
}