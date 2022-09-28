using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    
        if (Request.QueryString["ID"] != null)
        {
            int ProjectID = 0;
            bool isValid = int.TryParse(Request.QueryString["ID"].ToString(), out ProjectID);
            if (isValid)
            {
                if (!IsPostBack)
                {
                    GetInfo(ProjectID);
                 

                }
            }
            else
                Response.Redirect("categorylist.aspx");
        }
        else
            Response.Redirect("categorylist.aspx");
    }
 

    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM category WHERE categoryid=@categoryid";
        cmd.Parameters.Add("@categoryid", SqlDbType.Int).Value = ID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            txtContactPerson.Text = data["CategoryName"].ToString();
        }
        con.Close();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE category SET CategoryName=@CategoryName WHERE " +
            "categoryid=@categoryid";
        cmd.Parameters.Add("@CategoryName", SqlDbType.VarChar).Value = txtContactPerson.Text;
        cmd.Parameters.Add("@categoryid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("categorylist.aspx");
 
    }
}