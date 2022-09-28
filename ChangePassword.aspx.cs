using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text == TextBox1.Text)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = "UPDATE Users SET Password=@Password WHERE " +
                "email=@UsersID";

            cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Helper.CreateHashTag(txtPassword.Text);
            cmd.Parameters.Add("@UsersID", SqlDbType.VarChar).Value = Request.QueryString["email"].ToString();
            cmd.ExecuteNonQuery();
            con.Close();
            ShowPopUpMsg("Password Changed Successfuly!");
            //Response.Redirect("Login.aspx");
        }
        else
        {
            ShowPopUpMsg("Password does not match!");
            return;
        }
        Response.Redirect("Login.aspx");
    }
}