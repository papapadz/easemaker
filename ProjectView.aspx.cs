using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        GetInfo();
        getjobs();
    }
    void GetInfo()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT *,(CAST(timeframe as varchar(10)) + ' ' + timecat) as timeline FROM joblistview WHERE jobid=@jobid ";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                lblJD.Text = data["jobdescription"].ToString();
                lbltl.Text = data["timeline"].ToString();
                Image2.ImageUrl = string.Concat("img/", data["Image"].ToString());
                lblCN.Text = data["companyname"].ToString();
                //lblEmail.Text = data["email"].ToString();
                //lblAddress.Text = data["address"].ToString();
                //lblC.Text = data["contactno"].ToString();
                lblJT.Text = data["jobtitle"].ToString();
                lblBudget.Text = data["amt"].ToString();

            }
        }
        con.Close();
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
}