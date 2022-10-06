using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Subscriptionlist : System.Web.UI.Page
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
            Getclients();
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

    void Getclients()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_subscript";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_subscript");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
    }
    protected void lvInventory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpInventory.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        getstuff();
    }
    void getstuff()
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        getstuff();
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_subscript where Companyname LIKE '%" + txtSearch.Text + "%' OR " + "PersonName LIKE '%" + txtSearch.Text + "%'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_subscript");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
    }
}