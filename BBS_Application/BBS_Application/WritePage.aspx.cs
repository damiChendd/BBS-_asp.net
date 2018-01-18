using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class WritePage : System.Web.UI.Page
    {
        private string username;
        private string noticeID;
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

            if (!IsPostBack)
            {
                if (Session["NoticeID"] != null)
                {
                    Init_exist_ID_write();
                }
                Init_Category_dropList();
            }
        }

        protected void Init_Category_dropList() 
        {
            string sqlStr = "select * from Category_Table";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            Category_dropList.DataSource = dt;
            Category_dropList.DataBind();
        }

        protected void Init_exist_ID_write()
        {
            noticeID = Session["NoticeID"].ToString();
            string sqlStr = "select * from PM_notice where NoticeId='" +
                noticeID + "'";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            TitleNotice.Text = dt.Rows[0]["NoticeTitle"].ToString();
            ContentNotice.Text = dt.Rows[0]["NoticeDetail"].ToString();
            UserName_write.Text = Session["SignUserName"].ToString();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string sqlStr;
            
            if (Session["NoticeID"] != null)
            {
                noticeID = Session["NoticeID"].ToString();
                sqlStr = "update PM_notice set NoticeTitle='" +
                    TitleNotice.Text + "', NoticeDetail='" +
                    ContentNotice.Text +"', Remark='"+ Category_dropList.SelectedValue.ToString() +"' where NoticeId='" +
                    noticeID + "'";
                if (Class1.ExecuteSql(sqlStr))
                {
                    Response.Redirect("~/MyBlog.aspx");
                }
                else
                {
                    Response.Write("<script>alert('更新失败，请稍后再试！');</script>");
                }
            }
            else
            {
                sqlStr = "insert into PM_notice(NoticeTitle, NoticeDetail, Uploader, Remark) values('" +
                    TitleNotice.Text + "','" +
                    ContentNotice.Text + "','" + Session["SignUserName"].ToString() + "','" + Category_dropList.SelectedValue.ToString() + "')";
                if (Class1.ExecuteSql(sqlStr))
                {
                    Response.Redirect("~/MyBlog.aspx");
                }
                else
                {
                    Response.Write("<script>alert('发布文章失败，请稍后再试！');</script>");
                }
            }
        }
    }
}