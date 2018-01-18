using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { Init_DaDataList1(); }
        }

        protected void Init_DaDataList1()
        {
            string sqlStr = "select * from PM_notice";
            DataTable dt = Class1.GetDsFromSql(sqlStr).Tables[0];
            if (dt.Rows.Count > 0) 
            {
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }
    }
}