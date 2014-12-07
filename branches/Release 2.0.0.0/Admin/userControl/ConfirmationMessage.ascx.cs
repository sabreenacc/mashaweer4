using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmationMessage : System.Web.UI.UserControl
{
     
    //ex:Member.Delete(1)
    //LvRow_id
    public string Command
    {
        get { return ViewState["command"].ToString(); }
        set {  ViewState["command"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
}