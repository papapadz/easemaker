﻿using Microsoft.Office.Interop.Excel;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addratingemployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    public string name;
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
            //GetCategories();
            GetInfo2();
        }
    }

    void GetInfo()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP(1) * FROM Users WHERE userID=@userid ";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Session["userid"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                //lblRating.Text = data["rating"].ToString();
                
                Label2.Text = data["PersonName"].ToString();

            }
        }
        con.Close();
    }

    void GetInfo2()
    {
        bool getUserInfo = false;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_ratingemployer WHERE jobid=@jobid ";
        cmd.Parameters.Add("@jobid", SqlDbType.Int).Value = Request.QueryString["ID"].ToString();
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                //lblRating.Text = data["rating"].ToString();
                Image2.ImageUrl = string.Concat("img/", data["image"].ToString());
                lblComment.Text = data["comment"].ToString();
                panelRating.Visible = false;
                txtContactPerson.Text = "Rating by " + data["PersonName"].ToString();
                getUserInfo = true;
            }
        }
        con.Close();

        if (getUserInfo)
            GetInfo();
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
        cmd3.CommandText = "SELECT * FROM employerrating " +
            "WHERE jobid =@jobid";
        cmd3.Parameters.AddWithValue("@jobid", this.Request.QueryString["ID"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

        if (dr2.HasRows)
        {
            con.Close();
            con.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandText = "UPDATE rating SET datetime=@datetime,comment=@comment,rating=@rating WHERE jobid=@jobid";
            cmd2.Parameters.AddWithValue("@rating", ddlund.SelectedValue);

            cmd2.Parameters.AddWithValue("@comment", txtComment.Text);
            cmd2.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
            cmd2.Parameters.AddWithValue("@datetime", DateTime.Now);
            cmd2.ExecuteNonQuery();
            con.Close();
            ShowPopUpMsg("Rating Successfully Updated! ");
        }
        con.Close();


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO employerrating (jobid,datetime,comment,rating) VALUES (@jobid,@datetime,@comment,@rating)";
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
        Response.Redirect("projectmanagementviewfreelancer.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}