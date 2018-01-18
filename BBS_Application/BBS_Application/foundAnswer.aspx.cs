using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class foundAnswer : System.Web.UI.Page
    {
        private string username;
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
                Init_DataGrid1();
            }
        }

        protected void Init_DataGrid1()
        {
            string foundChar = Session["NeedFound"].ToString();
            string sqlStr = "select * from PM_notice where NoticeTitle like '%" + foundChar + "%'";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            if (dt.Rows.Count > 0)
            {
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            else
            {
                Session["NotFound"] = "NotFound";
                Response.Redirect("~/HomePage.aspx");
            }
        }
    }
}