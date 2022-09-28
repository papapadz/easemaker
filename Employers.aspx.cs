using Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
      
        //if (Session["typeid"].ToString() == "101")
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
   
        if (!IsPostBack)
        {
            GetEmployers();
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

    void GetEmployers()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users where usertype='Employer'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvEmployers.DataSource = ds;
        lvEmployers.DataBind();
        con.Close();


    }
    protected void lvEmployers_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpEmployers.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetEmployers();
    }
    void getstuff()
    {
      
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getstuff();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
       
    }

    protected void btnAdd_Click1(object sender, EventArgs e)
    {
    
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users where companyname LIKE '%" + txtSearch.Text + "%' and usertype='Employer'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvEmployers.DataSource = ds;
        lvEmployers.DataBind();
        con.Close();
    }
}