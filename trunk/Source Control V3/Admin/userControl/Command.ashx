<%@ WebHandler Language="C#" Class="ConfirmationMessage" %>

using System;
using System.Reflection;
using System.Web;


public class ConfirmationMessage : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
         context.Response.ContentType = "text/plain";
        var commandString = context.Request.QueryString["Command"]; //ex:Member.Delete(1)
        if (commandString != null)
        {
            string command = commandString.Substring(0, commandString.IndexOf('('));
            string objectName = command.Substring(0, command.LastIndexOf('.'));
            string commandName = command.Substring(command.LastIndexOf('.') + 1);
            string[] commandParameters = commandString.Substring(commandString.IndexOf('(') + 1, commandString.IndexOf(')') - commandString.IndexOf('(') - 1).Split(',');
            MethodInfo method = Helper.GetType("Mashaweer.MashaweerDatabaseHandler").GetMethod(commandName,new []{typeof (object)});
            MethodInfo generic = method.MakeGenericMethod(Helper.GetType(objectName));
            string result = generic.Invoke(this, commandParameters).ToString();
            
            //string result = Helper.GetType(objectName).CallMethodByName(commandName, commandParameters).ToString();
            context.Response.Write(result);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}