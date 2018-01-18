using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BBS_Application
{
    public partial class Category : System.Web.UI.Page
    {
        private string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SignUserName"] == null)
            {
                Response.Redirect("~/HomePage.aspx");
            }
            else
            {
                username = Session["SignUserName"].ToString();
                Sign_In.Text = username;
                Register.Text = "注销";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //C语言
            Response.Redirect("~/Categoryshow.aspx?id=1");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Categoryshow.aspx?id=2");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Categoryshow.aspx?id=3");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Categoryshow.aspx?id=4");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Categoryshow.aspx?id=5");
        }
    }
}