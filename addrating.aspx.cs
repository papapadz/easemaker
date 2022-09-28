using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addrating : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userid"] == null)
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        //if (Session["usertype"].ToString() != "Admin")
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        if (!IsPostBack)
        {
         
            Label1.Text = Request.QueryString["ID"].ToString();
            txtContactPerson.Text = Request.QueryString["name"].ToString();
            //GetCategories();
            GetInfo();
        }
    }
    void GetInfo()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_rating WHERE jobid=@jobid ";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                //lblRating.Text = data["rating"].ToString();
                Image2.ImageUrl = string.Concat("img/", data["image"].ToString());
                lblComment.Text = data["comment"].ToString();
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




    protected void btnReg_Click(object sender, EventArgs e)
    {

        //name
        con.Open();
        SqlCommand cmd3 = new SqlCommand();
        cmd3.Connection = con;
        cmd3.CommandText = "SELECT * FROM rating " +
            "WHERE jobid =@jobid";
        cmd3.Parameters.AddWithValue("@jobid", this.Request.QueryString["ID"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            //ShowPopUpMsg("You already added a Rating!");
            con.Close();
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandText = "UPDATE rating SET datetime=@datetime,comment=@comment,rating=@rating WHERE jobid=@jobid;UPDATE joblist SET status=@status2 WHERE jobid=@jobid;UPDATE projects SET status=@status2,enddate=@datetime WHERE jobid=@jobid";
            cmd2.Parameters.AddWithValue("@rating", ddlund.SelectedValue);
            cmd2.Parameters.AddWithValue("@status2", "Done");

            cmd2.Parameters.AddWithValue("@comment", txtComment.Text);
            cmd2.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
            cmd2.Parameters.AddWithValue("@datetime", DateTime.Now);
            cmd2.ExecuteNonQuery();
            con.Close();
            ShowPopUpMsg("Rating Successfully Updated! ");
            //return;
        }
        con.Close();


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO rating (jobid,datetime,comment,rating) VALUES (@jobid,@datetime,@comment,@rating);UPDATE joblist SET status=@status2 WHERE jobid=@jobid;UPDATE projects SET status=@status2,enddate=@datetime WHERE jobid=@jobid";
        cmd.Parameters.AddWithValue("@rating", ddlund.SelectedValue);
        cmd.Parameters.AddWithValue("@status2", "Done");
      
        cmd.Parameters.AddWithValue("@comment", txtComment.Text);
        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "Rating", "Added rating");
        ShowPopUpMsg("Rating Successfully Added! ");
        GetInfo();
        //Response.Redirect("projectmanagement.aspx");
    }

    protected void ddlund_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int und = int.Parse(ddlund.SelectedValue);
        //int com = int.Parse(ddlCom.SelectedValue);
        //int kno = int.Parse(ddlkno.SelectedValue);
        //int flex = int.Parse(ddlFlex.SelectedValue);
        //int exp = int.Parse(ddlExp.SelectedValue);

        //int total = (und + com + kno + flex + exp) / 5;
        //txtTotal.Text = total.ToString();
    }

    protected void ddlCom_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int und = int.Parse(ddlund.SelectedValue);
        //int com = int.Parse(ddlCom.SelectedValue);
        //int kno = int.Parse(ddlkno.SelectedValue);
        //int flex = int.Parse(ddlFlex.SelectedValue);
        //int exp = int.Parse(ddlExp.SelectedValue);

        //int total = (und + com + kno + flex + exp) / 5;
        //txtTotal.Text = total.ToString();
    }

    protected void ddlFlex_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int und = int.Parse(ddlund.SelectedValue);
        //int com = int.Parse(ddlCom.SelectedValue);
        //int kno = int.Parse(ddlkno.SelectedValue);
        //int flex = int.Parse(ddlFlex.SelectedValue);
        //int exp = int.Parse(ddlExp.SelectedValue);

        //int total = (und + com + kno + flex + exp) / 5;
        //txtTotal.Text = total.ToString();
    }

    protected void ddlkno_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int und = int.Parse(ddlund.SelectedValue);
        //int com = int.Parse(ddlCom.SelectedValue);
        //int kno = int.Parse(ddlkno.SelectedValue);
        //int flex = int.Parse(ddlFlex.SelectedValue);
        //int exp = int.Parse(ddlExp.SelectedValue);

        //int total = (und + com + kno + flex + exp) / 5;
        //txtTotal.Text = total.ToString();
    }

    protected void ddlExp_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int und = int.Parse(ddlund.SelectedValue);
        //int com = int.Parse(ddlCom.SelectedValue);
        //int kno = int.Parse(ddlkno.SelectedValue);
        //int flex = int.Parse(ddlFlex.SelectedValue);
        //int exp = int.Parse(ddlExp.SelectedValue);

        //int total = (und + com + kno + flex + exp) / 5;
        //txtTotal.Text = total.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("projectmanagementview.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString() + "&ct=" + Request.QueryString["ct"].ToString() + "&tc=" + Request.QueryString["tc"].ToString() + "&eta=" + Request.QueryString["eta"].ToString());
    }
}