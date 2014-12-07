using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

public partial class Admin_userControl_Menu : System.Web.UI.UserControl
{

    private MenuItemCollection items;

    [PersistenceMode(PersistenceMode.InnerProperty)]
    [Browsable(true)]
    public MenuItemCollection Items
    {
        get
        {
            if (items == null)
            {
                items = new MenuItemCollection();
            }
            return items;
        }
        set { items = value; }
    }

    protected int selectedItem, selectedSubItem;

    protected void Page_Load(object sender, EventArgs e)
    {
       
       
        if (items != null)
        {  for (int i = 0; i < items.Count; i++)
            {
                if (items[i].NavigateUrl != string.Empty)
                {
                    string strNavPath = items[i].NavigateUrl.ToLower().Split('/')[2];
                    string strAbspath = Request.Url.AbsolutePath.ToLower().Split('/')[2];



                    if (strAbspath == strNavPath)
                    {
                        selectedItem = i;
                    }
                    
                    if (strAbspath != "default.aspx")
                    {
                        for (int j = 0; j < items[i].ChildItems.Count; j++)
                        {
                            if (items[i].ChildItems[j].NavigateUrl.ToLower().Split('/').Count() > 2)
                            {
                                string strNavChPath = items[i].ChildItems[j].NavigateUrl.ToLower().Split('/')[2];
                                string strAbsChpath = Request.Url.AbsolutePath.ToLower().Split('/')[2];
                           
                                if (Request.Url.AbsolutePath.ToLower() == items[i].ChildItems[j].NavigateUrl.ToLower())
                                {
                                    selectedItem = i;
                                    selectedSubItem = j;
                                    break;
                                }
                            }
                        }
                        
                    }
                }
            }
        }

    }

   
}