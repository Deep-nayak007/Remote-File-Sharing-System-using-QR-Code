using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DocShare
{
    public partial class register : System.Web.UI.Page
    {
        Dbconnection db = new Dbconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            failmessage_box.Visible = false;
        }

        protected bool checkauth(string email)
        {
            if (email != null)
            {
                DataSet ds = new DataSet();
                ds = db.ExecuteDataSet("Select * from user_detail where email='" + email + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            string name = textname.Text;
            string email = txtemail.Text;
            string pass = txtpassword.Text;
            string conpass = txtconpassword.Text;
            string mobile = txtmobile.Text;
            if (name.Length > 0 && email.Length > 0 && pass.Length > 0 && conpass.Length > 0)
            {
                if (pass == conpass)
                {
                    if (checkauth(email))
                    {
                        Random r = new Random();
                        int newUser = r.Next(11111, 99999);
                        int result = db.executeQuery("insert into user_detail (email,pass,usercode,name,mobile) values ('" + email + "','" + pass + "','" + newUser + "','" + name + "','" + mobile + "')");
                        if (result > 0)
                        {
                            Response.Redirect("login.aspx");
                        }
                        else
                        {
                            failmessage_box.Visible = true;
                            Fmessage.InnerText = "Failed to Register !";
                        }
                    }
                    else
                    {
                        failmessage_box.Visible = true;
                        Fmessage.InnerText = "User with same email is already existed !";
                    }
                }
                else
                {
                    failmessage_box.Visible = true;
                    Fmessage.InnerText = "Password and Confirm Password Should be same !";
                }
            }
            else
            {
                failmessage_box.Visible = true;
                Fmessage.InnerText = "Please filled the data";
            }
        }

    }
}