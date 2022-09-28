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

public partial class FilesuploadContractEmployer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lblPN.Text = Request.QueryString["name"].ToString();

            getfilename();
            getfilename2();
        }
    }
  
    void getfilename()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM contracts WHERE jobid=@jobid and userid!=@userid";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Session["userid"].ToString();
        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                txtFNAMED.Text = data["filename"].ToString();
            }
        }
        con.Close();

    }
    void getfilename2()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM contracts WHERE jobid=@jobid and userid=@userid";
        cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Session["userid"].ToString();
        cmd.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        SqlDataReader data = cmd.ExecuteReader();
        while (data.Read())
        {
            {
                txtFNAMEU.Text = data["filename"].ToString();
            }
        }
        con.Close();

    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["status"].ToString() == "Done")
        {
            ShowPopUpMsg("This Project is already done!");
            return;
        }
        Page.Validate();
        if (Page.IsValid)
        {
            AddExp();

        }

        getfilename2();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        //int index = Convert.ToInt32(e.CommandArgument);
        ////GridViewRow row = gvfiles.Rows[index];
        //int uid = int.Parse(row.Cells[0].Text);
        //var fname = row.Cells[2].Text;
        //string path = Server.MapPath("~/Files/" + fname);
        //FileInfo file = new FileInfo(path);
        //if (e.CommandName == "Delete")
        //{
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = con;
        //    cmd.CommandText = "DELETE UploadFile FROM UploadFile WHERE uploadfileid=@uploadfileid ";
        //    cmd.Parameters.Add("@uploadfileid", SqlDbType.Int).Value = uid;
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    getexperience();
        //    file.Delete();

        //}
        //else if (e.CommandName == "Download")
        //{

        //    //string Filpath = Server.MapPath(BSPHelper.BSPGetURL() + "/BSPFiles/" + fname);
        //    //string Filpath = Server.MapPath(fname);
        //    //DownLoad(fname);
        //    Response.Clear();
        //    Response.ContentType = "application/octect-stream";
        //    Response.AppendHeader("content-disposition", "filename="
        //        + fname);
        //    Response.TransmitFile(Server.MapPath("~/Files/" + fname));
        //    Response.End();
        //}
    }
    public void DownLoad(string FName)
    {
        string path = FName;
        System.IO.FileInfo file = new System.IO.FileInfo(path);
        //if (file.Exists)
        //{
        //Response.Clear();
        //Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name); Response.AddHeader("Content-Length", file.Length.ToString());
        //Response.ContentType = "application/octet-stream"; // download […]
        //Response.TransmitFile(BSPHelper.BSPGetURL() + "/BSPFiles/" + FName);
        //Response.End();

        Response.Clear();
        Response.ContentType = "application/octect-stream";
        Response.AppendHeader("content-disposition", "filename="
            + FName);
        Response.TransmitFile(Server.MapPath(Helper.GetURL() + "/Files/" + FName));
        Response.End();
        //}
    }

    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    void AddExp()
    {

        HttpPostedFile file = fuimage.PostedFile;
        if ((file == null))
        {
            ShowPopUpMsg("Please select a file to upload!");

            return;
        }

        //int iFileSize = file.ContentLength;


        //if (iFileSize > 1048576)  // 1MB
        //{
        //    ShowPopUpMsg("File exceeds the file maximum size of 1mb!");
        //    // File exceeds the file maximum size
        //    return;
        //}
        //else
        //{

           string fileExt = Path.GetExtension(fuimage.FileName);
            string fileName = fuimage.FileName;
        if (fileExt == ".exe")
        {
            ShowPopUpMsg("Invalid File! you can only upload Notepad/Word/Excel/Power Point/PDF/Image Files");

            return;
        }
        if (fileExt == ".docx" || fileExt == ".doc" ||fileExt == ".jpeg" || fileExt == ".jpg" || fileExt == ".png" || fileExt == ".pdf")
        {

        }
        else
        {
            ShowPopUpMsg("Invalid File! you can only upload Word/PDF/Image");

            return;
        }


        con.Open();
            SqlCommand cmd3 = new SqlCommand();
            cmd3.Connection = con;
            cmd3.CommandText = "SELECT * FROM contracts " +
                "WHERE FileName =@FileName and jobid=@jobid and userid=@userid";
            cmd3.Parameters.AddWithValue("@FileName", fileName);
        cmd3.Parameters.AddWithValue("@jobid", Request.QueryString["ID"].ToString());
        cmd3.Parameters.AddWithValue("@userid", Session["userid"].ToString());
        SqlDataReader dr2 = cmd3.ExecuteReader();

            if (dr2.HasRows)
            {
                ShowPopUpMsg("Contract already Added!");
                con.Close();

                return;
            }

            con.Close();

            if (fileExt == null)
            {
                ShowPopUpMsg("Pleasse Select File !");
                return;
            }
            else
            {


                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO contracts (jobid,filename,date,Status,UserID) VALUES (@jobid,@filename,@date,@Status,@UserID);UPDATE joblist SET status=@status2 WHERE jobid=@jobid;UPDATE projects SET status=@status2 WHERE jobid=@jobid";



                fuimage.SaveAs(Server.MapPath("~/Files/" + fileName));

                cmd.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
                cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = "Pending";
                cmd.Parameters.Add("@Status2", SqlDbType.VarChar).Value = "Pending Contract";
                cmd.Parameters.Add("@FileName", SqlDbType.VarChar).Value = fileName;
                cmd.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Now;
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["userid"].ToString();
                cmd.ExecuteNonQuery();
                con.Close();
                getfilename2();
            }
        
    }
    protected void gvfiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }



    //protected void gvfiles_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //}

    protected void gvfiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "DELETE projreq FROM projreq WHERE projreqid= @projreqid ";
        //cmd.Parameters.Add("@projreqid", SqlDbType.Int).Value = gvfiles.SelectedRow.Cells[0].Text;
        //cmd.ExecuteNonQuery();
        //con.Close();

        //getexperience();
    }


  
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("addskills.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
     

        if (Request.QueryString["status"].ToString() == "Done")
        {
            ShowPopUpMsg("This Project is already done!");
            return;
        }
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE joblist SET status=@status2 WHERE jobid=@jobid;UPDATE projects SET status=@status2,startdate=@startdate,eta=@eta WHERE jobid=@jobid";


        if (Request.QueryString["tc"].ToString() == "Days")
        {
            DateTime eta = DateTime.Now.AddDays(int.Parse(Request.QueryString["ct"].ToString()));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
        else if (Request.QueryString["tc"].ToString() == "Months")
        {
            DateTime eta = DateTime.Now.AddMonths(int.Parse(Request.QueryString["ct"].ToString()));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
        else if (Request.QueryString["tc"].ToString() == "Years")
        {
            DateTime eta = DateTime.Now.AddYears(int.Parse(Request.QueryString["ct"].ToString()));
            cmd.Parameters.Add("@eta", SqlDbType.DateTime).Value = eta;
        }
      
        cmd.Parameters.Add("@jobid", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
        cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = "On-Going";
        cmd.Parameters.Add("@Status2", SqlDbType.VarChar).Value = "On-Going";
        cmd.Parameters.Add("@startdate", SqlDbType.DateTime).Value = DateTime.Now;
        cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["userid"].ToString();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("projectmanagementview.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString());
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //Response.Redirect("projectmanagement.aspx");
        Response.Redirect("projectmanagementview.aspx?ID=" + Request.QueryString["ID"].ToString() + "&status=" + Request.QueryString["status"].ToString() + "&projname=" + Request.QueryString["projname"].ToString() + "&name=" + Request.QueryString["name"].ToString());
    }



    protected void Button3_Click(object sender, EventArgs e)
    {
        var fname = txtFNAMED.Text;
        string path = Server.MapPath("~/Files/" + fname);
        FileInfo file = new FileInfo(path);
        
        
        Response.Clear();
        Response.ContentType = "application/octect-stream";
        Response.AppendHeader("content-disposition", "filename="
            + fname);
        Response.TransmitFile(Server.MapPath("~/Files/" + fname));
        Response.End();
    }
}