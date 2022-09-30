using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getcategory();
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        Response.Redirect("joblistdefault.aspx?ST=" + txtSearch.Text +"&cat=" + ddlCategory.SelectedValue);
    }

    protected void btnCreateAccount(object sender, EventArgs e)
    {

    }
}