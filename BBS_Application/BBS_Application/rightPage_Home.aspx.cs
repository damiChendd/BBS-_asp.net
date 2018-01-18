using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class rightPage_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Init_Author_List(); }
        }

        protected void Init_Author_List()
        {
            string sqlStr = "select * from db_UserInfoTable";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            if (dt.Rows.Count > 0) 
            {
                Author_List.DataSource = dt;
                Author_List.DataBind();
            }
            else
            {
                Response.Write("<script>alert('数据库错误')</script>");
            }
        }
    }
}