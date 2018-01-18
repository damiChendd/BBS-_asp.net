using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class Sign_In : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            //获取用户名和密码
            UserClass user = new UserClass();
            user.setUserName(UserName.Text.ToString());
            user.setPassword(Password.Text.ToString());
            //检测用户名和密码是否正确
            string Sqlstr = "select * from db_UserInfoTable where userName='" +
                user.getUserName() + "'";
            DataTable dt = Class1.GetDsFromSql(Sqlstr).Tables[0];
            if (dt.Rows.Count > 0) 
            {
                //从DataTable中取出该用户的密码并与实例中的密码相比较
                if (user.getPassword() == dt.Rows[0]["password"].ToString()) 
                {
                    //跳转到首页
                    Session["SignUserName"] = user.getUserName();
                    Response.Redirect("~/HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('用户名或者密码错误，请重新输入！')</script>");
                }
            }
            else
            {
                //跳转到注册页面
                Response.Redirect("~/index.aspx");
            }
        }
    }
}