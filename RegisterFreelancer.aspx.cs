using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class MyDetail
{
    public string message
    {
        get;
        set;
    }
}
public partial class RegisterFreelancer : System.Web.UI.Page
{
    private string id;
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetUserTypes();
        }
        
        //string jsonData = "{\"msg\":\"Test Account successfully created.\",\"data\":{\"user\":{\"username\":\"ease_test1\",\"password\":\"P@ssw0rd\"},\"account\":{\"user_id\":\"18474d1f-d6be-4b0e-98e8-b4ac70e1c264\",\"account_number\":\"104758330416\",\"card_number\":\"4190200051478796\",\"account_name\":\"Test1\",\"account_code\":\"kO6Od104nwLpLJ8X\",\"account_type\":\"Savings Account\",\"status\":\"Active\",\"branch\":\"1257\",\"balance\":\"100000\"}},\"code\":200,\"status\":1}";
        //var getresult = JObject.Parse(jsonData);
        //Console.WriteLine("test: " + getresult);
        //Page.Response.Write("<script>console.log('" + getresult["data"]["account"]["user_id"] + "');</script>");
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

        DateTime bday = DateTime.Parse(txtBD.Text);
        DateTime today = DateTime.Today;

        DateTime dh = DateTime.Parse(txtBD.Text);
        int age = today.Year - bday.Year;
        if (bday > today.AddYears(-age))
        {
            age--;
        }
        if (age < 18)
        {
            errorBirthday.Visible = true;
            errorBirthday.Text = "Birthday not Valid! Must be 18 years or above!";
            //ShowPopUpMsg("Birthday not Valid! Must be 18 years or above!");
            return;
        }

        if (dh > today)
        {
            //ShowPopUpMsg("No future dates for date hired!");
            errorBirthday.Visible = true;
            errorBirthday.Text = "No future dates for date hired!";
            return;
        }



        if (txtPassword.Text != txtPassword_confirm.Text) {
            //ShowPopUpMsg("Pasword Mismatch!"); 
            errorPassword.Visible = true;
            errorPassword.Text = "Pasword Mismatch!";
            return; 
        }

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
            "@Password, @Status,  @UserType)";
        string SQL = "Insert into ";

        cmd.Parameters.AddWithValue("@UserType", "Applicant");
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);

        cmd.Parameters.AddWithValue("@Status", "For Verification");
        cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);

        cmd.Parameters.AddWithValue("@Address", "");
        cmd.Parameters.AddWithValue("@ContactNo", "");
        cmd.ExecuteNonQuery();
        con.Close();
        //Helper.AddLog("1", "Add", "Added a user record");

        Helper.SendEmail(txtEmail.Text, "Registered as Freelancer", Mail_Body());
        
        Response.Redirect("Login.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        DateTime bday = DateTime.Parse(txtBD.Text);
        DateTime today = DateTime.Today;

        DateTime dh = DateTime.Parse(txtBD.Text);
        int age = today.Year - bday.Year;
        if (bday > today.AddYears(-age))
        {
            age--;
        }
        if (age < 18)
        {
            errorBirthday.Visible = true;
            errorBirthday.Text = "Birthday not Valid! Must be 18 years or above!";
            return;
        } else
            errorBirthday.Visible = false;

        if (fuImage.HasFile || fuImage2.HasFile)
        {
            errorImage.Visible = false;
        }
        else
        {
            errorImage.Visible = true;
            errorImage.Text = " Please add identification!";
            //ShowPopUpMsg("Please add identification!");
            return;
        }
       
        if (txtPassword.Text != txtPassword_confirm.Text) {
            errorPassword.Visible = true;
            errorPassword.Text =" Pasword Mismatch!"; 
            return; 
        }else if (checkPassword(txtPassword.Text) == 0) {
            errorPassword.Visible = true;
            errorPassword.Text = " Pasword must be at least 6 characters, must contain Uppercase and Lowercase letters, numbers and symbols!"; 
            return; 
        } else
            errorPassword.Visible = false;

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
            //ShowPopUpMsg("User Email already Used!");
            errorEmail.Visible = true;
            errorEmail.Text = " User Email already Used!";
            txtEmail.Text = "";
            txtEmail.Focus();
            con.Close();

            return;
        } else
            errorEmail.Visible = false;
        con.Close();


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO Users (Companyname, PersonName, Email, ContactNo, " +
            "Address, " +
            "Password, status, UserType,aboutme,image,registerdate,updatedate,birthday,gender,Id1,Id2) VALUES (@Companyname, @PersonName, @Email, @ContactNo, " +
            "@Address, " +
            "@Password, @status,  @UserType,@aboutme,@image,@registerdate,@updatedate,@birthday,@gender,@Image1,@Image2)";
        //string SQL = "Insert into ";
        string fileExt = Path.GetExtension(fuImage.FileName);
        id = Guid.NewGuid().ToString();
        cmd.Parameters.AddWithValue("@Image1", id + fileExt);
        fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));
        string fileExt2 = Path.GetExtension(fuImage2.FileName);
        string id2 = Guid.NewGuid().ToString();
        cmd.Parameters.AddWithValue("@Image2", id2 + fileExt2);
        fuImage2.SaveAs(Server.MapPath("~/img/" + id2 + fileExt));
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@image", "");
        cmd.Parameters.AddWithValue("@UserType", "User");
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@PersonName", txtFN.Text);

        cmd.Parameters.AddWithValue("@Status", "For Verification");
        cmd.Parameters.AddWithValue("@registerdate", DateTime.Now);
        cmd.Parameters.AddWithValue("@Companyname", "");
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtCN.Text);
        cmd.Parameters.AddWithValue("@birthday", txtBD.Text);
        cmd.Parameters.AddWithValue("@gender", "");
        cmd.Parameters.AddWithValue("@updatedate", "");
        cmd.ExecuteNonQuery();
        con.Close();

        if (preference1.Checked)
            addPreference("1");
        if (preference2.Checked)
            addPreference("2");
        if (preference3.Checked)
            addPreference("3");
        if (preference4.Checked)
            addPreference("4");

        Helper.SendEmail(txtEmail.Text, "Registered as Freelancer", Mail_Body());
        ShowPopUpMsg("Check email for verification");

        //Helper.AddLog("1", "Add", "Added a user record");
        //string message = "<br /> From <br />" +
        //"<br /> Please Click link below to Verify Account <br />" +
        //"<br />" + Helper.GetURL() + "/VerifyUser.aspx?email=" + txtEmail.Text + " <br />";
        //Helper.SendEmail(txtEmail.Text, "Registered ", message);

        //MailMessage message = new MailMessage();
        //message.To.Add(txtEmail.Text);// Email-ID of Receiver  
        //                           //message.To.Add(FormatMultipleEmailAddresses(""));
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
        //Response.Redirect("Login.aspx");
    }
    private AlternateView Mail_Body()
    {
        string message = "<br />Ease Maker<br />" +
           "<br /> Greetings! <br />" +
           "<br />You Registered to our website! <br />" +
           "<br /> Click the link below: <br />" +
           "<br /> <p> <a href=" + Helper.GetURL() + "/VerifyUser.aspx?email=" + txtEmail.Text + "> Click here to Verify! </ a > </p > <br />" +
           "<br />Please Ignore if you did not register!<br />" +
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

    private int checkPassword(String password)
    {

        // Password at least 6 characters.
        if (password.Length >= 6 && password.Any(c => char.IsLower(c)) && password.Any(c => char.IsUpper(c)) && password.Any(c => char.IsDigit(c)) && password.IndexOfAny("\\|¬¦`!\"£$%^&*()_+-=[]{};:'@#~<>,./? ".ToCharArray()) >= 0)
            return 1;
        return 0;
           
    }

    private void addPreference(string category_id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO preferences (user_id, category_id) VALUES (@user, @category)";
        cmd.Parameters.AddWithValue("@user", getUserid());
        cmd.Parameters.AddWithValue("@category", category_id);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private string getUserid()
    {
        SqlConnection con2 = new SqlConnection(Helper.GetConnection());
        con2.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con2;
        cmd2.CommandText = "SELECT TOP(1) UserID FROM Users " +
            "WHERE Email =@Email ";
        cmd2.Parameters.AddWithValue("@Email", txtEmail.Text);
        SqlDataReader data = cmd2.ExecuteReader();
        while (data.Read())
        {
            if (data.HasRows)
            {
                return data["UserID"].ToString();
            }
        }
            
        return "";
    }
}