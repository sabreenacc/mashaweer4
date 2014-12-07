using System.Linq;
public partial class Calculator : System.Web.UI.Page
{
    public string STRCity = "0";
    protected void Page_Load(object sender, System.EventArgs e)
    {

        if (Request.QueryString["ct"] != null)
        {
            STRCity = Request.QueryString["ct"];
        }

        if(!IsPostBack)
        {
            Session["PriceList"] = Mashaweer.MashaweerDatabaseHandler.GetAll<ZonePrice>();
        }
    }
}