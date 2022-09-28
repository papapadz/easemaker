using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfileAdmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["typeid"].ToString() != "1")
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        if (!IsPostBack)
        {
            //GetInventory();
            if (Session["userid"] != null)
            {
                int productID = 0;
                bool validProduct = int.TryParse(Session["userid"].ToString(), out productID);

                if (validProduct)
                {
                    if (!IsPostBack)
                    {

                        GetInfo(productID);
                    }
                }
                else
                    Response.Redirect("Login.aspx");
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
    
    void GetInfo(int productID)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users WHERE userid=@ProductID ";
        cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = productID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                txtContactPerson.Text = data["personname"].ToString();
                //fuImage.ImageUrl = string.Concat("img/products/", data["Image"].ToString());
                txtEmail.Text = data["email"].ToString();
                txtAddress.Text = data["address"].ToString();
                txtContactNo.Text = data["contactno"].ToString();
                txtPassword.Text= Helper.CreateHashTag(data["password"].ToString());
            }
        }
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;


     
        cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
        " Email=@Email,ContactNo=@ContactNo,Address=@Address,password=@password, status=@status,aboutme=@aboutme WHERE " +
        "userid=@userid";

        

        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        ShowPopUpMsg("Update Succesful!");
    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;



        cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
        " Email=@Email,ContactNo=@ContactNo,Address=@Address,password=@password, status=@status,aboutme=@aboutme WHERE " +
        "userid=@userid";



        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
        cmd.Parameters.AddWithValue("@aboutme", "");
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "My Profile", "Admin Profile Updated!");
        ShowPopUpMsg("Update Succesful!");
    }
}