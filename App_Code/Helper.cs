using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
/// <summary>
/// Summary description for BSPHelper
/// </summary>
public class Helper
{
    //
    // TODO: Add constructor logic here
    //
    //public static Boolean CheckDupProduct2( string usercode)
    // {


    //SqlConnection con = new SqlConnection(BSPGetConnection());
    //con.Open();
    //SqlCommand cmd2 = new SqlCommand();
    //cmd2.Connection = con;
    //cmd2.CommandText = "Select * from MySCart" +
    //" where BSPCID = @BSPCID and BSPOrderID='0'";

    //cmd2.Parameters.AddWithValue("@BSPCID", usercode);
    //SqlDataReader dr = cmd2.ExecuteReader();
    //if (dr.HasRows)
    //{
    //    con.Close();
    //    return true;
    //}
    //else
    //{
    //    con.Close();
    //    return false;
    //}

    //con.Close();
    //return false;
    //}

    //private const string PUBLIC_KEY = "Basic cGstZW80c0wzOTNDV1U1S212ZUpVYVc4VjczMFRUZWkyelk4ekU0ZEhKRHhrRjo=";
    //private const string SECRET_KEY = "Basic c2stS2ZtZkxKWEZkVjV0MWluWU44bElPd1NydWVDMUcyN1NDQWtsQnFZQ2RyVTo=";
    private const string UB_CLIENT_ID = "4b27d8a5-b3ac-4338-a02c-7abd623ec935";
    private const string UB_CLIENT_SECRET = "R5sG3dH0tD8xQ8yD5rD1uP0oF3iV1fX4hP2vD2iH6nE3iE1bW2";

    public static string CreateHashTag(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }
    public static string GetURL()
    {
        return "http://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath;
        //return "http://" + "20213t05.isproj.org" + HttpContext.Current.Request.ApplicationPath;
    }
    public static void AddLog(string userID, string logType, string desc)
    {
        try
        {
            SqlConnection con = new SqlConnection(GetConnection());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Logs VALUES (@UserID, @LogType, " +
                "@Description, @TimeStamp)";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@LogType", logType);
            cmd.Parameters.AddWithValue("@Description", desc);
            cmd.Parameters.AddWithValue("@TimeStamp", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {

        }
    }
    public static string GetConnection()
    {
        return ConfigurationManager.ConnectionStrings["GetConnection"].ConnectionString;
    }
    public static bool SendEmail(string email, string subject, AlternateView AV)
    {


        try
        {
            MailMessage emailMessage = new MailMessage();
            emailMessage.To.Add(email);// Email-ID of Receiver  
                                       //message.To.Add(FormatMultipleEmailAddresses(""));
            emailMessage.Subject = subject;// Subject of Email  
            emailMessage.From = new
            System.Net.Mail.MailAddress("mmmh.events@gmail.com", "EaseMaker");// Email-ID of Sender  

            emailMessage.IsBodyHtml = true;
            emailMessage.AlternateViews.Add(AV);
            //SmtpClient SmtpMail = new SmtpClient();
            //SmtpMail.Host = "smtp-mail.outlook.com";//name or IP-Address of Host used for SMTP transactions  
            //SmtpMail.Port = 587;//Port for sending the mail  
            //SmtpMail.Credentials = new
            //System.Net.NetworkCredential("ease.maker@outlook.com", "admin118");//username/password of network, if apply  
            //SmtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            //SmtpMail.EnableSsl = true;
            //SmtpMail.ServicePoint.MaxIdleTime = 0;
            //SmtpMail.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);
            emailMessage.BodyEncoding = Encoding.Default;
            emailMessage.Priority = MailPriority.High;
            //SmtpMail.Send(emailMessage); //Smtpclient to send the mail message  

            /** Sending of Email via Gmail **/
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("mmmhmc.events@gmail.com", "yqkkdadnplxcngkr");
            client.Send(emailMessage);

        }
        catch (Exception ex)
        {
            return false;
        }

        return true;

    }

    /** public static string newAccount(string username, string password, string name)
    {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://api-uat.unionbankph.com/partners/sb/sandbox/v1/accounts");
        request.ContentType = "application/x-www-form-urlencoded";
        request.Headers["x-ibm-client-id"] = UB_CLIENT_ID;
        request.Headers["x-ibm-client-secret"] = UB_CLIENT_SECRET;
        request.Method = "POST";

        var postData = "username=" + Uri.EscapeDataString(username);
        postData += "&password=" + Uri.EscapeDataString(password);
        postData += "&account_name=" + Uri.EscapeDataString(name);
        var data = Encoding.ASCII.GetBytes(postData);

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        return responseString;
    }

    public static string auth()
    {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://api-uat.unionbankph.com/partners/sb/customers/v1/oauth2/authorize?client_id=4b27d8a5-b3ac-4338-a02c-7abd623ec935&response_type=code&scope=account&redirect_uri=https://api-uat.unionbankph.com/ubp/uat/v1/redirect&state=code&type=single&partnerId=18474d1f-d6be-4b0e-98e8-b4ac70e1c264");
        //request.ContentType = "application/x-www-form-urlencoded";
        //request.Headers["x-ibm-client-id"] = UB_CLIENT_ID;
        //request.Headers["x-ibm-client-secret"] = UB_CLIENT_SECRET;
        //request.Method = "POST";

        
        //var data = Encoding.ASCII.GetBytes(postData);

        


        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();

        return responseString;
    }
    **/

    public static string addWaterMark(string uploadedFilename)
    {
        string newFileName = "ease_" + uploadedFilename;
        using (System.Drawing.Image image = System.Drawing.Image.FromFile(System.Web.HttpContext.Current.Server.MapPath("~/img/" + uploadedFilename)))
        using (System.Drawing.Image watermarkImage = System.Drawing.Image.FromFile(System.Web.HttpContext.Current.Server.MapPath("~/img/logo.png")))
        using (System.Drawing.Graphics imageGraphics = System.Drawing.Graphics.FromImage(image))
        using (TextureBrush watermarkBrush = new TextureBrush(watermarkImage))
        {
            int x = (image.Width / 2 - watermarkImage.Width / 2);
            int y = (image.Height / 2 - watermarkImage.Height / 2);
            watermarkBrush.TranslateTransform(x, y);
            imageGraphics.FillRectangle(watermarkBrush, new System.Drawing.Rectangle(new System.Drawing.Point(x, y), new Size(watermarkImage.Width + 1, watermarkImage.Height)));
            image.Save(System.Web.HttpContext.Current.Server.MapPath("~/img/" + newFileName));
        }
        return newFileName;
    }
}