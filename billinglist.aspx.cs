using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class billinglist : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    private string role;
    private string query = "SELECT * FROM vw_billing";

    void Page_PreInit(Object sender, EventArgs e)
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
            SetMasterPage(Session["userid"].ToString());
        }
    }

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
            role = data["UserType"].ToString();
            if (data["UserType"].ToString() == "Employer")
            {
                query = "SELECT * FROM vw_billing where userid=" + userID;
                this.MasterPageFile = "~/MasterPageEmployer.master";
            } 
            else if(data["UserType"].ToString() == "User") 
            {
                query = "SELECT * FROM vw_billing where userid=" + userID;
                this.MasterPageFile = "~/MasterPageUser.master";
            } else
                query = "SELECT * FROM vw_billing";
        }
        con.Close();
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
        cmd.CommandText = query;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_billing");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
    }
    protected void lvInventory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpInventory.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        Getclients();
    }



    protected void ddltimecat_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        if (ddltimecat.SelectedValue == "Pending" || ddltimecat.SelectedValue == "Completed")
        {
            if (role == "Admin")
                cmd.CommandText = "SELECT * FROM vw_billing where status='" + ddltimecat.SelectedValue + "'";
            else
                cmd.CommandText = "SELECT * FROM vw_billing where userid=" + Session["userid"].ToString() + " and status='" + ddltimecat.SelectedValue + "'";
        }
        else
        {
            if (role == "Admin")
                cmd.CommandText = "SELECT * FROM vw_billing";
            else
                cmd.CommandText = "SELECT * FROM vw_billing where userid=" + Session["userid"].ToString();
        }
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_billing");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
    }
}