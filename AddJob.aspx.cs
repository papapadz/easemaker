using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddJob : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

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

            getcategory();
            getposition();
        }
    }
    void getcategory()
    {
        //change select statement rawmats only
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT categoryid,categoryname FROM category";

        SqlDataReader data = cmd.ExecuteReader();
        ddlCategory.DataSource = data;
        ddlCategory.DataTextField = "categoryname";
        ddlCategory.DataValueField = "categoryid";
        ddlCategory.DataBind();
        con.Close();
    }
    void getposition()
    {
        ////change select statement rawmats only
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "SELECT positionid,positionname FROM position";

        //SqlDataReader data = cmd.ExecuteReader();
        //ddlPosition.DataSource = data;
        //ddlPosition.DataTextField = "positionname";
        //ddlPosition.DataValueField = "positionid";
        //ddlPosition.DataBind();
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

   
    protected void btnLogin_Click(object sender, EventArgs e)
    {

    }

    protected void btnReg_Click(object sender, EventArgs e)
    {

        //name
        //con.Open();
        //SqlCommand cmd3 = new SqlCommand();
        //cmd3.Connection = con;
        //cmd3.CommandText = "SELECT * FROM joborder " +
        //    "WHERE position =@ProductName and userid=@userid and status!='Completed'";
        //cmd3.Parameters.AddWithValue("@ProductName", this.ddlPosition.SelectedValue);
        //cmd3.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        //SqlDataReader dr2 = cmd3.ExecuteReader();

        //if (dr2.HasRows)
        //{
        //    ShowPopUpMsg("You have an existing job order for this position!");
        //    con.Close();

        //    return;
        //}
        //con.Close();


        //max and critical


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO joblist (jobtitle, date,status, jobdescription,amt,timeframe,timecat,userid,category) VALUES (@jobtitle, @date,@status, @jobdescription,@amt,@timeframe, " +
             "@timecat,@userid,@category)";
        cmd.Parameters.AddWithValue("@jobtitle", txtJT.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@status", "Posted");
        cmd.Parameters.AddWithValue("@jobdescription", txtDesc.Text);
        cmd.Parameters.AddWithValue("@amt", txtamt.Text);
        cmd.Parameters.AddWithValue("@timeframe", txttf.Text);
        cmd.Parameters.AddWithValue("@timecat", ddltimecat.SelectedValue);
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@category", ddlCategory.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "jobs", "Added Job");
        Response.Redirect("joblist.aspx");
    }
}