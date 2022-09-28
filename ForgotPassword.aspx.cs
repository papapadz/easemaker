using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetUserTypes();
        }

    }
    void GetUserTypes()
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "SELECT TypeID, UserType FROM Types where TypeId = '3'";
        //SqlDataReader dr = cmd.ExecuteReader();
        //ddlTypes.DataSource = dr;
        //ddlTypes.DataTextField = "UserType";
        //ddlTypes.DataValueField = "TypeID";
        //ddlTypes.DataBind();
        //con.Close();
    }

    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {


        //duplicate email
        con.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "SELECT * FROM Users " +
            "WHERE Email =@Email";
        cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
        SqlDataReader dr = cmd2.ExecuteReader();

        if (dr.HasRows)
        {

            con.Close();

        }
        else
        {
            ShowPopUpMsg("User Email Does not exist!");
            txtEmail.Text = "";
            txtEmail.Focus();
            con.Close();

            return;
        }




        MailMessage message = new MailMessage();
        message.To.Add(txtEmail.Text);// Email-ID of Receiver  
                                      //message.To.Add(FormatMultipleEmailAddresses(""));
        message.Subject = "Forgot Password";// Subject of Email  
        message.From = new
        System.Net.Mail.MailAddress("easemaker811@outlook.com");// Email-ID of Sender  

        message.IsBodyHtml = true;
        message.AlternateViews.Add(Mail_Body());
        SmtpClient SmtpMail = new SmtpClient();
        SmtpMail.Host = "smtp-mail.outlook.com";//name or IP-Address of Host used for SMTP transactions  
        SmtpMail.Port = 587;//Port for sending the mail  
        SmtpMail.Credentials = new
        System.Net.NetworkCredential("easemaker811@outlook.com", "MakerPass123-");//username/password of network, if apply  
        SmtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
        SmtpMail.EnableSsl = true;
        SmtpMail.ServicePoint.MaxIdleTime = 0;
        SmtpMail.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);
        message.BodyEncoding = Encoding.Default;
        message.Priority = MailPriority.High;
        SmtpMail.Send(message); //Smtpclient to send the mail message  
        Response.Write("Check email for verification");


        //Response.Redirect("Login.aspx");
    }
    private AlternateView Mail_Body()
    {
        string message = "<br />Ease Maker<br />" +
           "<br /> Greetings! <br />" +
           "<br />Forgot Password? <br />" +
           "<br /> Click the link below to change your password: <br />" +
           "<br /> <a href=" + Helper.GetURL() + "/ChangePassword.aspx?email=" + txtEmail.Text + ">Click here!</a> <br />" +
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
            " + message + @"
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

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        //duplicate email
        con.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "SELECT * FROM Users " +
            "WHERE Email =@Email";
        cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
        SqlDataReader dr = cmd2.ExecuteReader();

        if (dr.HasRows)
        {

            con.Close();

            string message = "<br /> From - System Admin <br />" +
           "<br /> Please Click link below to Change Password <br />" +
           "<br />" + Helper.GetURL() + "/ChangePassword.aspx?email=" + txtEmail.Text + " <br />";
            Helper.SendEmail(txtEmail.Text, "Forgot Password", Mail_Body());
            ShowPopUpMsg("Please check your email to change your password!");
            return;

        }
        else
        {

            ShowPopUpMsg("User Email does not exist!");
            txtEmail.Text = "";
            txtEmail.Focus();
            con.Close();
            error.Visible = true;
            return;
        }


        //Helper.AddLog("1", "Add", "Added a user record");

    }
}