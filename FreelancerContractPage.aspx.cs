using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FreelancerContractPage : System.Web.UI.Page
{
  
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {

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
            "WHERE jobid =@jobid";
        cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
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
        cmd.CommandText = "INSERT INTO contracts (jobid,jobid,filename,date,status,userid) VALUES (@jobid,@jobid,@filename,@date,@status,@userid)";

        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@filename", "~/img/" + id + ".png");

        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@status", "Pending");
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect(".aspx");
        if (Request.QueryString["pt"].ToString() == "")
        {
            Response.Redirect("~/Customer/ContractSigning.aspx?ID=" + Request.QueryString["ID"].ToString());
        }
        else if (Request.QueryString["pt"].ToString() == "")
        {
            Response.Redirect("~/Customer/ContractSigning.aspx?ID=" + Request.QueryString["ID"].ToString());
        }
    }
}