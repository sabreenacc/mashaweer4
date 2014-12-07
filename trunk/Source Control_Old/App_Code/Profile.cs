using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for Profile
/// </summary>
namespace SoftCube
{

    public static class Profile
    {

        public static int? UserID
        {
            get { return Convert.ToInt32(HttpContext.Current.Session["UserID"]); }
            set { HttpContext.Current.Session["UserID"] = value; }
        }
        public static string UserName
        {
            get { return HttpContext.Current.Session["UserName"] as string; }
            set { HttpContext.Current.Session["UserName"] = value; }
        }
        public static bool IsAuthenticated
        {

            get { return (bool)(HttpContext.Current.Session["UserID"] == null ? false : true); }
        }




        public static void LogOut()
        {

            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Response.Cookies["MashaweersoftCubeAdminU"].Expires = DateTime.Now.AddDays(-1);
        }
        public static bool Login()
        {
            bool bSucc = false;
            if (!IsAuthenticated)
            {
                HttpCookie cookie = HttpContext.Current.Response.Cookies["MashaweersoftCubeAdminU"];
                if (cookie != null)
                {
                    if (cookie["User"] != null && cookie["Pass"] != null)
                    {
                        if (LoginUser(cookie["User"].ToString(), cookie["Pass"].ToString(), true))
                        {
                            bSucc = true;
                        }
                    }
                }
            }
            return bSucc;
        }


        public static bool LoginUser(string userName, string password, bool saveCookie)
        {
            var user = SysUser.Select(userName, password);
            if (user != null)
            {
                UserID = user.UserID;
                UserName = user.Name;

                if (saveCookie && IsAuthenticated)
                {
                    HttpCookie cookie = new HttpCookie("MashaweersoftCubeAdminU");
                    cookie["User"] = userName;
                    cookie["Pass"] = password;
                    cookie.Expires = DateTime.Now.AddDays(2);
                    HttpContext.Current.Response.Cookies.Add(cookie);
                }
            }
            return IsAuthenticated;
        }
    }
}