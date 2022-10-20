using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Subscription : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    private string subscription = "Yearly";
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

        hiddentxt.Text = Session["userid"].ToString();

        if (!IsPostBack)
        {
            //if (ddlUserType.SelectedValue == "Monthly")
            //{
            //    lblPrice.Text = "100.00";
           // }
            //else
            //{
            //    lblPrice.Text = "1,200.00";
           // }
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

    protected void select1(object sender, EventArgs e)
    {
        mypanel1.CssClass = "panel panel-primary";
        mypanel2.CssClass = "panel panel-warning";
        lblPrice.Text = "4,500.00";
        subscription = "Yearly";
        lblPackage.Text = "Yearly";
        btnSelect1.Visible = false;
        btnSelect2.Visible = true;
    }
    protected void select2(object sender, EventArgs e)
    {
        mypanel1.CssClass = "panel panel-warning";
        mypanel2.CssClass = "panel panel-primary";
        lblPrice.Text = "350.00";
        subscription = "Monthly";
        lblPackage.Text = "Monthly";
        btnSelect1.Visible = true;
        btnSelect2.Visible = false;
    }


    protected void btnReg_Click(object sender, EventArgs e)
    {
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

        double amt = 1200.00;
        if (subscription == "Monthly")
            amt = 100.00;

        lblPrice.Text = lblPrice.Text + " x ";
        Label1.Text = " = " + (Double.Parse(txtQty.Text) * amt);
        lblQty.Text = txtQty.Text;
        Panel1.Visible = false;
        btnSelect1.Visible = false;
        btnSelect2.Visible = false;

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "checkOut()", true);

        btnReg.Visible = false;
        btnPay.Visible = true;
    }

    protected void payNow(object sender, EventArgs e)
    {

        if(checkOutID.Text==null || checkOutID.Text == "")
        {
            ShowPopUpMsg("Cannot connect to PayMaya API Services. Try again.");
            return;
        }
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO subscription (userid,date,expdate,qty,amount,Status,category,checkoutid) VALUES (@userid,@date,@expdate,@qty,@amount,@Status,@category,@checkoutid);INSERT INTO billing (refid,userid,amount,Purpose,status,datetime,image,dateuploaded,checkoutid) VALUES (@refid,@userid,@amount,@Purpose,@status,@date,@image,@dateuploaded,@checkoutid)";
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        if (subscription == "Monthly")
        {
            cmd.Parameters.AddWithValue("@expdate", DateTime.Now.AddMonths(int.Parse(lblQty.Text)));
            cmd.Parameters.AddWithValue("@amount", Decimal.Parse(lblQty.Text) * Decimal.Parse("100.00"));
        }
        else
        {
            cmd.Parameters.AddWithValue("@expdate", DateTime.Now.AddYears(int.Parse(lblQty.Text)));
            cmd.Parameters.AddWithValue("@amount", Decimal.Parse(lblQty.Text) * Decimal.Parse("1200.00"));
        }
        cmd.Parameters.AddWithValue("@category", subscription);
        cmd.Parameters.AddWithValue("@qty", lblQty.Text);
        cmd.Parameters.AddWithValue("@refid", GetTimestamp(DateTime.Now));
        cmd.Parameters.AddWithValue("@Purpose", "Subscription");
        cmd.Parameters.AddWithValue("@image", "");
        cmd.Parameters.AddWithValue("@dateuploaded", DBNull.Value);
        cmd.Parameters.AddWithValue("@status", "Pending");
        cmd.Parameters.AddWithValue("@checkoutid", checkOutID.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "Add Category", "Added Category");
        Response.Redirect("subscriptionlist.aspx");
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