using Microsoft.Office.Interop.PowerPoint;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;

public partial class Freelancerlistemployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            GetAccounts();
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

    void GetAccounts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "SELECT * FROM users where usertype='User'";
        cmd.CommandText = "SELECT * FROM Users LEFT OUTER JOIN subscription ON subscription.userid = Users.userID where usertype='User' ORDER BY subscription.Status";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvaccounts.DataSource = ds;
        lvaccounts.DataBind();
        con.Close();
    }
    protected void lvaccounts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpAccounts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetAccounts();
    }




    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM Users LEFT OUTER JOIN subscription ON subscription.userid = Users.userID where usertype='User' AND PersonName LIKE '%" + txtSearch.Text + "%' ORDER BY subscription.Status";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvaccounts.DataSource = ds;
        lvaccounts.DataBind();
        con.Close();
    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        var jobID = btn.Attributes["data-jobid"];
        var userID = btn.Attributes["data-userid"];

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE joblist SET status='On-Going' WHERE jobid=" + jobID;
        cmd.ExecuteNonQuery();
        con.Close();

        con.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.Connection = con;
        cmd1.CommandText = "UPDATE apply SET status='Done' WHERE jobid=@jobid AND userid=@userid";
        cmd1.Parameters.AddWithValue("@jobid", jobID);
        cmd1.Parameters.AddWithValue("@userid", userID);
        cmd1.ExecuteNonQuery();
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "INSERT INTO projects(jobid,userid,status,datetime) VALUES(@jobid,@userid,@status,@datetime)";
        cmd2.Parameters.AddWithValue("@jobid", jobID);
        cmd2.Parameters.AddWithValue("@userid", userID);
        cmd2.Parameters.AddWithValue("@status", "On-Going");
        cmd2.Parameters.AddWithValue("@datetime", DateTime.Now);
        cmd2.ExecuteNonQuery();
        con.Close();

        ShowPopUpMsg("Freelancer Hired!");

        Response.Redirect("joblist.aspx");
    }

    protected void sendMail(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        var jobID = "";
        var userID = btn.Attributes["data-userid"];

        string fname = "";
        string emailadd = "";
        SqlConnection con2 = new SqlConnection(Helper.GetConnection());
        con2.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con2;
        cmd2.CommandText = "SELECT TOP(1) * FROM Users " +
            "WHERE UserID =@userid ";
        cmd2.Parameters.AddWithValue("@userid", userID);
        SqlDataReader data = cmd2.ExecuteReader();
        while (data.Read())
        {
            if (data.HasRows)
            {
                fname = data["PersonName"].ToString();
                emailadd = data["Email"].ToString();
            }
        }
        con2.Close();

        Helper.SendEmail(emailadd, "Project Invitation", Mail_Body2(jobID, fname));

        ShowPopUpMsg("Email Sent!");
    }

    private AlternateView Mail_Body2(string jobID, string name)
    {

        string personName = "";
        string company = "";
        SqlConnection con2 = new SqlConnection(Helper.GetConnection());
        con2.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con2;
        cmd2.CommandText = "SELECT TOP(1) * FROM Users " +
            "WHERE UserID =@userid ";
        cmd2.Parameters.AddWithValue("@userid", Session["userid"]);
        SqlDataReader data = cmd2.ExecuteReader();
        while (data.Read())
        {
            if (data.HasRows)
            {
                personName = data["PersonName"].ToString();
                company = data["Companyname"].ToString();
            }
        }
        con2.Close();


        string message = "<br />Ease Maker<br />" +
           "<br /> Greetings " + name + "!<br/ >" +
           "<br />We have posted a project that perfectly suits you. Please consider this invitation to apply for the job. <br />" +
           "<br /> Click the link below: <br />" +
           "<br /> <p> <a href=" + Helper.GetURL() + "/projectviewapplicant.aspx?ID=" + jobID + "> Click here to view Project! </ a > </p > <br />" +
           "<br />Please Ignore if you already accepted this project!<br />" +
           "<br /> Thank you, <br />" +
           "<br />" + personName + "<br />" + company;

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

}