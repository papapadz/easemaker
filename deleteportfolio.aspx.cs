using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deleteportfolio : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "DELETE FROM portfolio WHERE portfolioid=@portfolioid";
            cmd.Parameters.Add("@portfolioid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Myportfolio.aspx");
        }
    }
}