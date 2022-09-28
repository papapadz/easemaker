using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deleteprojectlist : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["status"].ToString() == "Posted" || Request.QueryString["status"].ToString() == "Pending")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "DELETE FROM joblist WHERE jobid=@jobid";
                cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("joblist.aspx");
            }
            else
            {
                Response.Redirect("joblist.aspx");
            }
        }
    }
}