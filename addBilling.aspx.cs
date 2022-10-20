using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addBilling : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
      

        if (!IsPostBack)
        {

            add();

        }

    }
    public string add()
    {
        if (Request.QueryString["checkoutid"].ToString()!=null)
        {

            con.Open();
            SqlCommand cmd6 = new SqlCommand();
            cmd6.Connection = con;
            cmd6.CommandText = "INSERT INTO billing (refid,userid,datetime,amount,Purpose,status,checkoutid)"+
                " VALUES (@refid,@userid,@datetime,@amount,@Purpose,@status,@checkoutid)";
            cmd6.Parameters.Add("@refid", SqlDbType.VarChar).Value = Request.QueryString["refno"].ToString();
            cmd6.Parameters.Add("@userid", SqlDbType.VarChar).Value = Session["userid"].ToString();
            cmd6.Parameters.Add("@amount", 100);
            cmd6.Parameters.Add("@datetime", DateTime.Now);
            cmd6.Parameters.Add("@Purpose", "Service Fee");
            cmd6.Parameters.Add("@status", "Pending");
            cmd6.Parameters.Add("@checkoutid", SqlDbType.VarChar).Value = Request.QueryString["checkoutid"].ToString();
            cmd6.ExecuteNonQuery();
            con.Close();
            
            if(Request.QueryString["jobid"] != null)
            {
                con.Open();
                SqlCommand cmd5 = new SqlCommand();
                cmd5.Connection = con;
                cmd5.CommandText = "UPDATE projects SET checkoutid=@checkoutid WHERE jobid=@jobid";
                cmd5.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["jobid"].ToString();
                cmd5.Parameters.Add("@checkoutid", SqlDbType.VarChar).Value = Request.QueryString["checkoutid"].ToString();
                cmd5.ExecuteNonQuery();
                con.Close();
            }
            return "OK";
        }
        return "ERROR";
    }

}