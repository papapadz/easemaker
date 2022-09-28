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
        if (Request.QueryString["email"] == null)
            Response.Redirect("Login.aspx");
        else
        {
            if (!IsPostBack)
            {
                UpdateStatus();
            }
        }
    }
    void UpdateStatus()
    {
        con.Open();
        SqlCommand cmd6 = new SqlCommand();
        cmd6.Connection = con;
        cmd6.CommandText = "UPDATE Users SET Status=@Status WHERE Email=@email";
        cmd6.Parameters.Add("@Status", SqlDbType.VarChar).Value = "Email Verified";
        cmd6.Parameters.Add("@email", SqlDbType.VarChar).Value = Request.QueryString["email"].ToString();
        cmd6.ExecuteNonQuery();
        con.Close();
        Session["verified"] = "yes";
        Response.Redirect("Login.aspx");
    }
}