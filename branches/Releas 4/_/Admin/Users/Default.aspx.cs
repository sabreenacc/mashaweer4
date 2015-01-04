using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Mashaweer;
using System.Collections.Generic;
public partial class Admin_User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        lvUser.DataBind();
    }
    protected void lnqUser_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        e.Result = MashaweerDatabaseHandler.Search<SysUser>(p => p.UserName.Contains(txtUserName.Text.Trim()) || p.Name.Contains(txtUserName.Text.Trim())).OrderByDescending(p => p.UserID).ToList();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        lvUser.DataBind();
    }
    protected void Sorting_Click(object sender, EventArgs e)
    {
        string sortExpression = ((LinkButton)sender).CommandArgument;
        if (lvUser.SortExpression == sortExpression)
        {
            lvUser.Sort(sortExpression, lvUser.SortDirection == SortDirection.Ascending ? SortDirection.Descending : SortDirection.Ascending);
        }
        else
        {
            lvUser.Sort(sortExpression, SortDirection.Ascending);
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
