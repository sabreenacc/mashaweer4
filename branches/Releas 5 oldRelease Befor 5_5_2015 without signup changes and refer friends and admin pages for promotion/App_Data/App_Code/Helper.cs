using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Reflection;
using System.Web.Script.Serialization;
using System.Collections;
using System.Collections.Specialized;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Threading;
using System.Net.Mime;

/// <summary>
/// Summary description for Helper
/// </summary>
public enum ImageKind
{
    News = 1, Articles = 2, Gallery = 3, Calendar = 4, Governorate = 5
}
namespace FormBase
{

    # region ForentendBase
    public class ForentendBase : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            HttpContext.Current.Session["backUrl"] = HttpContext.Current.Request.Url.OriginalString;

            base.OnPreInit(e);
        }


    }
    # endregion

    # region daleelBase
    public class daleelBase : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            HttpContext.Current.Session["backUrl"] = HttpContext.Current.Request.Url.OriginalString;

            base.OnPreInit(e);
        }


    }
    # endregion

}
public static class Helper
{
    public class DataProtection
    {
        private static byte[] key = { };
        private static byte[] IV = { 0X12, 0X34, 0X56, 0X78, 0X90, 0XAB, 0XCD, 0XEF };
        private DataProtection()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static string Decrypt(string strdecrypt)
        {
            string skey = "SoftCubeAppLication";
            byte[] inputByteArray = new byte[strdecrypt.Length + 1];
            try
            {
                key = System.Text.Encoding.UTF8.GetBytes(skey.Substring(0, 8));
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();

                inputByteArray = Convert.FromBase64String(strdecrypt);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.Encoding encoding = System.Text.Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        public static string Encrypt(string strencrypt)
        {
            string skey = "SoftCubeAppLication";
            try
            {
                key = System.Text.Encoding.UTF8.GetBytes(skey.Substring(0, 8));
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                byte[] inputByteArray = Encoding.UTF8.GetBytes(strencrypt);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                return Convert.ToBase64String(ms.ToArray());
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }




    public static string _versionConn;

    public static string VersionConn
    {
        set
        {
            _versionConn = value;
        }
        get
        {
            if (_versionConn != null && _versionConn != "")
            {
                return _versionConn;
            }
            else
            {
                string strConName = "EasyNewsletterConnectionString1";
                string strWeb = Helper.GetFile("~/web.config");
                if (strWeb.Contains(strConName))
                {
                    int iStart = strWeb.IndexOf(strConName);
                    strWeb = strWeb.Remove(0, iStart + strConName.Length + 1);
                    strConName = "connectionString";
                    iStart = strWeb.IndexOf(strConName);
                    strWeb = strWeb.Remove(0, iStart + strConName.Length + 1);
                    strConName = "providerName";
                    iStart = strWeb.IndexOf(strConName);
                    strWeb = strWeb.Remove(iStart);
                    strWeb = strWeb.Replace("'", "").Replace('"', ' ').Trim();
                    return strWeb;
                }
                else
                {
                    return _versionConn;
                }
            }
        }
    }

    public static string AppPath
    {
        get
        {
            if (HttpContext.Current.Request.ApplicationPath == "/")
                return "";
            return HttpContext.Current.Request.ApplicationPath;
        }
    }
    public static string GetFileName(string fileName)
    {
        return System.Guid.NewGuid().ToString() + "_" + fileName.Replace(' ', '+');
    }
    public static void SaveFile(FileUpload fileUpload, string location, string fileName)
    {
        fileUpload.SaveAs(HttpContext.Current.Server.MapPath(location + fileName));
    }
    public static void DeleteFile(string location, string fileName)
    {
        string filePath = HttpContext.Current.Server.MapPath(AppPath) + location + fileName;
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }
    }
    public static void DeleteFile(string fileName)
    {
        string filePath = HttpContext.Current.Server.MapPath(fileName);
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }
    }
    public static bool CheckFileExists(string fileName)
    {
        string filePath = HttpContext.Current.Server.MapPath(fileName);
        return File.Exists(filePath);

    }

    public static string GetFile(string strPath)
    {
        string str = "";
        if (CheckFileExists(strPath))
        {
            StreamReader strFile = new StreamReader(HttpContext.Current.Server.MapPath(strPath));
            while (strFile.Peek() != -1)
            {
                str = strFile.ReadToEnd();
            }
            strFile.Close();
        }
        return str;
    }
    public static string GetFile(string strPath, int iline, int iLineCount)
    {
        StringBuilder strOut = new StringBuilder();
        if (CheckFileExists(strPath))
        {
            StreamReader strFile = new StreamReader(HttpContext.Current.Server.MapPath(strPath));
            string strLine = null;
            int iCounter = 0;
            while ((strLine = strFile.ReadLine()) != null)
            {
                iCounter++;
                if (iCounter >= iline)
                {
                    strOut.Append(strLine);
                    if (iCounter == iline + iLineCount)
                    {
                        break;
                    }
                }
            }
            strFile.Close();
        }
        return strOut.ToString();
    }

    public static List<List<string>> ReadCsvFile(string strPath)
    {
        StreamReader objStreamReader = new StreamReader(HttpContext.Current.Server.MapPath(strPath));
        List<List<string>> lstValues = new List<List<string>>();
        List<string> values;
        while (true)
        {
            string line = objStreamReader.ReadLine();
            if (line == null) break;
            values = line.Split(",".ToCharArray()).ToList();
            lstValues.Add(values);
        }
        objStreamReader.Close();
        return lstValues;
    }
    public static List<List<string>> ReadCsvFile(string strPath, int iline, int iLineCount)
    {
        StreamReader strFile = new StreamReader(HttpContext.Current.Server.MapPath(strPath));
        List<List<string>> lstValues = new List<List<string>>();
        List<string> values;
        string strLine = null;
        int iCounter = 0;
        while ((strLine = strFile.ReadLine()) != null)
        {
            iCounter++;
            if (iCounter > iline)
            {
                values = strLine.Split(",".ToCharArray()).ToList();
                lstValues.Add(values);
                if (iCounter == iline + iLineCount)
                {
                    break;
                }
            }
        }
        strFile.Close();
        return lstValues;
    }
    public static bool CreateFile(string strPath)
    {
        File.Create(HttpContext.Current.Server.MapPath(strPath));
        if (CheckFileExists(strPath))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static string GetFileExtension(string strPath)
    {
        return Path.GetExtension(strPath);
    }
    public static void WriteInFile(string strPath, string body)
    {
        DeleteFile(strPath);
        File.WriteAllText(HttpContext.Current.Server.MapPath(strPath), body);

    }
    public static void AddStringToFile(string strPath, string body)
    {
        if (CheckFileExists(strPath))
        {
            StreamWriter strFile = new StreamWriter(HttpContext.Current.Server.MapPath(strPath), true);
            strFile.WriteLine(body);
            strFile.Close();
        }
        else
        {
            File.WriteAllText(HttpContext.Current.Server.MapPath(strPath), body);
        }
    }
    ///encryption and decreption methods
    ///UTF8 encoding and decoding
    private static string base64Encode(string sData)
    {
        try
        {
            byte[] encData_byte = new byte[sData.Length];

            encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);

            string encodedData = Convert.ToBase64String(encData_byte);

            return encodedData;

        }
        catch (Exception ex)
        {
            throw new Exception("Error in base64Encode" + ex.Message);
        }
    }

    //salt encryption and decription 
    public static string Encrypt(string pstrText)
    {
        string pstrEncrKey = "1239;[pewGKG)NisarFidesTech";
        byte[] byKey = { };
        byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
        byKey = System.Text.Encoding.UTF8.GetBytes(pstrEncrKey.Substring(0, 8));
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        byte[] inputByteArray = Encoding.UTF8.GetBytes(pstrText);
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        return Convert.ToBase64String(ms.ToArray());
    }

    public static string Decrypt(string pstrText)
    {
        pstrText = pstrText.Replace(" ", "+");
        string pstrDecrKey = "1239;[pewGKG)NisarFidesTech";
        byte[] byKey = { };
        byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
        byte[] inputByteArray = new byte[pstrText.Length];

        byKey = System.Text.Encoding.UTF8.GetBytes(pstrDecrKey.Substring(0, 8));
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        inputByteArray = Convert.FromBase64String(pstrText);
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();
        System.Text.Encoding encoding = System.Text.Encoding.UTF8;
        return encoding.GetString(ms.ToArray());
    }
    public static string GetGeneralMessage(string key)
    {
        return HttpContext.GetGlobalResourceObject("GeneralMessage", key).ToString();
    }

    public class Mail
    {
        public static string LoadMailTemplate(string path)
        {
            string strPath = HttpContext.Current.Server.MapPath(path);
            StreamReader strLetter = new StreamReader(strPath);
            string strFinalLetter = string.Empty;

            while (strLetter.Peek() != -1)
            {
                strFinalLetter = strLetter.ReadToEnd();
            }
            return strFinalLetter;
        }
        public static bool SendMailM(string subject, string to, string body, string from)
        {
            bool success = true;


            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = Setting.SelectValue("EmailServerName");
            //"PortNo";
            int portNo = 0;
            if(int.TryParse(Setting.SelectValue("PortNo"), out portNo))
                smtpClient.Port = portNo;

            //ssl
            //smtpClient.EnableSsl = setting.EnableSSL;
            smtpClient.Credentials = new System.Net.NetworkCredential(Setting.SelectValue("EmailUserName"), Setting.SelectValue("EmailPassword"));
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(from, from);
                mail.To.Add(to);
                mail.Subject = subject;


                string contentID = "LogoImg";
                string attachmentPath = HttpContext.Current.Server.MapPath("~/App_Themes/Tender/images/header.jpg");
                Attachment inline = new Attachment(attachmentPath);
                inline.ContentDisposition.Inline = true;
                inline.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                inline.ContentId = contentID;
                inline.ContentType.MediaType = "image/jpg";
                inline.ContentType.Name = Path.GetFileName(attachmentPath);
                mail.Attachments.Add(inline);


                mail.Body = body.Replace("http://www.example.com/App_Themes/images/header.jpg", "cid:" + contentID);
                mail.IsBodyHtml = true;

                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                success = false;
                string strPath = HttpContext.Current.Server.MapPath("~/WebData/log.txt");
                Helper.IO.Logme(" Email Fail InnerException : " + ex.InnerException
                    + Environment.NewLine + "Email Fail Data" + ex.Data
                    + Environment.NewLine + "Email Fail Message" + ex.Message, strPath);

            }

            return success;
        }
        public static bool SendMail(string subject, string to, string body, string from)
        {
            bool success = true;


            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = Setting.SelectValue("EmailServerName");
            //"PortNo";
            int portNo = 0;
            if (int.TryParse(Setting.SelectValue("PortNo"), out portNo))
                smtpClient.Port = portNo;
            //ssl
            bool enableSsl = false;
            if (bool.TryParse(Setting.SelectValue("EnableSsl"), out enableSsl))
                smtpClient.EnableSsl = enableSsl;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(Setting.SelectValue("EmailUserName"), Setting.SelectValue("EmailPassword"));
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(from, from);
                mail.To.Add(to);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;



                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                success = false;
                string strPath = HttpContext.Current.Server.MapPath("~/WebData/log.txt");
                Helper.IO.Logme(" Email Fail InnerException : " + ex.InnerException
                    + Environment.NewLine + "Email Fail Data" + ex.Data
                    + Environment.NewLine + "Email Fail Message" + ex.Message, strPath);

            }

            return success;
        }
    }

    public static string GetAppSetting(string name)
    {
        if (ConfigurationManager.AppSettings[name] != null)
            return System.Configuration.ConfigurationManager.AppSettings[name].ToString();
        else
            return "";
    }


    # region ObjectUtil


    public static object CreateInstance(string objectName, params object[] constructorArgs)
    {
        Type ObjectType = Type.GetType(objectName);

        return ObjectType.GetConstructor(new Type[] { }).Invoke(constructorArgs);
    }

    public static Type GetType(string objectName)
    {
        return Type.GetType(objectName);
    }


    public static System.Object GetObjectProperty(string mFullPath)
    {
        object Target = null;

        foreach (string partition in mFullPath.Split('\\'))
        {
            if (Target == null)
            {
                Target = CreateInstance(partition, new object[] { });
            }
            else
            {
                Target = Target.GetPropertyByName(partition);

            }
        }
        return Target;
    }


    # endregion
    # region Property
    public class Property
    {
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private object value;

        public object Value
        {
            get { return this.value; }
            set { this.value = value; }
        }

        private bool isReadOnly;

        public bool IsReadOnly
        {
            get { return isReadOnly; }
            set { isReadOnly = value; }
        }
    }
    # endregion
    # region ObjectExtention
    public static T GetRandom<T>(this IList<T> list)
    {

        if (list.Count == 0)
        {
            return default(T);
        }
        return list[new Random().Next(0, list.Count)];
    }


    public static Object GetPropertyByName(this Object mObject, string mPropertyName)
    {
        Type MyType = mObject.GetType();
        return MyType.GetProperty(mPropertyName.Trim()).GetValue(mObject, new object[] { });
    }

    public static List<Property> GetProperties(this Object mObject)
    {
        Type MyType = mObject.GetType();
        var properties = new List<Property>();
        var allproperties = MyType.GetProperties();
        foreach (var property in allproperties)
        {
            properties.Add(new Property() { Name = property.Name, Value = mObject.GetPropertyByName(property.Name), IsReadOnly = !property.CanWrite });
        }
        return properties;
    }

    public static void SetPropertyByName(this Object mObject, string mPropertyName, Object mValue)
    {
        Type MyType = mObject.GetType();
        MyType.GetProperty(mPropertyName).SetValue(mObject, mValue, new object[] { });
    }


    public static void SetPropertyByNameWithTypeCheck(this Object mObject, string mPropertyName, Object mValue)
    {
        mObject.SetPropertyByName(mPropertyName, mObject.GetType().GetProperty(mPropertyName).PropertyType.MakeThisType(mValue));
    }

    public static object CallMethodByName(this object mObject, string MethodName, params object[] argsRest)
    {

        List<Type> mTypes = new List<Type>();
        foreach (Object Param in argsRest)
        {
            mTypes.Add(Param.GetType());
        }


        Type MyType = mObject.GetType();
        MethodInfo Mi = MyType.GetMethod(MethodName, mTypes.ToArray());
        return Mi.Invoke(mObject, argsRest);
    }

    public static object CallMethodByName(this Type mType, string MethodName, params object[] argsRest)
    {

        List<Type> mTypes = new List<Type>();
        foreach (Object Param in argsRest)
        {
            mTypes.Add(Param.GetType());
        }


        //MethodInfo Mi = mType.GetMethod(MethodName, mTypes.ToArray());
        MethodInfo Mi = mType.GetMethod(MethodName, mTypes.ToArray());
        return Mi.Invoke(null, argsRest);
    }

    private static object MakeThisType(this Type mType, object Other)
    {
        if (string.IsNullOrEmpty(Other.ToString()))
        {
            return null;
        }
        if (mType.IsGenericType)
        {
            mType = Nullable.GetUnderlyingType(mType);
        }
        if (mType.Name == "Guid")
        {
            return new Guid(Other.ToString());
        }
        return Convert.ChangeType(Other, mType);
    }

    public static IList<object> AsGenericIList(this object obj)
    {
        List<object> result = new List<object>();
        foreach (object row in (obj as IEnumerable))
        {
            result.Add(row);
        }
        return result;
    }

    public static bool HasPropertyOfName(this object mObject, string mPropertyName)
    {
        Type MyType = mObject.GetType();
        return MyType.GetProperty(mPropertyName) != null;
    }



    public static object As(this object mObject, Type mType)
    {
        object result = mType.GetConstructor(new Type[] { }).Invoke(new object[] { });
        foreach (var property in result.GetProperties())
        {
            if (mObject.HasPropertyOfName(property.Name))
            {
                result.SetPropertyByName(property.Name, mObject.GetPropertyByName(property.Name));
            }
        }
        return result;
    }

    public static void MakePropertiesEqualTo(this object mObject, object obj)
    {
        foreach (var property in mObject.GetProperties())
        {
            try
            {
                if (obj.HasPropertyOfName(property.Name) && mObject.HasPropertyOfName(property.Name) && !property.IsReadOnly && mObject.GetType().GetProperty(property.Name).CanWrite)
                {
                    mObject.SetPropertyByName(property.Name, obj.GetPropertyByName(property.Name));
                }
            }
            catch
            {
                continue;
            }
        }
    }


    # endregion
    # region StringExtention


    public static string SupName(this String str, int i)
    {
        int istr = str.Length;

        if (istr > i)
        {
            var strs = str.Substring(0, i).Split(' ');
            if (strs.Count() > 0)
            {
                str = "";
                str = strs.Count() > 1
                          ? strs.Aggregate(str, (current, s) => current + ((s != strs.Last()) ? s + " " : ""))
                          : (strs[0] + " ");
                str = str.Remove(str.Length - 1, 1);
                str += " ..";
            }
        }
        return str;
    }
    public static string ToString(this NameValueCollection values)
    {
        string result = string.Empty;
        foreach (var key in values.AllKeys)
        {
            result += key + "=" + values[key];
        }
        return result;
    }
    public static string ToSubString(this string value, int Index)
    {
        string result = string.Empty;
        if (value.Length > Index)
            result = value.Substring(0, Index) + "...";
        else
            result = value + "...";
        return result;
    }


    public static string Multiply(this string mObject, int times)
    {
        string result = "";
        for (int i = 0; i < times; i++)
        {
            result += mObject;
        }
        return result;
    }

    public static string ReplacePlaceHolders(this string mObject, object obj)
    {
        if (obj != null)
        {
            foreach (var property in obj.GetProperties())
            {
                if (mObject.Contains(property.Name))
                {
                    if (property.Value == null)
                    {
                        mObject = mObject.Replace("{" + property.Name + "}", string.Empty);
                    }
                    else
                    {
                        mObject = mObject.Replace("{" + property.Name + "}", property.Value.ToString());
                    }
                }
            }
        }
        return mObject;
    }

    # endregion
    # region JSONHelper

    public static string ToJSON(this object obj)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        return serializer.Serialize(obj);
    }

    public static object JSONToObject<ObjectType>(string strObject)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        return serializer.Deserialize<ObjectType>(strObject);
    }

    public static string ToJSON(this object obj, int recursionDepth)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        serializer.RecursionLimit = recursionDepth;
        return serializer.Serialize(obj);
    }


    # endregion




    #region Files
    public class IO
    {

        public static void Logme(string body, string strPath)
        {
            if (Convert.ToBoolean(ConfigurationManager.AppSettings["IsLog"]))
            {

                if (File.Exists(strPath))
                {
                    StreamWriter strFile = new StreamWriter(strPath, true);
                    strFile.WriteLine(DateTime.Now.ToString() + " : " + body);
                    strFile.Close();
                }
                else
                {
                    File.WriteAllText(strPath, body);
                }
            }
        }

        public static string GetUniqueFileName(string fileName)
        {
            return System.Guid.NewGuid().ToString() + "_" + fileName.Replace(' ', '+');
        }

        public static void SaveFile(FileUpload fileUpload, string location, string fileName)
        {
            fileUpload.SaveAs(HttpContext.Current.Server.MapPath("~/") + location + fileName);
        }

        public static void DeleteFile(string location, string fileName)
        {
            string filePath = HttpContext.Current.Server.MapPath("~/") + location + fileName;
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }

        public static void DeleteFile(string fileName)
        {
            string filePath = HttpContext.Current.Server.MapPath(fileName);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }


        public static bool IsFileExist(string fileName)
        {
            string filePath = HttpContext.Current.Server.MapPath(fileName);
            if (File.Exists(filePath))
            {
                return true;
            }
            return false;
        }

        public static List<string> GetFilesInFolder(string sourceDir, string extension)
        {
            // Process the list of files found in the directory. 
            string[] fileEntries = Directory.GetFiles(sourceDir);
            List<string> filebath = new List<string>();
            foreach (string fileName in fileEntries)
            {
                if (System.IO.Path.GetExtension(fileName).ToLower() == extension)
                {
                    filebath.Add(fileName);
                }
            }
            return filebath;
        }

        public static bool IsValidImageFile(string fileName)
        {
            bool isValid = false;
            string fileExtension = fileName.Substring(fileName.LastIndexOf('.') + 1);
            string[] imageExtenstions = Helper.GetAppSetting("ImageExtensions").Split(',');
            foreach (string extension in imageExtenstions)
            {
                isValid |= (string.Compare(fileExtension.Trim(), extension.Trim(), true) == 0);
            }
            return isValid;
        }
        public static bool IsValidImageFile(string fileName, string Extension)
        {
            bool isValid = false;
            string fileExtension = fileName.Substring(fileName.LastIndexOf('.') + 1);


            isValid = (string.Compare(fileExtension.Trim(), Extension, true) == 0);

            return isValid;
        }
        public static bool IsValidFile(string fileName, string Extension)
        {
            bool isValid = false;
            string fileExtension = fileName.Substring(fileName.LastIndexOf('.') + 1);


            isValid = (string.Compare(fileExtension.Trim(), Extension, true) == 0);

            return isValid;
        }




        public static string GetFileExtension(string fileName)
        {
            return Path.GetExtension(fileName);
        }
        public static long GetFileSize(string fileName)
        {
            FileInfo f = new FileInfo(HttpContext.Current.Server.MapPath(fileName));
            return f.Length;
        }

        public static string ImageExtensions
        {
            get { return Helper.GetAppSetting("ImageExtensions").ToLower(); }
        }
        public static string MovieExtensions
        {
            get { return Helper.GetAppSetting("MovieExtensions").ToLower(); }
        }
        public static string FlashExtensions
        {
            get { return Helper.GetAppSetting("FlashExtensions").ToLower(); }
        }
        public static string FlVExtensions
        {
            get { return Helper.GetAppSetting("FlVExtensions").ToLower(); }
        }

        /// <summary>
        /// The type of the media
        /// </summary>


    }
    #endregion

    # region Image
    public class SoftCubeImage
    {
        public static void GetThumbnail(byte[] imageBytes, int ImageSize, string DestImage, int maxWidth, int maxHeight, bool fixedSizeBackground)
        {

            using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(imageBytes)))
            {



                float fltRes = image.HorizontalResolution / 3;

                if (fltRes > 50)

                    fltRes = 50;

                if (maxWidth < 1)

                    maxWidth = image.Width;

                if (maxHeight < 1)

                    maxHeight = image.Height;

                if (ImageSize > 120000)
                {

                    //if (image.Width > maxWidth || image.Height > maxHeight)
                    //{

                    //    double widthRatio = (double)image.Width / maxWidth;

                    //    double heightRatio = (double)image.Height / maxHeight;

                    //    double ratio = Math.Max(widthRatio, heightRatio);

                    //    int thumbWidth = (int)(image.Width / ratio);

                    //    int thumbHeight = (int)(image.Height / ratio);

                    //    if (fixedSizeBackground)
                    //    {

                    //        using (Bitmap bitmap = new Bitmap(maxWidth, maxHeight, PixelFormat.Format24bppRgb))
                    //        {

                    //            bitmap.SetResolution(fltRes, fltRes);



                    //            using (Graphics graphics = Graphics.FromImage(bitmap))
                    //            {

                    //                graphics.SmoothingMode = SmoothingMode.HighQuality;

                    //                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    //                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                    //                graphics.FillRectangle(new System.Drawing.SolidBrush(Color.Transparent), new System.Drawing.Rectangle(0, 0, maxWidth, maxHeight));

                    //                int x = (maxWidth - thumbWidth) / 2;

                    //                int y = (maxHeight - thumbHeight) / 2;

                    //                graphics.DrawImage(image, x, y, thumbWidth, thumbHeight);

                    //                bitmap.Save(DestImage);

                    //            }

                    //        }

                    //    }

                    //    else
                    //    {

                    //        using (Bitmap bitmap = new Bitmap(thumbWidth, thumbHeight, PixelFormat.Format24bppRgb))
                    //        {

                    //            bitmap.SetResolution(fltRes, fltRes);

                    //            using (Graphics graphics = Graphics.FromImage(bitmap))
                    //            {

                    //                graphics.SmoothingMode = SmoothingMode.HighQuality;

                    //                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    //                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                    //                graphics.FillRectangle(new System.Drawing.SolidBrush(Color.Transparent), new System.Drawing.Rectangle(0, 0, maxWidth, maxHeight));

                    //                graphics.DrawImage(image, 0, 0, thumbWidth, thumbHeight);

                    //                bitmap.Save(DestImage);

                    //            }

                    //        }

                    //    }

                    //}

                    //else
                    //{

                        using (Bitmap bitmap = new Bitmap(maxWidth, maxHeight, PixelFormat.Format24bppRgb))
                        {

                            bitmap.SetResolution(fltRes, fltRes);

                            using (Graphics graphics = Graphics.FromImage(bitmap))
                            {

                                graphics.SmoothingMode = SmoothingMode.HighQuality;

                                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                                graphics.FillRectangle(new System.Drawing.SolidBrush(Color.Transparent), new System.Drawing.Rectangle(0, 0, maxWidth, maxHeight));

                                graphics.DrawImage(image, 0, 0, maxWidth, maxHeight);

                                bitmap.Save(DestImage);

                            }

                        }

                    //}

                }

                else
                {

                    //image.Save(DestImage);

                    Bitmap bitmap = new Bitmap(image, maxWidth, maxHeight);

                    bitmap.SetResolution(image.HorizontalResolution, image.VerticalResolution);

                    bitmap.Save(DestImage);

                }

            }

        }

        public static void ResizeImage(Stream SourceImage, string DestImage, int OreginalDestWidth, int OreginalDestHeight, System.Drawing.Color FillColor, bool Transparent)
        {


            int DestWidth = 0;
            int DestHeight = 0;

            System.Drawing.Bitmap mImage = new System.Drawing.Bitmap(SourceImage);
            int Width = mImage.Width;


            if (((float)mImage.Width / (float)mImage.Height) > ((float)OreginalDestWidth / (float)OreginalDestHeight))
            {
                DestWidth = OreginalDestWidth;
                // Width is constant 
                DestHeight = OreginalDestWidth * mImage.Height / mImage.Width;

            }
            else
            {
                DestHeight = OreginalDestHeight;
                //Height is constant
                DestWidth = OreginalDestHeight * mImage.Width / mImage.Height;
            }





            int Height = mImage.Height;
            //int DestHeight2  =DestWidth  * Height / Width  ; 

            System.Drawing.Bitmap newImage = new System.Drawing.Bitmap(DestWidth, DestHeight);

            System.Drawing.Graphics G = System.Drawing.Graphics.FromImage(newImage);
            if (!Transparent)
                G.FillRectangle(new System.Drawing.SolidBrush(FillColor), new System.Drawing.Rectangle(0, 0, DestWidth, DestWidth));
            G.DrawImage(mImage, new System.Drawing.Rectangle(0, 0, DestWidth, DestHeight), new System.Drawing.Rectangle(0, 0, Width, Height), System.Drawing.GraphicsUnit.Pixel);
            newImage.Save(DestImage);
            G.Dispose();
            G = null;
            newImage.Dispose();
            newImage = null;

        }

    }
    # endregion

    # region Date
    public class Date
    {
        private static HttpContext cur = HttpContext.Current;

        private static int startGreg = 1900;
        private static int endGreg = 2100;
        private static string[] allFormats = { "yyyy/MM/dd", "yyyy/M/d", "dd/MM/yyyy", "d/M/yyyy", "dd/M/yyyy", "d/MM/yyyy", "yyyy-MM-dd", "yyyy-M-d", "dd-MM-yyyy", "d-M-yyyy", "dd-M-yyyy", "d-MM-yyyy", "yyyy MM dd", "yyyy M d", "dd MM yyyy", "d M yyyy", "dd M yyyy", "d MM yyyy" };
        private static CultureInfo arCul = new CultureInfo("ar-SA");
        private static CultureInfo enCul = new CultureInfo("en-US");
        private static System.Globalization.UmAlQuraCalendar h = new System.Globalization.UmAlQuraCalendar();
        private static GregorianCalendar g = new GregorianCalendar(GregorianCalendarTypes.USEnglish);



        /// <summary>
        /// Check if string is hijri date and then return true 
        /// </summary>
        /// <param name="hijri"></param>
        /// <returns></returns>
        public static bool IsHijri(string hijri)
        {
            arCul.DateTimeFormat.Calendar = h;
            if (hijri.Length <= 0)
            {

                cur.Trace.Warn("IsHijri Error: Date String is Empty");
                return false;
            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(hijri, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                if (tempDate.Year >= startGreg && tempDate.Year <= endGreg)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("IsHijri Error :" + hijri.ToString() + "\n" + ex.Message);
                return false;
            }

        }
        /// <summary>
        /// Check if string is Gregorian date and then return true 
        /// </summary>
        /// <param name="greg"></param>
        /// <returns></returns>
        public static bool IsGreg(string greg)
        {
            if (greg.Length <= 0)
            {

                cur.Trace.Warn("IsGreg :Date String is Empty");
                return false;
            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(greg, allFormats, enCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                if (tempDate.Year >= startGreg && tempDate.Year <= endGreg)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("IsGreg Error :" + greg.ToString() + "\n" + ex.Message);
                return false;
            }

        }

        /// <summary>
        /// Return Formatted Hijri date string 
        /// </summary>
        /// <param name="date"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string FormatHijri(string date, string format)
        {
            arCul.DateTimeFormat.Calendar = h;
            if (date.Length <= 0)
            {

                cur.Trace.Warn("Format :Date String is Empty");
                return "";
            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(date, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                return tempDate.ToString(format, arCul.DateTimeFormat);

            }
            catch (Exception ex)
            {
                cur.Trace.Warn("Date :\n" + ex.Message);
                return "";
            }

        }
        /// <summary>
        /// Returned Formatted Gregorian date string
        /// </summary>
        /// <param name="date"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string FormatGreg(string date, string format)
        {
            if (date.Length <= 0)
            {

                cur.Trace.Warn("Format :Date String is Empty");
                return "";
            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(date, allFormats, enCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                return tempDate.ToString(format, enCul.DateTimeFormat);

            }
            catch (Exception ex)
            {
                cur.Trace.Warn("Date :\n" + ex.Message);
                return "";
            }

        }
        /// <summary>
        /// Return Today Gregorian date and return it in yyyy/MM/dd format
        /// </summary>
        /// <returns></returns>
        public static string GDateNow()
        {
            try
            {
                return DateTime.Now.ToString("yyyy/MM/dd", enCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("GDateNow :\n" + ex.Message);
                return "";
            }
        }

        /// <summary>
        /// Return formatted today Gregorian date based on your format
        /// </summary>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string GDateNow(string format)
        {
            try
            {
                return DateTime.Now.ToString(format, enCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("GDateNow :\n" + ex.Message);
                return "";
            }
        }

        /// <summary>
        /// Return Today Hijri date and return it in yyyy/MM/dd format
        /// </summary>
        /// <returns></returns>
        public static string HDateNow()
        {
            arCul.DateTimeFormat.Calendar = h;
            try
            {
                return DateTime.Now.ToString("yyyy/MM/dd", arCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("HDateNow :\n" + ex.Message);
                return "";
            }
        }
        /// <summary>
        /// Return formatted today hijri date based on your format
        /// </summary>
        /// <param name="format"></param>
        /// <returns></returns>

        public static string HDateNow(string format)
        {
            arCul.DateTimeFormat.Calendar = h;
            try
            {
                return DateTime.Now.ToString(format, arCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("HDateNow :\n" + ex.Message);
                return "";
            }

        }

        /// <summary>
        /// Convert Hijri Date to it's equivalent Gregorian Date
        /// </summary>
        /// <param name="hijri">The Higri Date That Will Be Transformed</param>
        /// <returns>String of Gregorean Date</returns>
        public static string HijriToGreg(string hijri)
        {
            arCul.DateTimeFormat.Calendar = h;

            if (hijri.Length <= 0)
            {

                cur.Trace.Warn("HijriToGreg :Date String is Empty");
                return "";
            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(hijri, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                return tempDate.ToString("yyyy/MM/dd", enCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("HijriToGreg :" + hijri.ToString() + "\n" + ex.Message);
                return "";
            }
        }
        /// <summary>
        /// Convert Hijri Date to it's equivalent Gregorian Date and return it in specified format
        /// </summary>
        /// <param name="hijri"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string HijriToGreg(string hijri, string format)
        {
            arCul.DateTimeFormat.Calendar = h;

            if (hijri.Length <= 0)
            {

                cur.Trace.Warn("HijriToGreg :Date String is Empty");
                return "";
            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(hijri, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                return tempDate.ToString(format, enCul.DateTimeFormat);

            }
            catch (Exception ex)
            {
                cur.Trace.Warn("HijriToGreg :" + hijri.ToString() + "\n" + ex.Message);
                return "";
            }
        }
        /// <summary>
        /// Convert Gregoian Date to it's equivalent Hijir Date
        /// </summary>
        /// <param name="greg"></param>
        /// <returns></returns>
        public static string GregToHijri(string greg)
        {
            arCul.DateTimeFormat.Calendar = h;

            if (greg.Length <= 0)
            {
                return "";
            }

            DateTime tempDate = DateTime.ParseExact(greg, allFormats, enCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
            return tempDate.ToString("yyyy/MM/dd", arCul.DateTimeFormat);


        }
        /// <summary>
        /// Convert Hijri Date to it's equivalent Gregorian Date and return it in specified format
        /// </summary>
        /// <param name="greg"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string GregToHijri(string greg, string format)
        {
            arCul.DateTimeFormat.Calendar = h;

            if (greg.Length <= 0)
            {

                cur.Trace.Warn("GregToHijri :Date String is Empty");
                return "";
            }
            try
            {

                DateTime tempDate = DateTime.ParseExact(greg, allFormats, enCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                return tempDate.ToString(format, arCul.DateTimeFormat);

            }
            catch (Exception ex)
            {
                cur.Trace.Warn("GregToHijri :" + greg.ToString() + "\n" + ex.Message);
                return "";
            }
        }

        /// <summary>
        /// Return Gregrian Date Time as digit stamp
        /// </summary>
        /// <returns></returns>
        public static string GTimeStamp()
        {
            return GDateNow("yyyyMMddHHmmss");
        }
        /// <summary>
        /// Return Hijri Date Time as digit stamp
        /// </summary>
        /// <returns></returns>
        public static string HTimeStamp()
        {
            return HDateNow("yyyyMMddHHmmss");
        }

        /// <summary>
        /// Compare if the Hijri date between  other financial year and return True if within , False in not within
        /// </summary>
        /// <param name="dt">Data Table contain start date and end date ,,start date is the first column in table , end date is the second column in table</param>
        /// <param name="fromDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>


        /// <summary>
        /// Compare two instaces of string date and return indication of thier values 
        /// </summary>
        /// <param name="d1"></param>
        /// <param name="d2"></param>
        /// <returns>positive d1 is greater than d2,negative d1 is smaller than d2, 0 both are equal</returns>
        public static int Compare(string d1, string d2)
        {
            arCul.DateTimeFormat.Calendar = h;
            try
            {
                DateTime date1 = DateTime.ParseExact(d1, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                DateTime date2 = DateTime.ParseExact(d2, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                return DateTime.Compare(date1, date2);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("Compare :" + "\n" + ex.Message);
                return -1;
            }

        }

        public static DateTime hijritodate(string hijri)
        {
            return DateTime.ParseExact(hijri, allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);

        }

        public static DateTime? ConvertDate(string Date)
        {
            var dateValues = Date.Split('/');

            DateTime returnDate = Convert.ToDateTime(dateValues[1] + "/" + dateValues[2] + "/" + dateValues[0]);
            return returnDate;
        }


        public static string ColorData(string data, string keyWord, bool isColored, string className)
        {

            if (isColored)
            {
                return Regex.Replace(data, keyWord, "<span class='" + className + "'>" + keyWord + "</span>", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            }
            else
            {
                return data;
            }
        }

        public static DateTime? ParseDateTime(string dateTimeValue)
        {
            if (string.IsNullOrEmpty(dateTimeValue))
                return null;

            DateTime output = new DateTime();
            if (DateTime.TryParse(dateTimeValue, out output))
                return output;
            else
                return null;
        }

        public static string HijriDateNow()
        {
            try
            {
                return DateTime.Now.ToString("yyyy/MM/dd", arCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("GDateNow :\n" + ex.Message);
                return "";
            }
        }
        public static string HijriDateNow(string format)
        {
            try
            {
                return DateTime.Now.ToString(format, arCul.DateTimeFormat);
            }
            catch (Exception ex)
            {
                cur.Trace.Warn("GDateNow :\n" + ex.Message);
                return "";
            }
        }
        public static string GregToHijri(DateTime greg)
        {
            arCul.DateTimeFormat.Calendar = h;
            return greg.ToString("yyyy/MM/dd", arCul.DateTimeFormat);


        }

    }

    # endregion
}