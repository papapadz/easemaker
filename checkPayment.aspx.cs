using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkPayment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM billing " +
            "WHERE userid=@userid AND datepaid IS NULL"; //+
        //"AND TypeID!=5";
        cmd.Parameters.AddWithValue("@userid", Request.QueryString["userid"].ToString());

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txt1.Text = dr["checkoutid"].ToString();
            }
        }
        con.Close();

        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "check();", true);
    }

    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
}