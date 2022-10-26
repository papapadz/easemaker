using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;

public partial class VerifyApplicant : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["email"] == null)
        //    Response.Redirect("Login.aspx");
        //else
        //{
            if (!IsPostBack && Request.QueryString["flag"]!=null)
            {
                UpdateStatus();
            }
        //}
    }
    void UpdateStatus()
    {
        string flag = Request.QueryString["flag"];
        string status = "Inactive";

        if (flag == "1")
            status = "Active";
        
        con.Open();
        SqlCommand cmd6 = new SqlCommand();
        cmd6.Connection = con;
        cmd6.CommandText = "UPDATE Users SET Status=@Status WHERE userid=@userid";
        cmd6.Parameters.Add("@Status", SqlDbType.VarChar).Value = status;
        cmd6.Parameters.Add("@userid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd6.ExecuteNonQuery();
        con.Close();
        //Session["verified"] = "yes";

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM Users " +
            "WHERE userid=@userid";
        cmd.Parameters.AddWithValue("@userid", Request.QueryString["ID"].ToString());
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Helper.SendEmail(dr["Email"].ToString(), "Verified", Mail_Body());
        }
        con.Close();

        if (Request.QueryString["UT"].ToString() == "Employer")
        {
            Response.Redirect("employers.aspx");
        }
        else
        {
            Response.Redirect("accountmanagement.aspx");
        }
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
            "Our Administrator has verified your account. You may now login into your account<br><br>" +
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
}