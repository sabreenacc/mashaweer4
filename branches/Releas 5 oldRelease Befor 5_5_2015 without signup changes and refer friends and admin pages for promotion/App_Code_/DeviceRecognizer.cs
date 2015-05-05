using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeviceRecognizer
/// </summary>
public class DeviceRecognizer
{
    public static string RecongnizeDevice(HttpRequest request)
    {
	// Please Check this URL for the Main Code
	// http://www.schiffner.com/programming-php-classes/php-mobile-device-detection/
        var wap2 = false;
        var iphone = false;
        var android = false;
        var iemobile = false;
        var imode = false;
        var wap = false;
        var html = false;
		var blackberry = false;

        var userBrowser = request.ServerVariables["HTTP_ACCEPT"];
        var useragent = request.ServerVariables["HTTP_USER_AGENT"];
        if (userBrowser.ToLower().Contains("application/vnd.wap.xhtml+xml"))
            wap2 = true;
        else if (useragent.Contains("iPod") || useragent.Contains("iPhone") || useragent.Contains("iPad"))
            iphone = true;
        else if (useragent.Contains("Android"))
            android = true;
        else if (useragent.Contains("BlackBerry") || useragent.Contains("BB10") || useragent.Contains("PlayBook") || useragent.Contains("RIM Tablet"))
            blackberry = true;
        else if (useragent.Contains("IEMobile"))
            iemobile = true;
        else if (userBrowser.ToLower().Contains("DoCoMo/") || userBrowser.ToLower().Contains("portalmmm/"))
            imode = true;
        else if (userBrowser.ToLower().Contains("text/vnd.wap.wml"))
            wap = true;
        else if (userBrowser.ToLower().Contains("text/html"))
            html = true;

        var browserType = "web";

        if (wap || wap2 || imode || html || android || iphone || iemobile || blackberry)
        {
            var WIRELESS_PROTOCOL = wap ? "wap" : (wap2 ? "wap2" : (iphone ? "iphone" : (imode ? "imode" : (iemobile ? "IEMobile" : (html ? "html" : (blackberry ? "BlackBerry" : (android ? "Android" : "")))))));
            switch (WIRELESS_PROTOCOL)
            {
                case "wap":
                    browserType = "mobile";
                    break;
                case "wap2":
                    browserType = "mobile";
                    break;
                case "imode":
                    browserType = "mobile";
                    break;
                case "iphone":
                    browserType = "smartphone";
                    break;
                case "Android":
                    browserType = "smartphone";
                    break;
                case "BlackBerry":
                    browserType = "smartphone";
                    break;
                case "IEMobile":
                    browserType = "smartphone";
                    break;
                case "html":
                    var mobile_browser = 0;

                    if (new System.Text.RegularExpressions.Regex(@"/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone)/i").IsMatch(useragent.ToLower()))
                        mobile_browser++;

                    if (request.ServerVariables["HTTP_ACCEPT"].ToLower().IndexOf("application/vnd.wap.xhtml+xml") > 0 || (!String.IsNullOrEmpty(request.ServerVariables["HTTP_X_WAP_PROFILE"]) || !String.IsNullOrEmpty(request.ServerVariables["HTTP_PROFILE"])))
                        mobile_browser++;

                    var mobile_ua = useragent.Substring(0, 4).ToLower();
                    var mobile_agents = new string[] {"w3c ","acs-","alav","alca","amoi","audi","avan","benq","bird","blac",
                                                      "blaz","brew","cell","cldc","cmd-","dang","doco","eric","hipt","inno",
                                                      "ipaq","java","jigs","kddi","keji","leno","lg-c","lg-d","lg-g","lge-",
                                                      "maui","maxo","midp","mits","mmef","mobi","mot-","moto","mwbp","nec-",
                                                      "newt","noki","oper","palm","pana","pant","phil","play","port","prox",
                                                      "qwap","sage","sams","sany","sch-","sec-","send","seri","sgh-","shar",
                                                      "sie-","siem","smal","smar","sony","sph-","symb","t-mo","teli","tim-",
                                                      "tosh","tsm-","upg1","upsi","vk-v","voda","wap-","wapa","wapi","wapp",
                                                      "wapr","webc","winw","winw","xda","xda-"};

                    if (mobile_agents.Contains(mobile_ua))
                        mobile_browser++;

                    if (request.ServerVariables["ALL_HTTP"].ToLower().IndexOf("OperaMini") > 0)
                        mobile_browser++;

                    if (useragent.ToLower().IndexOf("iemobile") > 0)
                        mobile_browser++;

                    if (useragent.ToLower().IndexOf("windows") > 0)
                        mobile_browser = 0;

                    if (mobile_browser > 0)
                        browserType = "mobile";
                    else
                        browserType = "web";
                    break;
                default:
                    browserType = "web";
                    break;
            }
        }
        else
        {
            var mobile_browser = 0;

            if (new System.Text.RegularExpressions.Regex(@"/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone)/i").IsMatch(useragent.ToLower()))
                mobile_browser++;

            if (request.ServerVariables["HTTP_ACCEPT"].ToLower().IndexOf("application/vnd.wap.xhtml+xml") > 0 || (!String.IsNullOrEmpty(request.ServerVariables["HTTP_X_WAP_PROFILE"]) || !String.IsNullOrEmpty(request.ServerVariables["HTTP_PROFILE"])))
                mobile_browser++;

            var mobile_ua = useragent.Substring(0, 4).ToLower();
            var mobile_agents = new string[] {"w3c ","acs-","alav","alca","amoi","audi","avan","benq","bird","blac",
                                              "blaz","brew","cell","cldc","cmd-","dang","doco","eric","hipt","inno",
                                              "ipaq","java","jigs","kddi","keji","leno","lg-c","lg-d","lg-g","lge-",
                                              "maui","maxo","midp","mits","mmef","mobi","mot-","moto","mwbp","nec-",
                                              "newt","noki","oper","palm","pana","pant","phil","play","port","prox",
                                              "qwap","sage","sams","sany","sch-","sec-","send","seri","sgh-","shar",
                                              "sie-","siem","smal","smar","sony","sph-","symb","t-mo","teli","tim-",
                                              "tosh","tsm-","upg1","upsi","vk-v","voda","wap-","wapa","wapi","wapp",
                                              "wapr","webc","winw","winw","xda","xda-"};

            if (mobile_agents.Contains(mobile_ua))
                mobile_browser++;

            if (request.ServerVariables["ALL_HTTP"].ToLower().IndexOf("OperaMini") > 0)
                mobile_browser++;

            if (useragent.ToLower().IndexOf("iemobile") > 0)
                mobile_browser++;

            if (useragent.ToLower().IndexOf("windows") > 0)
                mobile_browser = 0;

            if (mobile_browser > 0)
                browserType = "mobile";
            else
                browserType = "web";
        }

        return browserType == "smartphone" ? "mobile" : browserType;
    }
}