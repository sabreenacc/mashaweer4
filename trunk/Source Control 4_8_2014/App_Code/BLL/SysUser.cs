using System;
using System.Linq;
using Mashaweer;

/// <summary>
/// Summary description for SysUser
/// </summary>
public partial class SysUser
{
    public bool Update(int userID, string password)
    {
        bool Return = false;
        try
        {
            SysUser objUser = MashaweerDatabaseHandler.Search<SysUser>(i => i.UserID == userID).FirstOrDefault();
            if (password.Trim() != "")
            {
                objUser.Password = Helper.Encrypt(password);
            }
            objUser.Update();
            Return = true;
        }
        catch { }
        return Return;
    }

    public static bool CheckExists(int userID, string userName)
    {
        try
        {
            return MashaweerDatabaseHandler.Search<SysUser>(p => p.UserID != userID && p.UserName == userName).Count() > 0;
        }
        catch
        {
            return false;
        }
    }

    public static bool Login(string userName, string password)
    {
        try
        {
            var user = MashaweerDatabaseHandler.Search<SysUser>(p => p.IsActive && p.UserName == userName && p.Password == Helper.Encrypt(password)).SingleOrDefault();
            if (user != null)
            {
                SoftCube.Profile.UserID = user.UserID;
                SoftCube.Profile.UserName = user.UserName;
            }
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }

    public static SysUser Select(string userName, string password)
    {
        try
        {
            return MashaweerDatabaseHandler.Search<SysUser>(p => p.IsActive && p.UserName == userName && p.Password == Helper.Encrypt(password)).SingleOrDefault();
        }
        catch (Exception)
        {
            return null;
        }
    }

    public int SelectbyUserName(string strUserName)
    {
        try
        {
            int iID = 0;
            SysUser obj = MashaweerDatabaseHandler.Search<SysUser>(i => i.UserName.ToLower() == strUserName.ToLower()).FirstOrDefault();
            if (obj != null)
                iID = obj.UserID;
            return iID;

        }
        catch (Exception)
        {
            return -1;
        }
    }
}
