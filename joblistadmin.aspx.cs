using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class joblistadmin : System.Web.UI.Page
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
        }
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
        cmd.CommandText = "SELECT * FROM joblistview ";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "joblistview");
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
        Response.Redirect("Addjob.aspx");
    }

    protected void ddltimecat_SelectedIndexChanged(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        if (ddltimecat.SelectedValue == "On-Going")
        {
            cmd.CommandText = "SELECT * FROM joblistview where status!='Done' and Status!='Pending' and Status!='Posted' ";
        }
        else if (ddltimecat.SelectedValue == "Done")
        {
            cmd.CommandText = "SELECT * FROM joblistview where status='Done'";
        }
        else if (ddltimecat.SelectedValue == "Posted")
        {
            cmd.CommandText = "SELECT * FROM joblistview where status='Posted'";
        }
        else
        {
            cmd.CommandText = "SELECT * FROM joblistview" ;
        }
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_projects");
        lvjobs.DataSource = ds;
        lvjobs.DataBind();
        con.Close();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM joblistview where companyname LIKE '%" + txtSearch.Text + "%'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "joblistview");
        lvjobs.DataSource = ds;
        lvjobs.DataBind();
        con.Close();
    }
}