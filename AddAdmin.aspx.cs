using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddAdmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userid"] == null)
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        //if (Session["usertype"].ToString() != "Admin")
        //{
        //    Session.Clear();
        //    Response.Redirect("DefaultAdmin.aspx");
        //}
        if (!IsPostBack)
        {

            //GetCategories();
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

    }

    protected void btnReg_Click(object sender, EventArgs e)
    {

        //name
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM Users " +
            "WHERE email =@ProductName and usertype='Admin'";
        cmd3.Parameters.AddWithValue("@ProductName", this.txtEmail.Text);
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Email already in use!");
            con.Close();

            return;
        }
        con.Close();


        //max and critical


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO users (Companyname,PersonName,Email,ContactNo,Address,Password,status,UserType,aboutme,image,registerdate,updatedate,birthday,gender) VALUES (@Companyname,@PersonName, @Email,@ContactNo, @address,@password, " +
             "@status, @usertype,@aboutme,@image,@registerdate,@updatedate,@birthday,@gender)";
        cmd.Parameters.AddWithValue("@Image", "");
        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Companyname", "");
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
        cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.Parameters.AddWithValue("@registerdate", DateTime.Now);
        cmd.Parameters.AddWithValue("@updatedate", "");
        cmd.Parameters.AddWithValue("@birthday", "");
        cmd.Parameters.AddWithValue("@gender", "");
        cmd.ExecuteNonQuery();
        con.Close();
        //Helper.AddLog(Session["userid"].ToString(), "Add Admin", "Added and admin user");
        Response.Redirect("adminlist.aspx");
    }
}