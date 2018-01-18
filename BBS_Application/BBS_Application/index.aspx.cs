using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BBS_Application
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SignUserName"] != null)
                {
                    Session.Clear();
                    Response.Redirect("~/HomePage.aspx");
                }
                checkCodeImage.Visible = false;
                initPage();
                YearsList.AutoPostBack = true;
                MouthList.AutoPostBack = true;
                DateBinderFunction();
                changeIndex();
            }
        }

        protected void changeIndex()
        {
            int yearsValue = 0;
            int mouthValue = 0;
            yearsValue = int.Parse(YearsList.SelectedItem.Text);
            mouthValue = int.Parse(MouthList.SelectedItem.Text);
            DaysOfLeapYears(yearsValue, mouthValue);
        }

        protected void initPage()
        {
            string strSql = "select * from db_Province";
            DataTable dt = Class1.GetDsFromSql(strSql).Tables[0];
            provinceList.DataSource = dt;
            provinceList.DataBind();
        }

        protected void DateBinderFunction()
        {
            int[] years = { 2001, 2002, 2003, 2004, 2005 };
            int[] mouth = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
            for (int i = 0; i < years.Length; i++)
            {
                YearsList.Items.Add(new ListItem(years[i].ToString(), i.ToString()));
            }
            for (int i = 0; i < mouth.Length; i++)
            {
                 MouthList.Items.Add(new ListItem(mouth[i].ToString(), i.ToString()));
            }
        }

        protected bool checkleap(int y)
        {
            if ((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0))
            return true;
            return false;
        } 

        protected void DaysOfLeapYears(int y, int m)
        {
            if (m == 2)
            {
                if(checkleap(y)){
                    for (int i = 1; i < 30; i++)
                    {
                        DayList.Items.Add(new ListItem(i.ToString(), (i-1).ToString()));
                    }
                }else{
                    for (int i = 1; i < 29; i++)
                    {
                        DayList.Items.Add(new ListItem(i.ToString(), (i-1).ToString()));
                    }
                }
            }else{
                for (int i = 1; i < 32; i++)
                {
                    DayList.Items.Add(new ListItem(i.ToString(), (i-1).ToString()));
                }
            }
        }

        protected void YearsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            changeIndex();
        }

        protected void MouthList_SelectedIndexChanged(object sender, EventArgs e)
        {
            changeIndex();
        }

        protected void MatchedText_Check()
        {
            string checkCodetext = MatchedText.Text.ToString();
            if (Session["CheckCode"].ToString() == checkCodetext)
            {
                checkCodeImage.Visible = true;
                checkCodeImage.ImageUrl = "~/images/pic4.png";
            }
            else
            {
                Response.Write("<script>alert('验证码输入错误，请重新输入')</script>");
            }
        }

        protected void OkBtn_Click(object sender, EventArgs e)
        {
            MatchedText_Check();
            //创建一个用户类实例
            UserClass user = new UserClass();
            //获取用户名和密码
            user.setUserName(UserName.Text.ToString());
            user.setPassword(Password.Text.ToString());
            user.setPhoneNum(UserPhone.Text.ToString());
            if (insertData(user))
            {
                //跳转到登录页面
                Response.Redirect("~/Sign_In.aspx");
            }
            else
            {
                //清空页面
                Password.Text = "";
                UserPhone.Text = "";
            }
        }


        protected Boolean insertData(UserClass u)
        {
            string Sqlstr = "select * from db_UserInfoTable where userName='" +
               u.getUserName() + "'";
            DataTable dt = Class1.GetDsFromSql(Sqlstr).Tables[0];
            if (dt.Rows.Count > 0) { Response.Write("<script>alert('该用户名已被注册，请重新输入……')</script>"); return false; }
            string strSql = "insert into db_UserInfoTable(userName, password, phoneNumber)"+
                "values('"+ u.getUserName() + "','" + u.getPassword() + "','" + u.getPhone()+"')";
            return Class1.ExecuteSql(strSql);
        }
    }
}