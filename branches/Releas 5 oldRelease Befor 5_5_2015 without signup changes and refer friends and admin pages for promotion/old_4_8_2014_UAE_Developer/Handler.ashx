<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       
        context.Response.ContentType = "text/plain";
        var vechileType = context.Request.QueryString["Type"];
        var fromplace = int.Parse(context.Request.QueryString["from"]);
        var toplace = int.Parse(context.Request.QueryString["to"]);
        var db = int.Parse(context.Request.QueryString["db"]);

       // fromplace = 9;

        SqlConnection con = new SqlConnection("Data Source=mashaweeruae.db.9413790.hostedresource.com;Initial Catalog=mashaweeruae;User ID=mashaweeruae;Password=M1@3e4a6");
        con.Open();

        
            try
            {
                string result;
                double flag;
                 SqlCommand com;
              
               
                  
               
                
                
             com = new SqlCommand("select VanPrice from mashaweeruae.AcrossZonePrice where FromZone = " + fromplace + " AND ToZone = " + toplace + " OR fromZone=" + toplace + " AND toZone=" + fromplace + "", con);
                        
                
                //com.ExecuteNonQuery();
                //context.Response.Write(com.ExecuteScalar().ToString());                
                //num = (int ?) com.ExecuteScalar() ?? 0;

                result = com.ExecuteScalar().ToString();

                flag = Convert.ToDouble(result);

                if (flag == -2.00000)
                {
                    context.Response.Write("Redirecting to Dubai Map");

                }

                else if (flag == -3.00000)
                {
                    context.Response.Write("Redirecting...");
                }

                else if (flag == -4.00000)
                {
                    context.Response.Write("Redirecting to Sharjah Map");
                }
                        
                else if (flag == -1.00000)
                {
                    context.Response.Write("Coming Soon!");
                }

                else
                    context.Response.Write(com.ExecuteScalar().ToString());                
                    //context.Response.Redirect("default2.aspx?price=" +com.ExecuteScalar()+"");
                
                
            }
            catch (Exception exp)
            {
                context.Response.Write(exp.Message);                
                
            }
        
            
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}