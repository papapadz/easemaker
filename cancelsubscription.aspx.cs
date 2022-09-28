using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class completed : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
      

        if (!IsPostBack)
        {
            UpdateStatus();
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
    void UpdateStatus()
    {


      
          
            con.Open();
            SqlCommand cmd6 = new SqlCommand();
            cmd6.Connection = con;
           
                cmd6.CommandText = "UPDATE subscription SET Status=@Status WHERE subscriptionid=@subscriptionid";
            
      
            cmd6.Parameters.Add("@Status", SqlDbType.VarChar).Value = "Expired";
            cmd6.Parameters.Add("@subscriptionid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
            cmd6.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Subscriptionlist.aspx");
      

    }
}