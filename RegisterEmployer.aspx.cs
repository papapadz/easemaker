using PayPal.Api;
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
using System.Net;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpWebRequest myReq =
(HttpWebRequest)WebRequest.Create("http://www.contoso.com/");
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
        //DateTime bday = DateTime.Parse(txtBD.Text);
        //DateTime today = DateTime.Today;

        //DateTime dh = DateTime.Parse(txtBD.Text);
        //int age = today.Year - bday.Year;
        //if (bday > today.AddYears(-age))
        //{
        //    age--;
        //}
        //if (age < 18)
        //{
        //    ShowPopUpMsg("Birthday not Valid! Must be 18 years or above!");
        //    return;
        //}

        //if (dh > today)
        //{
        //    ShowPopUpMsg("No future dates for date hired!");
        //    return;
        //}
        if (txtPassword.Text != txtPassword_confirm.Text) { ShowPopUpMsg("Pasword Mismatch!"); return; }
        
        //check password
        if (checkPassword(txtPassword.Text) == 0) { ShowPopUpMsg("Pasword must be at least 6 characters, must contain Uppercase and Lowercase letters, numbers and symbols!"); return; }

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
            ShowPopUpMsg("User Email already Used!");
            txtEmail.Text = "";
            txtEmail.Focus();
            con.Close();

            return;
        }
        con.Close();


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO Users (Companyname, PersonName, Email, ContactNo, " +
            "Address, " +
            "Password, status, UserType) VALUES (@Companyname, @PersonName, @Email, @ContactNo, " +
            "@Address, " +
            "@Password, @status,  @UserType)";
        string SQL = "Insert into ";
  
        cmd.Parameters.AddWithValue("@UserType", "Applicant");
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);

        cmd.Parameters.AddWithValue("@Status", "InActive");
        cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);

        cmd.Parameters.AddWithValue("@Address", "");
        cmd.Parameters.AddWithValue("@ContactNo", "");
        cmd.ExecuteNonQuery();
        con.Close();
        //Helper.AddLog("1", "Add", "Added a user record");
 
        Helper.SendEmail(txtEmail.Text, "Registered as Employer",  Mail_Body());

        Response.Redirect("Login.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text != txtPassword_confirm.Text) { ShowPopUpMsg("Pasword Mismatch!"); return; }

        //check password
        if (checkPassword(txtPassword.Text) == 0) { ShowPopUpMsg("Pasword must be at least 6 characters, must contain Uppercase and Lowercase letters, numbers and symbols!"); return; }

        //check file uploads
        if (!fuImage.HasFile || !fuImage2.HasFile) { ShowPopUpMsg("Logo and Business Permit required!"); return; }

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
            ShowPopUpMsg("Email is already in used!");
            txtEmail.Text = "";
            txtEmail.Focus();
            con.Close();

            return;
        }
        con.Close();

        //name
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM Users " +
            "WHERE email =@ProductName and usertype='Employer'";
        cmd3.Parameters.AddWithValue("@ProductName", this.txtEmail.Text);
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Email is already in used!");
            con.Close();

            return;
        }
        con.Close();


        //max and critical


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO users (Companyname,PersonName,Email,ContactNo,Address,Password,status,UserType,aboutme,image,registerdate,updatedate,birthday,gender,id1,id2) VALUES (@Companyname,@PersonName, @Email, @ContactNo, " +
            "@address,@Password,@Status,@UserType,@aboutme,@image,@registerdate,@updatedate,@birthday,@gender,@id1,@id2)";
        //Logo
        string fileExt = Path.GetExtension(fuImage.FileName);
        string id = Guid.NewGuid().ToString();
        fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));
        //Business Permit
        string fileExt2 = Path.GetExtension(fuImage2.FileName);
        string id2 = Guid.NewGuid().ToString();
        fuImage2.SaveAs(Server.MapPath("~/img/" + id2 + fileExt2));

        cmd.Parameters.AddWithValue("@Image", id + fileExt);
        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Companyname", txtFN.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@registerdate", DateTime.Now);
        cmd.Parameters.AddWithValue("@updatedate", "");
        cmd.Parameters.AddWithValue("@birthday", "");
        cmd.Parameters.AddWithValue("@gender", "");
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtCN.Text);
        cmd.Parameters.AddWithValue("@UserType", "Employer");
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@Status", "For Verification");
        cmd.Parameters.AddWithValue("@id1", id2 + fileExt2);
        cmd.Parameters.AddWithValue("@id2", "");
        cmd.ExecuteNonQuery();
        con.Close();

    
        
        Helper.SendEmail(txtEmail.Text, "Registered as Employer", Mail_Body());


        //MailMessage message = new MailMessage();
        //message.To.Add(txtEmail.Text);// Email-ID of Receiver  
        //                              //message.To.Add(FormatMultipleEmailAddresses(""));
        //message.Subject = "Account Registration";// Subject of Email  
        //message.From = new
        //System.Net.Mail.MailAddress("easemaker8112@outlook.ph");// Email-ID of Sender  

        //message.IsBodyHtml = true;
        //message.AlternateViews.Add(Mail_Body());
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
        ShowPopUpMsg("Thank you! We will verify your registration and send you an email soon.");


        //Response.Redirect("default.aspx");
    }
    private AlternateView Mail_Body()
    {
        //string message = "<br />Ease Maker<br />" +
        //   "<br /> Greetings! <br />" +
        //   "<br />You Registered to our website! <br />" +
        //   "<br /> Click the link below: <br />" +
        //   "<br /> <p> <a href=" + Helper.GetURL() + "/VerifyUser.aspx?email=" + txtEmail.Text + "> Click here to Verify! </a> </p> <br/>" +
        //   "<br />Please Ignore if you did not register!<br />" +
        //   "<br /> Thank you, <br />" +
        //  "<br />from - Ease Maker Administrator <br />";

        string message = "Ease Maker<br><br>" +
            "Greetings! <br><br>" +
            "Thank you for registering in our website. <br><br>" +
            "We will be sending you an email after our Administrator has verified your account. <br><br>" +
            "Thank you! <br><br><br>" +
            "From - Ease Maker Administrator <br><br>" +
            "<i>Please ignore this email if your did not register</i>";

        string path = Server.MapPath(@"img/logo.png");
        LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
        Img.ContentId = "MyImage";


        string str = @"  
            <table>  
              <tr>  
                <td>  
                      <img src=cid:MyImage  id='img' alt=''/>
                <td/>
            </tr>
            <tr>
                <td>
                    <img src=cid:MyImage2  id='img2' alt=''/> 
                <td/>
            <tr>    
                <td>
                " + message + @"
                </td>
            </tr>
            </table>  ";
        AlternateView AV =
        AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
        AV.LinkedResources.Add(Img);
        return AV;
    }

    private int checkPassword(String password)
    {

        // Password at least 6 characters.
        if (password.Length >= 6 && password.Any(c => char.IsLower(c)) && password.Any(c => char.IsUpper(c)) && password.Any(c => char.IsDigit(c)) && password.IndexOfAny("\\|¬¦`!\"£$%^&*()_+-=[]{};:'@#~<>,./? ".ToCharArray()) >= 0)
            return 1;
        return 0;

    }
}