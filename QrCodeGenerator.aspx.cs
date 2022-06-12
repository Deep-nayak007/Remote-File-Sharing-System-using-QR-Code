using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DocShare
{
    public partial class QrCodeGenerator : System.Web.UI.Page
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
                getQrFilePath(Session["f_id"].ToString());
            }
        }

        private void getQrFilePath(string id)
        {
            DataSet ds;

            Dbconnection db = new Dbconnection();

            string Query = "select QrCode_img as QrPath from folder_group where usercode = '" + HttpContext.Current.Session["usercode"] + "' and id = '" + id + "'";

            ds = db.ExecuteDataSet(Query);

            if (ds.Tables[0].Rows.Count > 0)
            {
                qrIdDataList.DataSource = ds.Tables[0];
                qrIdDataList.DataBind();
            }
        }
    }
}