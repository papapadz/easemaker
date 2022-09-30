using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Subscription : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    void Page_PreInit(Object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
       
            SetMasterPage(Session["userid"].ToString());
        

    }

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
            if (ddlUserType.SelectedValue == "Monthly")
            {
                lblPrice.Text = "100.00";
            }
            else
            {
                lblPrice.Text = "1,200.00";
            }
            //GetCategories();
        }
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
        cmd3.CommandText = "SELECT * FROM subscription " +
            "WHERE userid =@userid and (status='Pending' or status='Subscribed')";
        cmd3.Parameters.AddWithValue("@userid", this.Session["userid"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            ShowPopUpMsg("You have a current subscription!");
            con.Close();

            return;
        }
        con.Close();


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO subscription (userid,date,expdate,qty,amount,Status,category) VALUES (@userid,@date,@expdate,@qty,@amount,@Status,@category);INSERT INTO billing (refid,userid,amount,Purpose,status,datetime,image,dateuploaded) VALUES (@refid,@userid,@amount,@Purpose,@status,@date,@image,@dateuploaded)";
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        if (ddlUserType.SelectedValue == "Monthly")
        {
            cmd.Parameters.AddWithValue("@expdate", DateTime.Now.AddMonths(int.Parse(txtQty.Text)));
            cmd.Parameters.AddWithValue("@amount", Decimal.Parse(txtQty.Text) * Decimal.Parse("100.00"));
        }
        else
        {
            cmd.Parameters.AddWithValue("@expdate", DateTime.Now.AddYears(int.Parse(txtQty.Text)));
            cmd.Parameters.AddWithValue("@amount", Decimal.Parse(txtQty.Text) * Decimal.Parse("1200.00"));
        }
        cmd.Parameters.AddWithValue("@category", ddlUserType.SelectedValue);
        cmd.Parameters.AddWithValue("@qty", txtQty.Text);
        cmd.Parameters.AddWithValue("@refid", "");
        cmd.Parameters.AddWithValue("@Purpose", "Subscription");
        cmd.Parameters.AddWithValue("@image", "");
        cmd.Parameters.AddWithValue("@dateuploaded", DBNull.Value);
        cmd.Parameters.AddWithValue("@status", "Pending");
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "Add Category", "Added Category");
        Response.Redirect("subscriptionlist.aspx");

    }

    protected void ddlUserType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUserType.SelectedValue == "Monthly")
        {
            lblPrice.Text = "100.00";
        }
        else
        {
            lblPrice.Text = "1,200.00";
        }
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
            if (data["UserType"].ToString() == "Admin")
            {
                this.MasterPageFile = "~/MasterPage.master";
            } else if (data["UserType"].ToString() == "Employer")
            {
                
                this.MasterPageFile = "~/MasterPageEmployer.master";
            }
            else
            {
                this.MasterPageFile = "~/MasterPageUser.master";
            }

        }
        con.Close();
    }
}