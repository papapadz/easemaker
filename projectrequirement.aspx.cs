using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class projectrequirement : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lblPN.Text = Request.QueryString["name"].ToString();

            getexperience();
        }
    }
  
    void getexperience()
    {
        //change select statement
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select * from projreq where jobid=@jobid";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            //details.Visible = true;
            gvexperience.Visible = true;
            gvexperience.DataSource = data;
            gvexperience.DataBind();
            con.Close();
        }
        else
        {
            //details.Visible = false;
            gvexperience.Visible = false;
            con.Close();
        }
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        if(txtDesc.Text =="")
        {
            ShowPopUpMsg("Please Input Description");
            return;
        }
        Page.Validate();
        if (Page.IsValid)
        {
            AddExp();

        }

        getexperience();
    }
    void AddExp()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;


        cmd.CommandText = "INSERT INTO projreq VALUES(@jobid,@Description,@status,@completiondate,@remarks)";
        cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = txtDesc.Text;
        cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "Pending";
        cmd.Parameters.Add("@completiondate", SqlDbType.VarChar).Value = DBNull.Value;
        cmd.Parameters.Add("@remarks", SqlDbType.VarChar).Value = "";
        cmd.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd.ExecuteNonQuery();



        con.Close();
        getexperience();
    }




    protected void gvPurchaseDetails_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void gvexperience_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "DELETE projreq FROM projreq WHERE projreqid= @projreqid ";
        cmd.Parameters.Add("@projreqid", SqlDbType.Int).Value = gvexperience.SelectedRow.Cells[0].Text;
        cmd.ExecuteNonQuery();
        con.Close();

        getexperience();
    }


    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("addskills.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        ShowPopUpMsg("Resume Completed!");
        Response.Redirect("joblist.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("joblist.aspx");
    }
}