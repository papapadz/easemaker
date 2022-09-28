using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewPortfolioemployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["typeid"].ToString() != "1")
        //{
        //    Session.Clear();
        //    Response.Redirect("Login.aspx");
        //}
        if (!IsPostBack)
        {
            //GetInventory();
            if (Session["userid"] != null)
            {
                int userID = 0;
                bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

                if (validUser)
                {
                    if (!IsPostBack)
                    {

                        GetInfo(userID);
                        Getclients();
                    }
                }
                else
                    Response.Redirect("Login.aspx");
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
    void GetInfo(int userID)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_portfolio WHERE userid=@userid ";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                txtContactPerson.Text = data["personname"].ToString();
               
            
            
                //txtaboutme.Text = data["aboutme"].ToString();
            }
        }
        con.Close();
    }
    void Getclients()
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_portfolio where userid=" + Request.QueryString["ID"].ToString();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_portfolio");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
        //}
    }
    protected void lvInventory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpInventory.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        Getclients();
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
        Response.Redirect("applicantlist.aspx?ID=" + Request.QueryString["JID"].ToString());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("applicantlist.aspx?ID=" + Request.QueryString["JID"].ToString());
    }
}