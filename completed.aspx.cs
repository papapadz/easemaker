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


        if (Request.QueryString["status"].ToString() == "Uploaded_Payment")
        {
          
            con.Open();
            SqlCommand cmd6 = new SqlCommand();
            cmd6.Connection = con;
            if (Request.QueryString["Purpose"].ToString() == "Subscription")
            {
                cmd6.CommandText = "UPDATE billing SET Status=@Status WHERE billingid=@billingid;WITH C AS(SELECT TOP (1) userid, status,subscriptionid FROM subscription ORDER BY subscriptionid desc) UPDATE C SET Status=@Status2 where userid=@userid";
            }
            else
            {
                cmd6.CommandText = "UPDATE billing SET Status=@Status WHERE billingid=@billingid;UPDATE projects SET Status=@Status1 WHERE jobid=@jobid;UPDATE joblist SET Status=@Status1 WHERE jobid=@jobid";
            }
            cmd6.Parameters.Add("@userid", SqlDbType.VarChar).Value = Request.QueryString["UID"].ToString();
            cmd6.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["JID"].ToString();
            cmd6.Parameters.Add("@Status1", SqlDbType.VarChar).Value = "On-Going";
            cmd6.Parameters.Add("@Status2", SqlDbType.VarChar).Value = "Subscribed";
            cmd6.Parameters.Add("@Status", SqlDbType.VarChar).Value = "Completed";
            cmd6.Parameters.Add("@billingid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
            cmd6.ExecuteNonQuery();
            con.Close();

            Response.Redirect("billinglist.aspx");
        }
        else
        {
            Response.Redirect("billinglist.aspx");
        }

    }
}