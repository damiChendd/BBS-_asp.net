using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BBS_Application;

namespace BBS_Application
{
    public partial class noticeAll : System.Web.UI.Page
    {
        private string noticeId;
        private string username1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SignUserName"] == null){}
            else
            {
                username1 = Session["SignUserName"].ToString();
                Sign_In.Text = username1;
                Register.Text = "注销";
            }
            if (!IsPostBack) 
            { 
                Init_NoticeAll_Page();
                Init_PingLun_Function(); 
            }
        }

        protected void Init_NoticeAll_Page() 
        {
            noticeId = Request.QueryString["id"].ToString();
            string sqlStr = "select * from PM_notice where NoticeId='" +
                noticeId + "'";

            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            UserName.Text = dt.Rows[0]["Uploader"].ToString();
            NoticeTitle.Text = dt.Rows[0]["NoticeTitle"].ToString();
            NoticeContent.Text = dt.Rows[0]["NoticeDetail"].ToString();
        }

        protected void Init_PingLun_Function() 
        {
            string sqlStr = "select * from db_Pinglun where NoticeID='" +
                noticeId + "'";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            if (dt.Rows.Count > 0) 
            {
                Ping_Lun_Qu.DataSource = dt;
                Ping_Lun_Qu.DataBind();
            } 
            else
            {
                NULL_Pinglun.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            noticeId = Request.QueryString["id"].ToString();
            if (Sign_In.Text == "登陆")
            {
                ErrorInfo.Visible = true;
            }
            else
            {
                string sqlStr = "insert into db_Pinglun(NoticeID, PinglunUserName, PinglunTime, Pinglun) values('" +
                    noticeId + "','" + username1 + "','" +DateTime.Now.ToString()+"','"+ Pinglun.Text.ToString() + "')";
                if (Class1.ExecuteSql(sqlStr))
                {
                    Pinglun.Text = "";
                    NULL_Pinglun.Visible = false;
                    Init_NoticeAll_Page();
                    Init_PingLun_Function();
                }
                else
                {
                    Response.Write("<script>alert('评论失败，请稍后再试！');</script>");
                }
            }
        }
    }
}