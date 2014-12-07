using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calculator2 : System.Web.UI.Page
{
    protected string lng = "en";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lng = HttpContext.Current.Request.Cookies["MashaweerLanguage"] == null
                             ? "en"
                             : (HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"] == null
                                    ? "en"
                                    : HttpContext.Current.Request.Cookies["MashaweerLanguage"]["Language"]);

            ltrlCalculatorTitle.Text = Resources.LanguageFile.CALCULATOR;
            ltrlCalculatorMapGuide.Text = Resources.LanguageFile.CALCULATOR_MAP_GUIDE;
            ltrlReset.Text = Resources.LanguageFile.RESET;
            ltrlReset1.Text = Resources.LanguageFile.RESET;
            //ltrlMashaweerWall.Text = Resources.LanguageFile.WRITE_ON_MASHAWEER_WALL;
            ltrlFrom.Text = Resources.LanguageFile.FROM;
            ltrlFrom1.Text = Resources.LanguageFile.FROM;
            ltrlbyMtrCle.Text = Resources.LanguageFile.BYMOTORCYCLE;
            ltrlbyMtrCle1.Text = Resources.LanguageFile.BYMOTORCYCLE;
            if (!IsPostBack)
            {
                Session["PriceList"] = Mashaweer.MashaweerDatabaseHandler.GetAll<ZonePrice>();
            }
        }
    }
}