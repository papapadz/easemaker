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
                        addportfolio();
                    }
                }
                else
                    Response.Redirect("Login.aspx");
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
    void addportfolio()
    {
        con.Open();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "SELECT * FROM portfolio " +
            "WHERE userid=@userid";
        cmd2.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        SqlDataReader dr = cmd2.ExecuteReader();

        if (dr.HasRows)
        {
            //ShowPopUpMsg("User Email already Used!");
            //txtEmail.Text = "";
            //txtEmail.Focus();
            //con.Close();

            return;
        }
        con.Close();


        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO portfolio (userid,image) VALUES (@userid,@image)";



        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@image", "");
        cmd.ExecuteNonQuery();
        con.Close();
    }
    void GetInfo(int userID)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM users WHERE userid=@userid ";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userID;
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                txtContactPerson.Text = data["personname"].ToString();
                imgApplicant.ImageUrl = string.Concat("img/", data["Image"].ToString());
                Image1.ImageUrl = string.Concat("img/", data["id1"].ToString());
               
                Image2.ImageUrl = string.Concat("img/", data["id2"].ToString());
                txtEmail.Text = data["email"].ToString();
                txtBD.Text = Convert.ToDateTime(data["Birthday"].ToString()).ToString("mm-dd-yyyy");
                txtAddress.Text = data["address"].ToString();
                txtContactNo.Text = data["contactno"].ToString();
                txtPassword.Text = Helper.CreateHashTag(data["password"].ToString());
            
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

    protected void btnReg_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;


        if ( fuImage2.HasFile || FileUpload1.HasFile) //uploading a new image
        {

            if (txtPassword.Text != "")
            {
                cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
       " Email=@Email,ContactNo=@ContactNo,Address=@Address,password=@password,Gender=@Gender, status=@status,id1=@id1,id2=@id2 WHERE " +
       "userid=@userid";
            

                string fileExt2 = Path.GetExtension(FileUpload1.FileName);
                string id2 = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@id1", id2 + fileExt2);
                FileUpload1.SaveAs(Server.MapPath("~/img/" + id2 + fileExt2));

                string fileExt3 = Path.GetExtension(fuImage2.FileName);
                string id3 = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@id2", id3 + fileExt3);
                fuImage2.SaveAs(Server.MapPath("~/img/" + id3 + fileExt3));
            }
            else
            {
                cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
   " Email=@Email,ContactNo=@ContactNo,Address=@Address,Gender=@Gender, status=@status,id1=@id1,id2=@id2 WHERE " +
   "userid=@userid";
                string fileExt = Path.GetExtension(fuImage.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@Image", id + fileExt);
                fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));

                string fileExt2 = Path.GetExtension(FileUpload1.FileName);
                string id2 = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@id1", id2 + fileExt2);
                FileUpload1.SaveAs(Server.MapPath("~/img/" + id2 + fileExt2));

                string fileExt3 = Path.GetExtension(fuImage2.FileName);
                string id3 = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@id2", id3 + fileExt3);
                fuImage2.SaveAs(Server.MapPath("~/img/" + id3 + fileExt3));
            }

        }
        else if (fuImage.HasFile)

                {
            if (txtPassword.Text != "")
            {
                cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
       " Email=@Email,ContactNo=@ContactNo,Address=@Address,password=@password,Gender=@Gender, Image=@Image,status=@status WHERE " +
       "userid=@userid";
                string fileExt = Path.GetExtension(fuImage.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@Image", id + fileExt);
                fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));

            }
            else
            {
                cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
   " Email=@Email,ContactNo=@ContactNo,Address=@Address,Gender=@Gender, Image=@Image,status=@status WHERE " +
   "userid=@userid";
                string fileExt = Path.GetExtension(fuImage.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@Image", id + fileExt);
                fuImage.SaveAs(Server.MapPath("~/img/" + id + fileExt));

            }
        }
        
        else
        {
            if (txtPassword.Text != "")
            {
                cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
        " Email=@Email,ContactNo=@ContactNo,Address=@Address,Gender=@Gender, status=@status,password=@password,status=@status WHERE " +
        "userid=@userid";
            }
            else
            {
                cmd.CommandText = "UPDATE users SET  PersonName=@PersonName, " +
       " Email=@Email,ContactNo=@ContactNo,Address=@Address,Gender=@Gender, status=@status WHERE " +
       "userid=@userid";
            }
        }
    
        cmd.Parameters.AddWithValue("@Gender", Dropdownlist1.SelectedValue);
        cmd.Parameters.AddWithValue("@PersonName", txtContactPerson.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateHashTag(txtPassword.Text));
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog(Session["userid"].ToString(), "My Profile", "Applicant Profile Updated!");
        GetInfo(int.Parse(Session["userid"].ToString()));
        ShowPopUpMsg("Update Succesful!");
    }
}