using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class authorInfo : System.Web.UI.Page
    {
        private string username;
        private string UserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SignUserName"] == null){}
            else
            {
                username = Session["SignUserName"].ToString();
                Sign_In.Text = username;
                Register.Text = "注销";
            }
            if (!IsPostBack)
            {
                Init_Blog_DataGrid();
            }
        }

        protected void Init_Blog_DataGrid()
        {
            UserId = Request.QueryString["id"].ToString();
            string sqlStr = "select * from PM_notice, db_UserInfoTable where PM_notice.Uploader=db_UserInfoTable.username and db_UserInfoTable.userID='" + UserId + "'";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            if (dt.Rows.Count > 0)
            {
                Blog_DataGrid.DataSource = dt;
                Blog_DataGrid.DataBind();
            }
            else
            {
                no_notice_Info.Visible = true;
                Blog_DataGrid.Visible = false;
            }
        }
    }
}