using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerifyApplicant : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["email"] == null)
        //    Response.Redirect("Login.aspx");
        //else
        //{
            if (!IsPostBack && Request.QueryString["flag"]!=null)
            {
                UpdateStatus();
            }
        //}
    }
    void UpdateStatus()
    {
        string flag = Request.QueryString["flag"];
        string status = "Inactive";

        if (flag == "1")
            status = "Active";
        
        con.Open();
        SqlCommand cmd6 = new SqlCommand();
        cmd6.Connection = con;
        cmd6.CommandText = "UPDATE Users SET Status=@Status WHERE userid=@userid";
        cmd6.Parameters.Add("@Status", SqlDbType.VarChar).Value = status;
        cmd6.Parameters.Add("@userid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd6.ExecuteNonQuery();
        con.Close();
        //Session["verified"] = "yes";
        if (Request.QueryString["UT"].ToString() == "Employer")
        {
            Response.Redirect("employers.aspx");
        }
        else
        {
            Response.Redirect("accountmanagement.aspx");
        }
    }
}