using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class MyBlog : System.Web.UI.Page
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
            if (!IsPostBack) { Init_MyBlog_DataGrid(); }
        }

        protected void Init_MyBlog_DataGrid() 
        {
            string sqlStr = "select * from PM_notice where Uploader='"+
                username+"'";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            if (dt.Rows.Count > 0)
            {
                MyBlog_DataGrid.DataSource = dt;
                MyBlog_DataGrid.DataBind();
                MyBlog_DataGrid.Visible = true;
            }
            else
            {
                no_notice_Info.Visible = true;
            }
        }

        protected void MyBlog_DataGrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            string noticeID = MyBlog_DataGrid.DataKeys[e.Item.ItemIndex].ToString();
            string sqlStr = "delete from PM_notice where NoticeId='" + noticeID + "'";
            if (Class1.ExecuteSql(sqlStr)) { Init_MyBlog_DataGrid(); }
            else { Response.Write("<script>alert('删除失败，请稍后再试！');</script>"); }
        }

        protected void MyBlog_DataGrid_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            Session["NoticeID"] = MyBlog_DataGrid.DataKeys[e.Item.ItemIndex].ToString();
            Response.Redirect("~/WritePage.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WritePage.aspx");
        }

    }
}