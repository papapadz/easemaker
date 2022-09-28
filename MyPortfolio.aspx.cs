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

public partial class MyProfileApplicant : System.Web.UI.Page
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
                bool validUser = int.TryParse(Session["userid"].ToString(), out userID);

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
    void Getclients()
    {
       
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM vw_portfolio where userid=" + Session["userid"].ToString();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "vw_portfolio");
        lvInventory.DataSource = ds;
        lvInventory.DataBind();
        con.Close();
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
                //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());
            
            
                //txtaboutme.Text = data["aboutme"].ToString();
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
    protected void lvInventory_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //dpInventory.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        Getclients();
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;


        if (fuImage.HasFile)
        {

            //cmd.CommandText = "UPDATE portfolio SET  Image=@Image WHERE userid=@userid";
            //string fileExt = Path.GetExtension(fuImage.FileName);
            //string id = Guid.NewGuid().ToString();
            //cmd.Parameters.AddWithValue("@Image", id + fileExt);
            //fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));
            //cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
            //cmd.ExecuteNonQuery();
            //con.Close();
            
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO portfolio (userid,image) VALUES (@userid,@image)";
            string fileExt = Path.GetExtension(fuImage.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@Image", id + fileExt);
            fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));
            cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
            cmd.Parameters.AddWithValue("@categoryname", txtContactPerson.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Helper.AddLog(Session["userid"].ToString(), "My Profile", "Applicant Profile Updated!");
            ShowPopUpMsg("Update Succesful!");
            GetInfo(int.Parse(Session["userid"].ToString()));
            Getclients();
        }

        else
        {
            return;
            //cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
            //cmd.ExecuteNonQuery();
            //con.Close();
            //Helper.AddLog(Session["userid"].ToString(), "My Profile", "Applicant Profile Updated!");
            //ShowPopUpMsg("Update Succesful!");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "UPDATE portfolio SET  Image=@Image WHERE userid=@userid";
        //cmd.Parameters.AddWithValue("@Image", "");
        //cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        //cmd.ExecuteNonQuery();
        //con.Close();
        Helper.AddLog(Session["userid"].ToString(), "My Portfolio", "Portfolio Removed!");
        ShowPopUpMsg("Update Succesful!");
        GetInfo(int.Parse(Session["userid"].ToString()));
    }
}