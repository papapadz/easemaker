using OfficeOpenXml.FormulaParsing.Excel.Functions.DateTime;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectManagementLanding : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    private String hlink1;
    private String hlink2;

    void Page_PreInit(Object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["UserID"] == null || Session["UserLevel"].ToString() == "Customer")
        //{
        //    Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            SetMasterPage(Session["userid"].ToString());
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["UserID"] == null || Session["UserLevel"].ToString() == "Customer")
        //{
        //    Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            SetInfo(Session["userid"].ToString());
        }
    }

    void SetInfo(String userID)
    {
        hyperlink1.NavigateUrl = this.hlink1;
        hyperlink2.NavigateUrl = this.hlink2;

    }

    void SetMasterPage(String userID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM Users WHERE UserID=@userid";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            if (data["UserType"].ToString() == "Employer")
            {
                this.hlink1 = "ProjectManagement.aspx?status=On-Going";
                this.hlink2 = "ProjectManagement.aspx?status=Completed";
                this.MasterPageFile = "~/MasterPageEmployer.master";
            }
            else
            {
                this.hlink1 = "ProjectManagementFreelancer.aspx?status=On-Going";
                this.hlink2 = "ProjectManagementFreelancer.aspx?status=Completed";
                this.MasterPageFile = "~/MasterPageUser.master";
            }

        }
        con.Close();
    }
}