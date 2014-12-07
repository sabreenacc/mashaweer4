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

public partial class Setting
{
    public static string SelectValue(string settingKey)
    {
        var setting = Mashaweer.MashaweerDatabaseHandler.Search<Setting>(s => s.SettingKey == settingKey).SingleOrDefault();
        return setting == null ? "" : setting.SettingValue;
    }
}
