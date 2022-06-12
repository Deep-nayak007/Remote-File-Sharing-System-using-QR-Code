using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using ZXing;
using System.Drawing.Imaging;
using System.Drawing;
using System.Data;

namespace DocShare
{
    public partial class folder_group : System.Web.UI.Page
    {
        Dbconnection dbconnection = new Dbconnection();
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
                bindDataListControl();
            }
        }

        private void bindDataListControl()
        {
            DataSet ds = new DataSet();
            ds = dbconnection.ExecuteDataSet("select * from folder_group where usercode = '" + Session["usercode"].ToString() + "'");

            datalist1.DataSource = ds.Tables[0];
            datalist1.DataBind();
        }

        private void CreateFolder(string Name)
        {
            string sql = "insert into folder_group(usercode,Name,Descr,created_on,updated_on) values('" + Session["usercode"].ToString() + "','" + Name + "','" + Name + "','" + DateTime.Now.ToShortDateString() + "','" + DateTime.Now.ToShortDateString() + "')";
            int result = dbconnection.executeQuery(sql);
            if (result > 0)
            {
                bindDataListControl();
            }
            text.Text = string.Empty;

        }

        protected void save_Click(object sender, EventArgs e)
        {
            string folderName = text.Text.Trim();
            if (folderName.Length > 0)
            {
                CreateFolder(folderName);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Folder Name couldn't be created.')", true);
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void DeleteById(string folderid)
        {
            Dbconnection dbconnection = new Dbconnection();

            string query = "delete from folder_group where id='" + folderid + "'";

            int result = dbconnection.executeQuery(query);

            if (result > 0)
            {
                folder_group fg = new folder_group();
                fg.bindDataListControl();
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void makeQr(string folderId)
        {
            QrCodeGenerator qrcode = new QrCodeGenerator();
            Random r = new Random();
            int fileName = r.Next(10000, 20000);

            var writer = new BarcodeWriter();
            writer.Format = BarcodeFormat.QR_CODE;
            var result = writer.Write(folderId);
            string path = HttpContext.Current.Server.MapPath("~/images/" + folderId + ".jpg");

            var barcodeBitmap = new Bitmap(result);
            using (MemoryStream memory = new MemoryStream())
            {
                using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.ReadWrite))
                {
                    barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                    byte[] bytes = memory.ToArray();
                    fs.Write(bytes, 0, bytes.Length);
                }
            }

            HttpContext.Current.Session["f_id"] = folderId;

            Dbconnection db = new Dbconnection();

            string query = "update folder_group set QrCode = '" + folderId + "', QrCode_img = '~/images/" + folderId + ".jpg' where usercode = '" + HttpContext.Current.Session["usercode"] + "' and id = '" + folderId + "'";

            int finalResult = db.executeQuery(query);
        }
    }
}