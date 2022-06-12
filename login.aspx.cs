using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

namespace DocShare
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string check_login(string name, string pass)
        {


            Dbconnection db = new Dbconnection();
            String message = "no";
            DataSet ds = new DataSet();
            ds = db.ExecuteDataSet("Select * from dbo.user_detail where email = '" + name + "' and pass='" + pass + "'");

            if (ds.Tables[0].Rows.Count > 0)
            {
                String uname = ds.Tables[0].Rows[0]["name"].ToString();
                String dbname = ds.Tables[0].Rows[0]["email"].ToString();
                String dbpass = ds.Tables[0].Rows[0]["pass"].ToString();
                String usercode = ds.Tables[0].Rows[0]["usercode"].ToString();


                if (name.Equals(dbname) && pass.Equals(dbpass))
                {
                    message = "yes";
                    HttpContext.Current.Session["usercode"] = usercode;
                    HttpContext.Current.Session["name"] = uname;
                    HttpContext.Current.Session["email"] = dbname;
                }
                else
                {
                    message = "no";
                }
            }
            return message;
            //return "Hello " + name  + Environment.NewLine + "The Current Time is: "  + DateTime.Now.ToString();
        }
    }
}