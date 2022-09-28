using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectManagementView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    public static Stopwatch sw;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Status"].ToString() != "Deliverables Completed")
        {
            divrate.Visible = false;
        }
    
        if (Request.QueryString["ETA"].ToString() != "")
        {
            DateTime today = DateTime.Parse(Request.QueryString["ETA"].ToString());
            Calendar1.TodaysDate = today;
            Calendar1.SelectedDate = Calendar1.TodaysDate;
        }
        if (!IsPostBack)
        {
            Label2.Text = Request.QueryString["ID"].ToString();
            lblPrjname.Text = Request.QueryString["projname"].ToString();
            GetInfo();
            getjobs();
            getjobs2();
            Getnotif();
         
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("filesdownload.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname="+ Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + Request.QueryString["ct"].ToString() + "&tc=" + Request.QueryString["tc"].ToString() + "&eta=" + Request.QueryString["eta"].ToString());
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContractSigningEmployer.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + Request.QueryString["ct"].ToString() + "&tc=" + Request.QueryString["tc"].ToString() + "&eta=" + Request.QueryString["eta"].ToString());
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("filesdownloadinvoice.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + Request.QueryString["ct"].ToString() + "&tc=" + Request.QueryString["tc"].ToString() + "&eta=" + Request.QueryString["eta"].ToString());
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("addrating.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + Request.QueryString["ct"].ToString() + "&tc=" + Request.QueryString["tc"].ToString() + "&eta=" + Request.QueryString["eta"].ToString());
    }

  

    protected void LinkButton5_Click(object sender, EventArgs e)
    {

    }

    protected void Start(object sender, EventArgs e)
    {
      
    }

    protected void Stop(object sender, EventArgs e)
    {
       
    }

    protected void tm1_Tick(object sender, EventArgs e)
    {
        //try
        //{

          
        //catch { };
    }

    protected void LinkButton5_Click1(object sender, EventArgs e)
    {
        Response.Redirect("projectrequirementlist.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString());
    }

    protected void lbprojects2_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProjects.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        getjobs2();
    }
}