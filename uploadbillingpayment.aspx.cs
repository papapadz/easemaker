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

public partial class uploadbillingpayment : System.Web.UI.Page
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
                int productID = 0;
                bool validProduct = int.TryParse(Session["userid"].ToString(), out productID);

                if (validProduct)
                {
                    if (!IsPostBack)
                    {

                        GetInfo(productID);
                        txtDate.Enabled = false;
                        txtONO.Text = Request.QueryString["OID"].ToString();
                        txtDate.Text = DateTime.Now.ToShortDateString();
                    }
                }
                else
                    Response.Redirect("Login.aspx");
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
    void GetInfo(int productID)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users WHERE userid=@ProductID ";
        cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = productID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
               
                //imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());

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
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;


        if (fuImage.HasFile) //uploading a new image
        {


            cmd.CommandText = "UPDATE billing SET Image=@Image, dateuploaded=@dateuploaded, " +
       " Status=@Status WHERE " +
       "billingid=@billingid";
            string fileExt = Path.GetExtension(fuImage.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@Image", id + fileExt);
            fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));
            cmd.Parameters.AddWithValue("@dateuploaded", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", "Uploaded Payment");
            cmd.Parameters.AddWithValue("@billingid", Request.QueryString["ID"].ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            Helper.AddLog(Session["userid"].ToString(), "billing client", "Billing payment upload!");
            ShowPopUpMsg("Upload Successful!");
            Response.Redirect("billinglist.aspx");
        }
        else
        {
            ShowPopUpMsg("Please Select a File to uploade!");
            return;
        }
    }
}