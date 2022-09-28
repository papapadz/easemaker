using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApplicantList : System.Web.UI.Page
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
            Label1.Text = Request.QueryString["ID"].ToString();
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
        //if (Request.QueryString["ID"] == null)
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;
        //    cmd.CommandText = "SELECT * FROM vw_applicants where clientid=" + Session["userid"].ToString();
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds, "vw_applicants");
        //    lvInventory.DataSource = ds;
        //    lvInventory.DataBind();
        //    con.Close();
        //}
        //else
        //{
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM vw_applicant where jobid=" + Request.QueryString["ID"].ToString();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "vw_applicant");
            lvInventory.DataSource = ds;
            lvInventory.DataBind();
            con.Close();
        //}
    }
    protected void lvInventory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpInventory.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        Getclients();
    }
   

   
}