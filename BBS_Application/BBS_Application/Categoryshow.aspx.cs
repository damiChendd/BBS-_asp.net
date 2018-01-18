using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class Categoryshow : System.Web.UI.Page
    {
        private string categoryId;
        private string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SignUserName"] == null)
            {
                Response.Redirect("~/HomePage.aspx");
            }
            else
            {
                categoryId = Request.QueryString["id"].ToString();
                username = Session["SignUserName"].ToString();
                Sign_In.Text = username;
                Register.Text = "注销";
            }

            if (!IsPostBack)
            {
                Init_Category_show_Datagrid();
            }
        }

        protected void Init_Category_show_Datagrid()
        {
            string sqlstrTmp = "select * from Category_Table where Category='" + categoryId + "'";
            DataTable dtTmp = Class1.GetDsFromSql(sqlstrTmp).Tables[0];
            titleLabel.Text = dtTmp.Rows[0]["Name"].ToString();

            string sqlStr = "select * from PM_notice where Remark='" + categoryId + "'";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            Category_show_Datagrid.DataSource = dt;
            Category_show_Datagrid.DataBind();
        }

        protected void Category_show_Datagrid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            if (username == "Zetile")
            {
                string noticeID = Category_show_Datagrid.DataKeys[e.Item.ItemIndex].ToString();
                string sqlStr = "delete from PM_notice where NoticeId='" + noticeID + "'";
                if (Class1.ExecuteSql(sqlStr)) { Init_Category_show_Datagrid(); }
                else { Response.Write("<script>alert('删除失败，请稍后再试！');</script>"); }
            }
            else
            {
                Response.Write("<script>alert('对不起，您没有此权限，请联系管理员删除！')</script>");
            }
        }
    }
}