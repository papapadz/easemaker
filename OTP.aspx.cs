using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OTP : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["verified"] != null)
        {
            Div1.Visible = true;
            Session.Remove("invalid");
            //ShowPopUpMsg("Account Verified!");
        }
        if (Session["invalid"] != null)
        {
            Div2.Visible = true;
            Session.Remove("invalid");
        }

        if (!IsPostBack)
        {
            insertotp();
        }

    }
    void insertotp()
    {

        Random generator = new Random();
        String r = generator.Next(0, 1000000).ToString("D6");
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO otp (userid, code, date) VALUES (@userid, @code, @date)";
        string SQL = "Insert into ";

        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());

        cmd.Parameters.AddWithValue("@code", r);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        
        cmd.ExecuteNonQuery();
        con.Close();
        //Helper.AddLog("1", "Add", "Added a user record");

        //string message = "<br /> From - Ease Maker <br />" +
        //"<br /><h2>Login Verification</h2> <br />" +
        //"<br />Your verification code:> <br />" +
        //"<br /><h2>"+ r +"</h2> <br />" +
        //"<br />Please do not share this code with anyone<br />" +
        // "<br />This is an automated message, please do not reply. <br />" +
        //"<br />" + Helper.GetURL() + "/VerifyApplicant.aspx?email=" + Session["email"].ToString() + " <br />";
        //Helper.SendEmail(Session["email"].ToString(), "OTP", message);

        //MailMessage message = new MailMessage();
        //message.To.Add(Session["email"].ToString());// Email-ID of Receiver  
        //                              //message.To.Add(FormatMultipleEmailAddresses(""));
        //message.Subject = "OTP";// Subject of Email  
        //message.From = new
        //System.Net.Mail.MailAddress("easemaker8112@outlook.ph");// Email-ID of Sender  

        //message.IsBodyHtml = true;
        //message.AlternateViews.Add(Mail_Body(r));
        //SmtpClient SmtpMail = new SmtpClient();
        //SmtpMail.Host = "smtp-mail.outlook.com";//name or IP-Address of Host used for SMTP transactions  
        //SmtpMail.Port = 587;//Port for sending the mail  
        //SmtpMail.Credentials = new
        //System.Net.NetworkCredential("easemaker8112@outlook.ph", "MakerPass123-");//username/password of network, if apply  
        //SmtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
        //SmtpMail.EnableSsl = true;
        //SmtpMail.ServicePoint.MaxIdleTime = 0;
        //SmtpMail.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);
        //message.BodyEncoding = Encoding.Default;
        //message.Priority = MailPriority.High;
        //SmtpMail.Send(message); //Smtpclient to send the mail message  
        Helper.SendEmail(Session["email"].ToString(), "OTP", Mail_Body(r));
        //Response.Write("Check email for verification");


        //Response.Redirect("Login.aspx");
    }
    private AlternateView Mail_Body(string a)
    {

        string message = "<br /><br />" +
           "<br /><h2>Login Verification</h2> <br />" +
           "<br />Your verification code: <br />" +
           "<br /><h2>" + a + "</h2> <br />" +
           "<br />Please do not share this code with anyone<br />" +
            "<br />This is an automated message, please do not reply. <br />" +
           "<br /> Thank you, <br />" +
           "<br />from - Ease Maker Administrator <br />";

        string path = Server.MapPath(@"img/logo.png");
        LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
        Img.ContentId = "MyImage";


        string str = @"  
            <table>  
              <tr>  
             <td>  
                      <img src=cid:MyImage  id='img' alt=''/>
            <br/> 
            <img src=cid:MyImage2  id='img2' alt=''/> 
            <br/>
            '" + message + @"' 
            <br/>

            </td>
            <br/>
                     
            </tr>  
            <tr>  
                     
            </tr></table>  
            ";
        AlternateView AV =
        AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
        AV.LinkedResources.Add(Img);
        return AV;
    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT top 1 * FROM otp " +
            "WHERE userid=@userid AND code=@code order by otpid desc"; //+
        //"AND TypeID!=5";
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@code", txtCode.Text);

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {

            //while (dr.Read())
            //{

            //    Session["userid"] = dr["UserID"].ToString();
            //    Session["usertype"] = dr["usertype"].ToString();
            //    Session["personname"] = dr["personname"].ToString();

            //}
            error.Visible = false;
            con.Close();

            if ((string)Session["usertype"] == "Admin")
            {

                if (Request.QueryString["url"] == null)
                    Response.Redirect("DefaultAdmin.aspx");
                else
                    Response.Redirect(Request.QueryString["url"].ToString());
            }
            else if ((string)Session["usertype"] == "Employer")
            {

                if (Request.QueryString["url"] == null)
                    Response.Redirect("DefaultEmployer.aspx");
                else
                    Response.Redirect(Request.QueryString["url"].ToString());
            }
            else if ((string)Session["usertype"] == "User")
            {
                if (Request.QueryString["url"] == null)
                    Response.Redirect("Default2.aspx");
                else
                    Response.Redirect(Request.QueryString["url"].ToString());

            }


        }
        else
        {

            con.Close();

            error.Visible = true;

            //Session["invalid"] = "yes";
            //Response.Redirect("Login.aspx");
        }
    }
}