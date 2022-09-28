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
        //return "http://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath;
        return "http://" + "20213t05.isproj.org" + HttpContext.Current.Request.ApplicationPath;
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
        catch(Exception ex)
        {
            return false;
        }

        return true;

    }


}