<%@ WebHandler Language="C#" Class="ZoneHandler" %>

using System;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;


public class ZoneHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        var db = int.Parse(context.Request.QueryString["db"]);
        var val = context.Request.QueryString["val"];

       
        
        
        SqlConnection con = new SqlConnection("Data Source=mashaweeruae.db.9413790.hostedresource.com;Initial Catalog=mashaweeruae;User ID=mashaweeruae;Password=M1@3e4a6");

        con.Open();
        

         if (val == "shj")
        {
            try
            {
                SqlCommand com = new SqlCommand("Select zone_number from SharjahZone where ZoneId = " + db + "", con);
                context.Response.Write(com.ExecuteScalar().ToString());

            }
            catch (Exception exp)
            {

                context.Response.Write(exp.Message);

            }
        
        }
        
else
	{
             
	
        try
        {
            SqlCommand com = new SqlCommand("Select zone_number from Zone where ZoneId = "+db+"",con);

            context.Response.Write(com.ExecuteScalar().ToString());
            
            }
        catch (Exception exp)
        {

            context.Response.Write(exp.Message);
            
            
        }
        
    }
    
       }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}