using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BBS_Application
{
    public partial class HomePage : System.Web.UI.Page
    {
        public UserClass userHomePage = new UserClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            //检测Session中是否包含Session["SignUseName"]
            //包含则将登录标签和注册标签改为用户名标签和注销标签
            //不包含则不变
            
            if (!IsPostBack)
            {
                if (Session["NotFound"] != null && Session["NotFound"].ToString() == "NotFound")
                {
                    Response.Write("<script>alert('未找到索引项！')</script>");
                    Session.Remove("NotFound");
                }
                Check_Session();
            }
        }

        protected void Check_Session() 
        {
            if (Session["SignUserName"] != null)
            {
                Sign_In.Text = Session["SignUserName"].ToString();
                userHomePage.setUserName(Sign_In.Text.ToString());
                Register.Text = "注销";
            }
        }

        protected void found_Button_Click(object sender, EventArgs e)
        {
            Session["NeedFound"] = User_Need_Info.Text.ToString();
            Response.Redirect("~/foundAnswer.aspx");
        }
    }
}