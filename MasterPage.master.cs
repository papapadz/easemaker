using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usertype"] == null)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
        if (Session["userid"] == null)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        //if (Session["usertype"].ToString() == "Recruitment")
        //{
        //    liadmin.Visible = false;
        //}
        lblname.Text = Session["personname"].ToString();

    }
}
