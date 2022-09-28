using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editjoborder : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        if (Request.QueryString["Status"].ToString() != "Posted")
        {
            Response.Redirect("joblist.aspx");
        }
            if (Request.QueryString["ID"] != null)
        {
            int ProjectID = 0;
            bool isValid = int.TryParse(Request.QueryString["ID"].ToString(), out ProjectID);
            if (isValid)
            {
                if (!IsPostBack)
                {
                    GetInfo(ProjectID);
                    getcategory();
                  
                }
            }
            else
                Response.Redirect("joblist.aspx");
        }
        else
            Response.Redirect("joblist.aspx");
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
  
    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM joblist WHERE jobid=@jobid";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = ID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            txtJT.Text = data["jobtitle"].ToString();
            txtDesc.Text = data["jobdescription"].ToString();
            txtamt.Text = data["amt"].ToString();
            txttf.Text = data["timeframe"].ToString();
            ddltimecat.SelectedValue = data["timecat"].ToString();
            ddlCategory.SelectedValue = data["category"].ToString();
        }
        con.Close();
    }

 
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE joblist SET jobtitle=@jobtitle, jobdescription=@jobdescription, " +
            "amt=@amt, timeframe=@timeframe, timecat=@timecat,category=@category WHERE " +
            "jobid=@jobid";
        cmd.Parameters.Add("@jobdescription", SqlDbType.VarChar).Value = txtDesc.Text;
        cmd.Parameters.Add("@jobtitle", SqlDbType.VarChar).Value = txtJT.Text;
        cmd.Parameters.Add("@amt", SqlDbType.VarChar).Value = txtamt.Text;
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@category", SqlDbType.VarChar).Value = ddlCategory.SelectedValue;
        cmd.Parameters.Add("@timecat", SqlDbType.VarChar).Value = ddltimecat.SelectedValue;
        cmd.Parameters.Add("@timeframe", SqlDbType.VarChar).Value = txttf.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        
        Response.Redirect("joblist.aspx");
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE joblist SET jobtitle=@jobtitle, jobdescription=@jobdescription, " +
            "amt=@amt, timeframe=@timeframe, timecat=@timecat,category=@category WHERE " +
            "jobid=@jobid";
        cmd.Parameters.Add("@jobdescription", SqlDbType.VarChar).Value = txtDesc.Text;
        cmd.Parameters.Add("@jobtitle", SqlDbType.VarChar).Value = txtJT.Text;
        cmd.Parameters.Add("@amt", SqlDbType.VarChar).Value = txtamt.Text;
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@category", SqlDbType.VarChar).Value = ddlCategory.SelectedValue;
        cmd.Parameters.Add("@timecat", SqlDbType.VarChar).Value = ddltimecat.SelectedValue;
        cmd.Parameters.Add("@timeframe", SqlDbType.VarChar).Value = txttf.Text;
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("joblist.aspx");
    }

  
}