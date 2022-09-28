using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["logout"] = "yes";
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");
        if (Session["logout"] != null)
        {
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(1));
            Response.Cache.SetCacheability(HttpCacheability.Private);
            Response.Cache.SetSlidingExpiration(true);
        }
    }
}