using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BBS_Application
{
    public class UserClass
    {
        private string name;
        private string password;
        private string phoneNumber;
        //记录用户生日
        public UserClass()
        {

        }

        public UserClass(string name, string password, string phoneNumber)
        {
            this.name = name;
            this.password = name;
            this.phoneNumber = phoneNumber;
        }

        public string getUserName()
        {
            return this.name;
        }

        public string getPhone()
        {
            return this.phoneNumber;
        }

        public string getPassword()
        {
            return this.password;
        }

        public void setUserName(string name)
        {
            this.name = name;
        }

        public void setPassword(string password)
        {
            this.password = password;
        }

        internal void setPhoneNum(string p)
        {
            this.phoneNumber = p;
        }
    }
}