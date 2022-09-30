using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DefaultEmployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        Getnotif();
        Getnotif2();
        Getnotif3();
        Getnotif4();
        Getnotif5();
        Update();
    }
    void Update()
    {
        con.Open();
        SqlCommand cmd6 = new SqlCommand();
        cmd6.Connection = con;

        cmd6.CommandText = "UPDATE subscription SET Status=@Status WHERE Status='Subscribed' and expdate <= getdate()";

       
        cmd6.Parameters.Add("@Status", SqlDbType.VarChar).Value = "Expired";
        cmd6.ExecuteNonQuery();
        con.Close();
    }
    void Getnotif()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter1 FROM joblist where userid=" + Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblPIO.Text = data["counter1"].ToString();

        }
        con.Close();
    }
    void Getnotif2()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter1 FROM joblist where status='Completed' and userid=" + Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            Label2.Text = data["counter1"].ToString();

        }
        con.Close();
    }
    void Getnotif4()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter1 FROM joblist where status!='Done' and status!='Posted'   and userid=" + Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblEval.Text = data["counter1"].ToString();

        }
        con.Close();
    }
    void Getnotif3()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(billingid) as usercount from billing where status='pending' and userid=" + Session["userid"].ToString() ;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            Label2.Text = data["usercount"].ToString();

        }
        con.Close();
    }
    void Getnotif5  ()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter1 FROM joblist where status='Done' and userid=" + Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            Label1.Text = data["counter1"].ToString();

        }
        con.Close();
    }


}