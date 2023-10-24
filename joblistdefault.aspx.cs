using Microsoft.Office.Interop.Outlook;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class joblistdefault : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    void Page_PreInit(Object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            SetMasterPage(Session["userid"].ToString());
        } 
            
     
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (!IsPostBack)
            {
                getcategory();

                if (Request.QueryString["ST"] == null || Request.QueryString["ST"].ToString() == "")
                {

                    getjobs();
                }
                else
                {
                    //lblSL.Text = Request.QueryString["ST"].ToString();
                    getjobs2();
                    //lblresults.Text = Request.QueryString["ST"].ToString();
                }

                //clear mycart
                //con.Open();
                //SqlCommand cmd = new SqlCommand();
                //cmd.Connection = con;
                //cmd.CommandText = "DELETE FROM MyCart WHERE UserName = '" + Session["userid"].ToString() + "'";
                //cmd.ExecuteNonQuery();
                //con.Close();

            }

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
    void getjobs()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM joblistview where status = 'Posted'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "joblistview");
        lbprojects.DataSource = ds;
        lbprojects.DataBind();
        con.Close();
    }
    void getjobs2()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM joblistview where jobtitle LIKE '%" + Request.QueryString["ST"].ToString() + "%' and category =" + Request.QueryString["cat"].ToString() + " and status='Posted'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "joblistview");
        lbprojects.DataSource = ds;
        lbprojects.DataBind();
        con.Close();
    }
 
    protected void lstprojects_DataBound(object sender, EventArgs e)
    {
        dpProjects.Visible = dpProjects.PageSize < dpProjects.TotalRowCount;
    }
  
    protected void lstprojects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProjects.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        getjobs();
    }
    protected void lstprojects_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

       
        Response.Redirect("projectview.aspx?ID=" + e.CommandArgument.ToString());
      
    }



    protected void lbprojects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM joblistview where jobtitle LIKE '%" + txtSearch.Text + "%' and status='Posted' and category ='" + ddlCategory.SelectedValue + "'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "joblistview");
        lbprojects.DataSource = ds;
        lbprojects.DataBind();
        con.Close();
    }

    void SetMasterPage(String userID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM Users WHERE UserID=@userid";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            if (data["UserType"].ToString() == "Employer")
            {
                this.MasterPageFile = "~/MasterPageEmployer.master";
            }
            else if (data["UserType"].ToString() == "User")
            {
                this.MasterPageFile = "~/MasterPageUser.master";
            } else
                this.MasterPageFile = "~/MasterPage.master";
        }
        con.Close();
    }
}