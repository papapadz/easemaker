using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addcategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    public string jobID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["usertype"].ToString() != "Admin")
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        if (!IsPostBack)
        {

            //GetCategories();
        }

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM projreq where projreqid=" + Request.QueryString["reqid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            jobID = data["jobid"].ToString();
           
        }
        con.Close();
    }



    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }




    protected void btnReg_Click(object sender, EventArgs e)
    {

        //name
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM projreq " +
            "WHERE jobid=@jobid and status='Completed' and projreqid=@projreqid";
        cmd3.Parameters.AddWithValue("@jobid", jobID);
        cmd3.Parameters.AddWithValue("@projreqid", this.Request.QueryString["reqid"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Requirement already completed!");
            con.Close();

            return;
        }
        con.Close();

        
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE projreq SET status=@status2,completiondate=@enddate,remarks=@remarks WHERE jobid=@jobid and projreqid=@projreqid";
        cmd.Parameters.AddWithValue("@status2", "Completed");
        cmd.Parameters.AddWithValue("@remarks", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@enddate", DateTime.Now);
        cmd.Parameters.AddWithValue("@jobid", jobID);
        cmd.Parameters.AddWithValue("@projreqid", Request.QueryString["reqid"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "Requirement Completion", "Requirement Updated!");
        Response.Redirect("projectrequirementlist.aspx?ID=" + jobID);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("projectrequirementlist.aspx?ID=" + jobID);
    }
}