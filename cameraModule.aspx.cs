using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace DocShare
{
    public partial class cameraModule : System.Web.UI.Page
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
        }

        //public static void send_email()
        //{
        //    string to = "dkt2098@gmail.com"; //To address    
        //    string from = "prajapatipradeep1101@gmail.com"; //From address    
        //    MailMessage message = new MailMessage(from, to);

        //    Random random = new Random();
        //    int OTP = random.Next(0000, 9999);

        //    string OTPNumber = OTP.ToString();

        //    string mailbody = "Your OTP is : " + OTPNumber;
        //    message.Subject = "OTP for QR";
        //    message.Body = mailbody;
        //    message.BodyEncoding = Encoding.UTF8;
        //    message.IsBodyHtml = true;
        //    SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
        //    System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential()
        //    {
        //        UserName = "prajapatipradeep1101@gmail.com",
        //        Password = "28551101"
        //    };
        //    client.EnableSsl = true;
        //    try
        //    {
        //        string sendEmail = ConfigurationManager.AppSettings["SendEmail"].ToString();
        //        if (sendEmail.ToLower() == "true")
        //        {
        //            client.Send(message);
        //        }
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static bool send_email(string OTPNumber)
        {

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("demotestzx07@gmail.com", "Demo@123");
            smtp.EnableSsl = true;
           /* Random random = new Random();
            int OTP = random.Next(0000, 9999);

            string OTPNumber = OTP.ToString();
            HttpContext.Current.Session["OTP"] = OTP; */

            MailMessage msg = new MailMessage();
            msg.Subject = "OTP for QR";
            msg.Body = "Your OTP is : " + OTPNumber;
            //string toaddress = "sandhyabhardwj369@gmail.com";
            string toaddress = HttpContext.Current.Session["email"].ToString();
            msg.To.Add(toaddress);
            string fromaddress = "DocShare System <demotestzx07@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
                return true;
            }
            catch
            {
                throw;
            }





            /* SmtpClient smtp = new SmtpClient();
             smtp.Host = "smtp.gmail.com";
             smtp.Port = 587;
             smtp.Credentials = new System.Net.NetworkCredential("demotestzx07@gmail.com", "Demo@123");
             smtp.EnableSsl = true;
             Random random = new Random();
             int OTP = random.Next(0000, 9999);

             string OTPNumber = OTP.ToString();
             HttpContext.Current.Session["OTP"] = OTP;
             MailMessage msg = new MailMessage();
             msg.Subject = "OTP for QR";
             msg.Body = "Your OTP is : " + OTPNumber;
             string toaddress = "kahirve3@gmail.com";
             msg.To.Add(toaddress);
             string fromaddress = "DocShare System <demotestzx07@gmail.com>";
             msg.From = new MailAddress(fromaddress);
             try
             {
                 smtp.Send(msg);
                 return true;
             }
             catch
             {
                 throw;
             }  */


        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string generateOtp(string id)
        {

            Random random = new Random();
            int OTP = random.Next(0000, 9999);

            string OTPNumber = OTP.ToString();
            //HttpContext.Current.Session["OTP"] = OTP;

            send_email(OTPNumber);

            Dbconnection db = new Dbconnection();

            HttpContext.Current.Session["current_qr_id"] = id;

           // String OTP = (string)HttpContext.Current.Session["OTP"];

            string Query = "Insert into tbl_Otp_Number values('" + OTP + "', '" + id + "','" + HttpContext.Current.Session["usercode"].ToString() + "')";

            int result = db.executeQuery(Query);

            return OTP.ToString();
        }

        private bool CheckOtp(string otpNum)
        {
            if (otpNum == null)
            {
                return false;
            }
            else
            {
                DataSet ds;
                Dbconnection db = new Dbconnection();

                string Query = "select otp_number from tbl_Otp_Number where otp_number = '" + otpNum + "'";

                ds = db.ExecuteDataSet(Query);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string dbOtpNum = (string)ds.Tables[0].Rows[0]["otp_number"];

                    if (otpNum.Equals(dbOtpNum))
                    {
                        Response.Redirect("ScanedQrList.aspx");
                    }
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        protected void verify_Click(object sender, EventArgs e)
        {
            string Num = otp.Text.Trim();

            if (Num.Length > 0)
            {
                CheckOtp(Num);
            }
        }
    }
}