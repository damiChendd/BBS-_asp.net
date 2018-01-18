using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace BBS_Application
{
    public class matchNumber
    {
        //添加验证码控件
        public static string RndNum()   //生成随机验证码
        {
            int number;
            int code;
            string checkCode = string.Empty;
            Random random = new Random();
            for (int i = 0; i < 4; i++)
            {
                number = random.Next();
                if (number % 2 == 0)
                {
                    code = (char)('0' + (char)(number % 10));
                }
                else
                {
                    code = (char)('A' + (char)(number % 26));
                }
                checkCode += code;
            }
            HttpContext.Current.Session["CheckCode"] = checkCode;
            return checkCode;
        }

        public static void creatCheckCodeImage(string checkCode)
        {
            if (checkCode == null || checkCode.Trim() == string.Empty)
            {
                return;
            }
            System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling(checkCode.Length * 12.5), 22);

            Graphics g = Graphics.FromImage(image);
        }
    }

}