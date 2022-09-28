using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectManagementViewfreelancer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    public static Stopwatch sw;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Status"].ToString() != "Deliverables Completed")
        {
            divrate.Visible = false;
        }
        if (Request.QueryString["Status"].ToString() == "Done")
        {
            divtime.Visible = false;
        }
        if (Request.QueryString["ETA"].ToString() != "")
        {
            DateTime today = DateTime.Parse(Request.QueryString["ETA"].ToString());
            Calendar1.TodaysDate = today;
            Calendar1.SelectedDate = Calendar1.TodaysDate;
        }
        //Calendar1.SelectedDate = DateTime.Today;
        if (!IsPostBack)
        {
            Label2.Text = Request.QueryString["ID"].ToString();
            lblPrjname.Text = Request.QueryString["projname"].ToString();
            GetInfo();
            getjobs();
            getjobs2();
            Getnotif();
       
            btnStop.Enabled = false;
            sw = new Stopwatch();
        }
    }
    void Getnotif()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT sum(total) as counter1 FROM vw_trackerhrs where  jobid=" + Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            lbltotalhrs.Text = data["counter1"].ToString();

        }
    }
    void GetInfo()
    {

        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "SELECT *,(CAST(timeframe as varchar(10)) + ' ' + timecat) as timeline FROM joblistview WHERE jobid=@jobid ";
        //cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        //SqlDataReader data = cmd.ExecuteReader();
        //while (data.Read())
        //{
        //    {
              

        //    }
        //}
        //con.Close();
    }
    protected void lbprojects_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //dpProjects.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //getjobs();
    }
    void getjobs()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM projreq where jobid=" + Request.QueryString["ID"].ToString();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "projreq");
        lbprojects.DataSource = ds;
        lbprojects.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("filesupload.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname="+ Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ETA=" + Request.QueryString["eta"].ToString());
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContractSigningFreelancer.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ETA=" + Request.QueryString["eta"].ToString());
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("filesuploadinvoice.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ETA=" + Request.QueryString["eta"].ToString());
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("addratingemployer.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ETA=" + Request.QueryString["eta"].ToString());
    }
    protected void Start(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO timetracker (jobid,timestart,timeend,datetime) VALUES (@jobid,@timestart,@timeend,@datetime)";
        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        cmd.Parameters.AddWithValue("@timestart", DateTime.Now.ToShortTimeString());
        cmd.Parameters.AddWithValue("@timeend", DBNull.Value);
        cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
        sw.Reset();
        sw.Start();
        btnStart.Enabled = false;
        btnStop.Enabled = true;
    }

    protected void Stop(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "with cte as (select top (1)(timeend) from timetracker where jobid = @jobid order by datetime desc) update cte set timeend =@timeend";
        cmd.Parameters.Add("@timeend", SqlDbType.VarChar).Value = DateTime.Now.ToShortTimeString();
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.ExecuteNonQuery();
        con.Close();
        sw.Stop();
        Getnotif();
        btnStop.Enabled = false;
        btnStart.Enabled = true;
    
    }

    protected void tm1_Tick(object sender, EventArgs e)
    {
        //try
        //{

        long sec = sw.Elapsed.Seconds;
        long min = sw.Elapsed.Minutes;
        if (min < 10)
            Label1.Text = "0" + min;
        else
            Label1.Text = min.ToString();
        Label1.Text += " : ";
        if (sec < 10)
            Label1.Text += "0" + sec;
        else
            Label1.Text += sec.ToString();

        //}
        //catch { };
    }
    void getjobs2()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM timetracker where jobid=" + Request.QueryString["ID"].ToString() + " order by timeid asc";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "timetracker");
        ListView1.DataSource = ds;
        ListView1.DataBind();
        con.Close();
    }
    protected void lbprojects2_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProjects.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        getjobs2();
    }
}