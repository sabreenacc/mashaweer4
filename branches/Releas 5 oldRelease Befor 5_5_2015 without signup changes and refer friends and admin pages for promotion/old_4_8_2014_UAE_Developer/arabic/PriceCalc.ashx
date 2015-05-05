<%@ WebHandler Language="C#" Class="PriceCalc" %>

using System;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;

public class PriceCalc : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var vechileType = context.Request.QueryString["Type"];
        var fromplace = int.Parse(context.Request.QueryString["from"]);
        var toplace = int.Parse(context.Request.QueryString["to"]);
        var db = int.Parse(context.Request.QueryString["db"]);


        SqlConnection con = new SqlConnection("Data Source=mashaweeruae.db.9413790.hostedresource.com;Initial Catalog=mashaweeruae;User ID=mashaweeruae;Password=M1@3e4a6");

        con.Open();

        try
        {
            string result1;
            //double flag;
            SqlCommand com;






            com = new SqlCommand("select CarPrice from mashaweeruae.SharjahZonePrice where FromZone = " + fromplace + " AND ToZone = " + toplace + " OR fromZone=" + toplace + " AND toZone=" + fromplace + "", con);


            //com.ExecuteNonQuery();
            //context.Response.Write(com.ExecuteScalar().ToString());                
            //num = (int ?) com.ExecuteScalar() ?? 0;

            result1 = com.ExecuteScalar().ToString();
         /*   string getVal = result1;
            var temp = result1.IndexOf('.');
            string result = getVal.Remove(temp);*/

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