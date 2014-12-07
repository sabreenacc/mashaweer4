using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mashaweer;

public partial class Admin_News_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        lvNew.DataBind();
    }
    protected void lnqNew_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        e.Result = MashaweerDatabaseHandler.Search<New>(p => p.Title.Contains(txtSearch.Text.Trim()) || p.Description.Contains(txtSearch.Text.Trim()) );
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lvNew.DataBind();
    }
    protected void Sorting_Click(object sender, EventArgs e)
    {

        string sortExpression = ((LinkButton)sender).CommandArgument;
        if (lvNew.SortExpression == sortExpression)
        {
            lvNew.Sort(sortExpression, lvNew.SortDirection == SortDirection.Ascending ? SortDirection.Descending : SortDirection.Ascending);
        }
        else
        {
            lvNew.Sort(sortExpression, SortDirection.Ascending);
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