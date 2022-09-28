using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContractSigningEmployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetInfo();
            GetInfo2();
            GetInfo2();
        }
    }
    void GetInfo3()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM projects WHERE jobid=@jobid ";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                if (data["startdate"].ToString() != "")
                {
                    lblDate.Text = data["startdate"].ToString();
                }
                else
                {
                    lblDate.Text = DateTime.Now.ToShortDateString();
                }
                //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());


                //txtaboutme.Text = data["aboutme"].ToString();
            }
        }
        con.Close();
    }
    void GetInfo2()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_getemployer WHERE jobid=@jobid and userid=@userid";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                lblEmployerAddress.Text = data["address"].ToString();
                lblEmployername.Text = data["Companyname"].ToString();
                imgSignClient.ImageUrl = string.Concat("img/", data["filename"].ToString());
                lblDateEmployer.Text = data["date"].ToString();
                lblemployer.Text = data["Companyname"].ToString();
                //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());


                //txtaboutme.Text = data["aboutme"].ToString();
            }
        }
        con.Close();
    }
    void GetInfo()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_getfreelancer2 WHERE jobid=@jobid";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                lblFreelanceaddress.Text = data["address"].ToString();
                lblFreelancename.Text = data["personname"].ToString();
                lblFreelancer.Text = data["personname"].ToString();
                lblDateFreelancer.Text = data["date"].ToString();
                lblFreelancename.Text = data["personname"].ToString();

                Image1.ImageUrl = string.Concat("img/", data["filename"].ToString());
                //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());


                //txtaboutme.Text = data["aboutme"].ToString();
            }
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM contracts " +
            "WHERE jobid =@jobid and userid=@userid";
        cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        cmd3.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Already signed!");
            con.Close();

            return;
        }
        con.Close();
        byte[] bytes = Convert.FromBase64String(ImageVal.Value.Split(',')[1]);
        string id = Guid.NewGuid().ToString();
        using (FileStream stream = new FileStream(Server.MapPath("~/img/" + id + ".png"), FileMode.Create))
        {
            stream.Write(bytes, 0, bytes.Length);
            stream.Flush();
        }






        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO contracts (jobid,filename,date,status,userid) VALUES (@jobid,@filename,@date,@status,@userid)";

        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@filename", id + ".png");

        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@status", "Pending");
        cmd.ExecuteNonQuery();
        con.Close();
        //Response.Redirect("projectmanagement.aspx");
        ShowPopUpMsg("Sign Completed!");
        GetInfo();
        GetInfo2();
        GetInfo2();
        //if (Request.QueryString["pt"].ToString() == "")
        //{
        //    Response.Redirect("~/Customer/ContractSigning.aspx?ID=" + Request.QueryString["ID"].ToString());
        //}
        //else if (Request.QueryString["pt"].ToString() == "")
        //{
        //    Response.Redirect("~/Customer/ContractSigning.aspx?ID=" + Request.QueryString["ID"].ToString());
        //}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM billing " +
            "WHERE refid =@jobid and status!='Completed'";
        cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("Freelancer hasn't Paid!");
            con.Close();

            return;
        }
        if (Request.QueryString["status"].ToString() == "Done")
        {
            ShowPopUpMsg("This Project is already done!");
            con.Close();
            return;
        }
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE joblist SET status=@status2 WHERE jobid=@jobid;UPDATE projects SET status=@status2,startdate=@startdate,eta=@eta WHERE jobid=@jobid";


        if (Request.QueryString["tc"].ToString() == "Days")
        {
            DateTime eta = DateTime.Now.AddDays(int.Parse(Request.QueryString["ct"].ToString()));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
        else if (Request.QueryString["tc"].ToString() == "Months")
        {
            DateTime eta = DateTime.Now.AddMonths(int.Parse(Request.QueryString["ct"].ToString()));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
        else if (Request.QueryString["tc"].ToString() == "Years")
        {
            DateTime eta = DateTime.Now.AddYears(int.Parse(Request.QueryString["ct"].ToString()));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }

        cmd.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = "On-Going";
        cmd.Parameters.Add("@Status2", SqlDbType.VarChar).Value = "On-Going";
        cmd.Parameters.Add("@startdate", SqlDbType.DateTime).Value = DateTime.Now;
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["userid"].ToString();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("projectmanagement.aspx");
       // Response.Redirect("projectmanagementview.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + Request.QueryString["ct"].ToString() + "&tc=" + Request.QueryString["tc"].ToString() + "&eta=" + Request.QueryString["eta"].ToString());
    }
}