using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for Class1
/// </summary>

public partial class checkOutSuccess : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    
    protected void Page_Load(object sender, EventArgs e)
    {
        update();

    }

    public void update()
    {
        if (Request.QueryString["checkoutid"].ToString() != null && Request.QueryString["datepaid"].ToString() != null)
        {

            con.Open();
            SqlCommand cmd6 = new SqlCommand();
            cmd6.Connection = con;
            cmd6.CommandText = "UPDATE billing SET Status=@Status1, datepaid=@datepaid WHERE checkoutid=@checkoutid;UPDATE subscription SET Status=@Status2, datepaid=@datepaid WHERE checkoutid=@checkoutid;";
            cmd6.Parameters.Add("@checkoutid", SqlDbType.VarChar).Value = Request.QueryString["checkoutid"].ToString();
            cmd6.Parameters.Add("@datepaid", SqlDbType.VarChar).Value = Request.QueryString["datepaid"].ToString();
            cmd6.Parameters.Add("@Status1", SqlDbType.VarChar).Value = "Completed";
            cmd6.Parameters.Add("@Status2", SqlDbType.VarChar).Value = "Subscribed";
            cmd6.ExecuteNonQuery();
            con.Close();
        }
        Response.Redirect("billinglist.aspx");
    }
}
