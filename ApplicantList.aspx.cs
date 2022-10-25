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

public partial class ApplicantList : System.Web.UI.Page
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
        cmd.CommandText = "SELECT DISTINCT(applyid), jobid, PersonName, amt, Email,ContactNo,jobdescription,userid,applyid, subscriptionStatus FROM vw_applicant where usertype='User' AND projectStatus='Posted' AND useridemp=" + Session["userid"] + " ORDER BY subscriptionStatus";
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

        cmd.CommandText = "SELECT * FROM vw_applicant WHERE PersonName LIKE '%" + txtSearch.Text + "%' AND projectStatus='Posted' AND usertype='User' AND useridemp=" + Session["userid"];


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
}