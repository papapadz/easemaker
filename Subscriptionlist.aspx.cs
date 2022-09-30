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

    private void Page_PreInit(Object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        
        SetMasterPage(Session["userid"].ToString());

    }

    protected void Page_Load(object sender, EventArgs e)
    {

      

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
        cmd.CommandText = "SELECT * FROM subscription where userid="+ Session["userid"].ToString() + " order by date desc";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "subscription");
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
            if (data["UserType"].ToString() == "Admin")
            {
                this.MasterPageFile = "~/MasterPage.master";
            } else if (data["UserType"].ToString() == "Employer")
            {

                this.MasterPageFile = "~/MasterPageEmployer.master";
            }
            else
            {
                this.MasterPageFile = "~/MasterPageUser.master";
            }

        }
        con.Close();
    }
}