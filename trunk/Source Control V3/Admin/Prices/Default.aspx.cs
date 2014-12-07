using System;
using System.Web.UI.WebControls;
using System.Linq;
using Mashaweer;
public partial class Admin_Prices_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        lvPrices.DataBind();
    }
    protected void lnqPrice_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        e.Result = MashaweerDatabaseHandler.Search<ZonePrice>(p => p.Zone.ArabicName.Contains(txtSearch.Text.Trim()) || p.Zone1.ArabicName.Contains(txtSearch.Text.Trim()) || p.Zone.EnglishName.Contains(txtSearch.Text.Trim()) || p.Zone1.EnglishName.Contains(txtSearch.Text.Trim())).ToList().Select(prc => new { prc.PriceId, ZoneFrom = prc.Zone.ArabicName, ZoneTo = prc.Zone1.ArabicName, prc.CarPrice, prc.MotorcyclePrice});
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lvPrices.DataBind();
    }
    protected void Sorting_Click(object sender, EventArgs e)
    {

        string sortExpression = ((LinkButton)sender).CommandArgument;
        if (lvPrices.SortExpression == sortExpression)
        {
            lvPrices.Sort(sortExpression, lvPrices.SortDirection == SortDirection.Ascending ? SortDirection.Descending : SortDirection.Ascending);
        }
        else
        {
            lvPrices.Sort(sortExpression, SortDirection.Ascending);
        }
    }

    protected void TemplatePagerField_OnPagerCommand(object sender, DataPagerCommandEventArgs e)
    {
        // Check which button raised the event
        switch (e.CommandName)
        {
            case "Next":
                int newIndex = e.Item.Pager.StartRowIndex + e.Item.Pager.PageSize;
                if (newIndex <= e.TotalRowCount)
                {
                    e.NewStartRowIndex = newIndex;
                    e.NewMaximumRows = e.Item.Pager.MaximumRows;
                }
                break;
            case "Previous":
                e.NewStartRowIndex = e.Item.Pager.StartRowIndex - e.Item.Pager.PageSize;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "Last":
                e.NewStartRowIndex = e.Item.Pager.TotalRowCount - e.Item.Pager.PageSize + 1;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "First":
                e.NewStartRowIndex = 0;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;

        }
    }
}
