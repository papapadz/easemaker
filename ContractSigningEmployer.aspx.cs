using OfficeOpenXml.FormulaParsing.Excel.Functions.DateTime;
using PayPal.Api;
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

    public string projStatus;
    public string tc;
    public string ct;
    public string billAmt;
    public string freelancerid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        } else
        {
            
                GetInfo();
                GetInfo2();
                GetInfo3();
            
        }
        
    }
    void GetInfo3()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) projects.*, joblist.timecat, joblist.amt, joblist.timeframe FROM projects JOIN joblist ON joblist.jobid = projects.jobid WHERE projects.jobid=@jobid";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            projStatus = data["status"].ToString();
            tc = data["timecat"].ToString();
            ct = data["timeframe"].ToString();
            billAmt = data["amt"].ToString();

                if (data["startdate"].ToString() == "" || data["startdate"].ToString() == null)
                {

                    lblDate.Text = DateTime.Now.ToShortDateString();
                }
                else
                {
                lblDate.Text = data["startdate"].ToString();
                Button1.Visible = false;

            }
                //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());


                //txtaboutme.Text = data["aboutme"].ToString();
            
        }
        con.Close();
    }
    void GetInfo2()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM vw_getemployer WHERE jobid=@jobid and userid=@userid";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        if(data.HasRows)
        {
            divSignature.Visible = false;
            while (data.Read())
            {
                {
                    lblEmployerAddress.Text = data["address"].ToString();
                    lblEmployername.Text = data["Companyname"].ToString();
                    imgSignClient.ImageUrl = string.Concat("img/", data["filename"].ToString());
                    lblDateEmployer.Text = data["date"].ToString();
                    lblemployer.Text = data["Companyname"].ToString();
                    //imgSignClient.ImageUrl = string.Concat("img/", data["Image"].ToString());


                    //txtaboutme.Text = data["aboutme"].ToString();
                }
            }
        } else
            divSignature.Visible = true;
        con.Close();
    }
    void GetInfo()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "SELECT TOP(1) * FROM vw_getfreelancer WHERE jobid=@jobid and userid=@userid";
        cmd.CommandText = "SELECT TOP(1) * FROM vw_applicant WHERE jobid=@jobid and status='Done'";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                {

                    freelancerid = data["userID"].ToString();
                    lblFreelanceaddress.Text = data["address"].ToString();
                    lblFreelancename.Text = data["personname"].ToString();
                    lblFreelancer.Text = data["personname"].ToString();
                    //lblDateFreelancer.Text = data["date"].ToString();
                    //lblFreelancename.Text = data["personname"].ToString();
                    //Image1.ImageUrl = string.Concat("img/", data["filename"].ToString());
                    //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());


                    //txtaboutme.Text = data["aboutme"].ToString();
                }
            }
        }
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        //cmd.CommandText = "SELECT TOP(1) * FROM vw_getfreelancer WHERE jobid=@jobid and userid=@userid";
        cmd2.CommandText = "SELECT TOP(1) * FROM contracts LEFT JOIN Users ON dbo.Users.userID = contracts.userid WHERE jobid=@jobid and Users.userid=@userid";
        cmd2.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        cmd2.Parameters.Add("@userid", SqlDbType.Int).Value = freelancerid;
        SqlDataReader data2 = cmd2.ExecuteReader();
        if (data2.HasRows)
        {
            divSignature.Visible = false;
            while (data2.Read())
            {
                {
                    //lblFreelanceaddress.Text = data["address"].ToString();
                    //lblFreelancename.Text = data["personname"].ToString();
                    //lblFreelancer.Text = data["personname"].ToString();
                    lblDateFreelancer.Text = data2["date"].ToString();
                    //lblFreelancename.Text = data["personname"].ToString();
                    Image1.ImageUrl = string.Concat("img/", data2["filename"].ToString());
                    //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());


                    //txtaboutme.Text = data["aboutme"].ToString();
                }
            }
        }
        else
            divSignature.Visible = true;

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
        if (projStatus == "Done")
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


        if (tc == "Days")
        {
            DateTime eta = DateTime.Now.AddDays(int.Parse(ct));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
        else if (tc == "Months")
        {
            DateTime eta = DateTime.Now.AddMonths(int.Parse(ct));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
        else if (tc == "Years")
        {
            DateTime eta = DateTime.Now.AddYears(int.Parse(ct));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }

        cmd.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = "On-Going";
        cmd.Parameters.Add("@Status2", SqlDbType.VarChar).Value = "On-Going";
        cmd.Parameters.Add("@startdate", SqlDbType.DateTime).Value = DateTime.Now;
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["userid"].ToString();
        cmd.ExecuteNonQuery();
        con.Close();

        /** Bill Employer **/
        DateTime now = DateTime.Now;
        con.Open();
        SqlCommand cmd6 = new SqlCommand();
        cmd6.Connection = con;
        cmd6.CommandText = "INSERT INTO billing (refid,userid,datetime,amount,Purpose,status,checkoutid)" +
            " VALUES (@refid,@userid,@datetime,@amount,@Purpose,@status,@checkoutid)";
        cmd6.Parameters.Add("@refid", SqlDbType.VarChar).Value = now.ToFileTime();
        cmd6.Parameters.Add("@userid", SqlDbType.VarChar).Value = Session["userid"].ToString();
        cmd6.Parameters.Add("@amount", SqlDbType.Decimal).Value = billAmt;
        cmd6.Parameters.Add("@datetime", now);
        cmd6.Parameters.Add("@Purpose", "Project Payment");
        cmd6.Parameters.Add("@status", "Pending");
        cmd6.Parameters.Add("@checkoutid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd6.ExecuteNonQuery();
        con.Close();

        Response.Redirect("projectmanagement.aspx?status=On-Going");
       // Response.Redirect("projectmanagementview.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + projStatus + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + ct + "&tc=" + tc + "&eta=" + Request.QueryString["eta"].ToString());
    }
}