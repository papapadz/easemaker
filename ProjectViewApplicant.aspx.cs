using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectViewApplicant : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        else
        {
            GetInfo();
            getjobs();
        }
            
    }
    void GetInfo()
    {
        string userid = null;

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT *,(CAST(timeframe as varchar(10)) + ' ' + timecat) as timeline FROM joblistview WHERE jobid=@jobid ";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                userid = data["userid"].ToString();
                lblJD.Text = data["jobdescription"].ToString();
                lbltl.Text = data["timeline"].ToString();
                Image2.ImageUrl = string.Concat("img/", data["Image"].ToString());
                lblCN.Text = data["companyname"].ToString();
                //lblEmail.Text = data["email"].ToString();
                //lblAddress.Text = data["address"].ToString();
                //lblC.Text = data["contactno"].ToString();
                lblJT.Text = data["jobtitle"].ToString();
                lblBudget.Text = data["amt"].ToString();

            }
        }
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "SELECT TOP(1) * from subscription WHERE userid=@userid AND status='Subscribed'";
        cmd2.Parameters.Add("@userid", userid);
        SqlDataReader data2 = cmd2.ExecuteReader();
        while (data2.Read())
        {
            {
                Label1.Visible = true;

            }
        }
        con.Close();
    }
    protected void lbprojects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //dpProjects.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //getjobs();
    }
    void getjobs()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM projreq where jobid=" + Request.QueryString["ID"].ToString();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "projreq");
        lbprojects.DataSource = ds;
        lbprojects.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM apply " +
            "WHERE userid =@userid and jobid=@jobid";
        cmd3.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("You already applied for this Project!");
            con.Close();

            //Response.Redirect("joblistfreelancer.aspx?ST=");

        } else
        {
            con.Close();

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO apply (userid,jobid,date,status) VALUES (@userid,@jobid,@date,@status)";
            cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
            cmd.Parameters.AddWithValue("@status", "Pending");
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();

            ShowPopUpMsg("Application sent! Thank you for applying!");
        }


        
        //Response.Redirect("myapplication.aspx");
    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
}