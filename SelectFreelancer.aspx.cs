using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectFreelancer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userid"] == null)
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}

        if (Request.QueryString["ID"] != null)
        {
            int ProductID = 0;
            bool isValid = int.TryParse(Request.QueryString["ID"].ToString(), out ProductID);
            if (isValid)
            {
                if (!IsPostBack)
                    GetInfo(ProductID);
                Textbox1.Text = Request.QueryString["po"].ToString();

            }
            else
                Response.Redirect("joblist.aspx");
        }
        else
            Response.Redirect("joblist.aspx");
    }
    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users WHERE userid=@userid";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = ID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            txtContactPerson.Text = data["personname"].ToString();
        }
        con.Close();
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
        SqlCommand cmd4 = new SqlCommand();
        cmd4.Connection = con;
        cmd4.CommandText = "SELECT top (1)* FROM subscription WHERE userid=@userid and Status='Subscribed'";
        cmd4.Parameters.AddWithValue("@userid", Request.QueryString["ID2"].ToString());
        //cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["JID"].ToString());
        SqlDataReader dr3 = cmd4.ExecuteReader();

        if (dr3.HasRows)
        {
            //ShowPopUpMsg("You can only start a project once! Please Subscribe to start more!");
            con.Close();
        }

        else
        {
            //ShowPopUpMsg("You can only start a project once! Please Subscribe to start more!");
            con.Close();
            dr3.Close();
            //return;

            con.Open();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.Connection = con;
            cmd5.CommandText = "SELECT * FROM project WHERE Status!='Done'";
            cmd5.Parameters.AddWithValue("@userid", Request.QueryString["ID2"].ToString());
            //cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["JID"].ToString());
            SqlDataReader dr = cmd4.ExecuteReader();

            if (dr.HasRows)
            {
                ShowPopUpMsg("You can only start a project once! Please Subscribe to start more!");
                con.Close();
                return;
            }

            //dr3.Close();
            //return;
        }
        con.Close();
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM projects " +
            "WHERE userid=@userid and status!='Done'";
        cmd3.Parameters.AddWithValue("@userid", Request.QueryString["ID"].ToString());
        //cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["JID"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("This Freelancer is currently have an on-going project!");
            con.Close();

            return;
        }
        con.Close();


        //max and critical


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO projects (jobid,userid,status,datetime,startdate,enddate,eta,remarks) VALUES (@jobid,@userid,@status,@datetime,@startdate,@enddate,@eta,@remarks);INSERT INTO billing (refid,userid,amount,Purpose,status,datetime,image,dateuploaded) VALUES (@jobid,@userid,@amount,@Purpose,@status,@datetime,@image,@dateuploaded)";
        cmd.Parameters.AddWithValue("@userid", Request.QueryString["ID"].ToString());
        cmd.Parameters.AddWithValue("@userid2", Request.QueryString["ID2"].ToString());
        cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
        cmd.Parameters.AddWithValue("@startdate", DBNull.Value);
        cmd.Parameters.AddWithValue("@enddate", DBNull.Value);
        cmd.Parameters.AddWithValue("@dateuploaded", DBNull.Value);
        cmd.Parameters.AddWithValue("@image", "");
        cmd.Parameters.AddWithValue("@amount", "100.00");
        cmd.Parameters.AddWithValue("@purpose", "Project Payment");
        cmd.Parameters.AddWithValue("@eta", DBNull.Value);
        cmd.Parameters.AddWithValue("@remarks", txtRemarks.Text);
        cmd.Parameters.AddWithValue("@Status", "Pending");
        cmd.Parameters.AddWithValue("@orderid", Request.QueryString["ID"].ToString());
        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["JID"].ToString());
        cmd.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "UPDATE joblist SET status='Applicant Selected' WHERE " +
            "jobid=@jobid";
        cmd2.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["JID"].ToString();
        cmd2.ExecuteNonQuery();
   
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "Selection", "Freelancer Selected");
        Response.Redirect("ProjectManagement.aspx");
    }
}