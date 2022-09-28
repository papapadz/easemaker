using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class projectrequirementlist : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["UserID"] == null || Session["UserLevel"].ToString() == "Customer")
        //{
        //    Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            getjobs();
            lblID.Text = Request.QueryString["ID"].ToString();
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
    public string GetClassName(string amount)
    {
        if (Convert.ToDecimal(amount) <= 0)
        {
            //danger for red
            return "danger";
        }
        else
        {
            return "";
        }

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
        lvjobs.DataSource = ds;
        lvjobs.DataBind();
        con.Close();
    }
    protected void lvjobs_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpjobs.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        getjobs();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("addjob.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //int parsedValue;
        //if (!int.TryParse(txtKeyword.Text, out parsedValue))
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;
        //    cmd.CommandText = "SELECT * from joblist WHERE  ProductName LIKE '%" + txtKeyword.Text + "%' or description LIKE '%" + txtKeyword.Text + "%'";
        //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();

        //    adp.Fill(ds, "joblist");
        //    lvjobs.DataSource = ds;
        //    lvjobs.DataBind();
        //    con.Close();
        //}
        //else
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;
        //    cmd.CommandText = "SELECT * from joblist  WHERE productID LIKE '%" + txtKeyword.Text + "%'";
        //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();

        //    adp.Fill(ds, "joblist");
        //    lvjobs.DataSource = ds;
        //    lvjobs.DataBind();
        //    con.Close();
        //}

    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM projreq " +
            "WHERE jobid=@jobid and status='Pending'";
        cmd3.Parameters.AddWithValue("@jobid", this.Request.QueryString["ID"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            //ShowPopUpMsg("Requirement already completed!");
            con.Close();

            Response.Redirect("projectmanagement.aspx");
        }
        else
        {
            con.Close();


            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "UPDATE joblist SET status=@status2 WHERE jobid=@jobid;UPDATE projects SET status=@status2 WHERE jobid=@jobid";
            cmd.Parameters.AddWithValue("@status2", "Deliverables Completed");
            //cmd.Parameters.AddWithValue("@enddate", DateTime.Now);
            cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            Helper.AddLog(Session["userid"].ToString(), "Requirement Completion", "Requirement Updated!");
            //Response.Redirect("projectrequirementlist.aspx?ID=" + Request.QueryString["ID"].ToString());

            Response.Redirect("projectmanagement.aspx");
        }
    }
}