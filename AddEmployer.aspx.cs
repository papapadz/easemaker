using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEmployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userid"] == null)
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        //if (Session["usertype"].ToString() != "Admin")
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        if (!IsPostBack)
        {

            //GetCategories();
        }
    }



    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {




        //name
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM Users " +
            "WHERE email =@ProductName and usertype='Client'";
        cmd3.Parameters.AddWithValue("@ProductName", this.txtEmail.Text);
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Email already in use!");
            con.Close();

            return;
        }
        con.Close();


        //max and critical


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO users (Companyname,PersonName,Email,Address,Password,status,UserType,aboutme,image,registerdate,updatedate,birthday,gender) VALUES (@Companyname,@PersonName, @Email, @address, " +
            "@ContactNo, @Status,@UserType,@aboutme,@image,@registerdate,@updatedate,@birthday,@gender)";
        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Companyname", txtFN.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
        cmd.Parameters.AddWithValue("@UserType", "Employer");
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.ExecuteNonQuery();
        con.Close();
        //  string message = "<br /> From - Recruitment <br />" +
        //"<br /> Please Click link below to Verify Account <br />" +
        //"<br />" + Helper.GetURL() + "/Verify.aspx?email=" + txtEmail.Text + " <br />";
        //  Helper.SendEmail(txtEmail.Text, "Registered as Employer", message);
        MailMessage message = new MailMessage();
        message.To.Add(txtEmail.Text);// Email-ID of Receiver  
                                      //message.To.Add(FormatMultipleEmailAddresses(""));
        message.Subject = "Account Registration";// Subject of Email  
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
        Response.Redirect("Employers.aspx");
    }
    private AlternateView Mail_Body()
    {
        string message = "<br />Ease Maker<br />" +
           "<br /> Greetings! <br />" +
           "<br />You Registered to our website! <br />" +
           "<br /> Click the link below: <br />" +
           "<br /> <a href=" + Helper.GetURL() + "/VerifyUser.aspx?email=" + txtEmail.Text + ">Click here to Verify! </ a >< br />" +
           "<br /> Thank you, <br />" +
           "<br />from - Ease Maker Administrator <br />";

        string path = Server.MapPath(@"Images/logo.png");
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

    protected void btnLogin_Click(object sender, EventArgs e)
    {

    }

    protected void btnReg_Click(object sender, EventArgs e)
    {



        //name
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM Users " +
            "WHERE email =@ProductName and usertype='Client'";
        cmd3.Parameters.AddWithValue("@ProductName", this.txtEmail.Text);
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Email already in use!");
            con.Close();

            return;
        }
        con.Close();


        //max and critical


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO users (Companyname,PersonName,Email,contactno,Address,Password,status,UserType,aboutme,image,registerdate,updatedate,birthday,gender) VALUES (@Companyname,@PersonName, @Email,@ContactNo, @address, " +
            "@Password, @Status,@UserType,@aboutme,@image,@registerdate,@updatedate,@birthday,@gender)";
        string fileExt = Path.GetExtension(fuImage.FileName);
        string id = Guid.NewGuid().ToString();
        cmd.Parameters.AddWithValue("@Image", id + fileExt);
        fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));
        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Companyname", txtFN.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
        cmd.Parameters.AddWithValue("@registerdate", DateTime.Now);
        cmd.Parameters.AddWithValue("@birthday", "");
        cmd.Parameters.AddWithValue("@gender", "");
        cmd.Parameters.AddWithValue("@updatedate", "");
        cmd.Parameters.AddWithValue("@UserType", "Client");
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.ExecuteNonQuery();
        con.Close();
        string message = "<br /> From - Recruitment <br />" +
      "<br /> Please Click link below to Verify Account <br />" +
      "<br />" + Helper.GetURL() + "/VerifyApplicant.aspx?email=" + txtEmail.Text + " <br />";
        Helper.SendEmail(txtEmail.Text, "Registered as Employer", message);
        Helper.AddLog(Session["userid"].ToString(), "Add Employer", "Added Employer");
        Response.Redirect("Employer.aspx");
    }
}