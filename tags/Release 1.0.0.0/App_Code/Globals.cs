using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Globals
/// </summary>
public static class Globals
{
    public static string MashaweerLanguage
    {
        get { 
            try
            {
                return HttpContext.Current.Session["MashaweerLanguage"].ToString();
            }
            catch
            {
                return "en";
            }
        }
        set { HttpContext.Current.Session["MashaweerLanguage"] = value; }
    }
    public static IEnumerable<T> Include<T, TInclude>(this IQueryable<T> query, System.Linq.Expressions.Expression<Func<T, TInclude>> sidecar)
    {
        var elementParameter = sidecar.Parameters.Single();
        var tupleType = typeof(Tuple<T, TInclude>);
        var sidecarSelector = System.Linq.Expressions.Expression.Lambda<Func<T, Tuple<T, TInclude>>>(
           System.Linq.Expressions.Expression.New(tupleType.GetConstructor(new[] { typeof(T), typeof(TInclude) }),
              new[] { elementParameter, sidecar.Body },
              tupleType.GetProperty("Item1"), tupleType.GetProperty("Item2")), elementParameter);
        return query.Select(sidecarSelector).AsEnumerable().Select(t => t.Item1);
    }
}