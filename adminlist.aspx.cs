using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminlist : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        } else
        {
            if (Session["usertype"].ToString() != "Admin")
            {

                Response.Redirect("DefaultAdmin.aspx");
            }
        }

        

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
        cmd.CommandText = "SELECT * FROM users where usertype='Admin'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
    }
    protected void lvInventory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpInventory.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        Getclients();
    }




    protected void Button1_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users where PersonName LIKE '%" + txtSearch.Text + "%' and UserType='Admin'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
    }
}