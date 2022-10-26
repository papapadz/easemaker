using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DefaultAdmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        Getnotif();
        Getnotif3();
        Getnotif4();
        Getnotif5();
        Getnotif6();
        Getnotif7(); 
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
        cmd.CommandText = "SELECT Count(billingid) as counter1 FROM billing where status='Pending'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblB.Text = data["counter1"].ToString();

        }
        con.Close();
    }
    void Getnotif2()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(subscriptionid) as counter1 FROM subscription where status='Pending'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblP.Text = data["counter1"].ToString();

        }
        con.Close();
    }
    void Getnotif3()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(userid) as counter1 FROM users where status='For Verification' and usertype='User'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblF.Text = data["counter1"].ToString();

        }
        con.Close();

    }
    void Getnotif4()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(userid) as counter1 FROM users where status='For Verification' and usertype='Employer'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblE.Text = data["counter1"].ToString();

        }
        con.Close();
    }
    void Getnotif5()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter1 FROM joblist where status='Done'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblCP.Text = data["counter1"].ToString();
        }
        con.Close();
    }
    void Getnotif6()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter2 FROM joblist where status='Posted'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblPP.Text = data["counter2"].ToString();
        }
        con.Close();
    }
    void Getnotif7()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Count(jobid) as counter3 FROM joblist where status!='Done' and status!='Posted'";
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lblOP.Text = data["counter3"].ToString();
        }
        con.Close();
    }

}