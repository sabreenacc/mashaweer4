public partial class AboutUS : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        ltrlAboutUSTitle.Text = Resources.LanguageFile.ABOUTMASHAWEER;
        ltrlAboutUsContent.Text = Resources.LanguageFile.ABOUTUS_CONTENT;
    }
}