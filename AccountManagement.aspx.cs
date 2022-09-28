using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountManagement : System.Web.UI.Page
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
            GetAccounts();
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

    void GetAccounts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users where usertype='User'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvaccounts.DataSource = ds;
        lvaccounts.DataBind();
        con.Close();
    }
    protected void lvaccounts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpAccounts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetAccounts();
    }




    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users where PersonName LIKE '%" + txtSearch.Text + "%' and UserType='User'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvaccounts.DataSource = ds;
        lvaccounts.DataBind();
        con.Close();
    }
}