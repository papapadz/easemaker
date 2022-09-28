using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["verified"] != null)
        {
            Div1.Visible = true;
            Session.Remove("invalid");
            //ShowPopUpMsg("Account Verified!");
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM Users " +
            "WHERE Email=@Email AND Password=@Password and status = 'Active'"; //+
        //"AND TypeID!=5";
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {

            while (dr.Read())
            {

                Session["userid"] = dr["UserID"].ToString();
                Session["email"] = dr["Email"].ToString();
                Session["usertype"] = dr["usertype"].ToString();
                Session["personname"] = dr["personname"].ToString();

            }
            error.Visible = false;
            con.Close();

            if ((string)Session["usertype"] == "Admin")
            {
              
                if (Request.QueryString["url"] == null)
                    Response.Redirect("DefaultAdmin.aspx");
                else
                    Response.Redirect(Request.QueryString["url"].ToString());
            }
            else if ((string)Session["usertype"] == "Employer")
            {
               
                if (Request.QueryString["url"] == null)
                    Response.Redirect("defaultemployer.aspx");
                //Response.Redirect("OTP.aspx");
                else
                    Response.Redirect(Request.QueryString["url"].ToString());
            }
            else if ((string)Session["usertype"] == "User")
            {
                if (Request.QueryString["url"] == null)
                    Response.Redirect("default2.aspx");
                //Response.Redirect("OTP.aspx");
                else
                    Response.Redirect(Request.QueryString["url"].ToString());

            }
           

        }
        else
        {

            con.Close();

            error.Visible = true;

            //Session["invalid"] = "yes";
            //Response.Redirect("Login.aspx");
        }
    }
}