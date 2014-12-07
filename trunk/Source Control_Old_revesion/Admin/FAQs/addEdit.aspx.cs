using System;
using System.Linq;
using Mashaweer;

public partial class Admin_FAQs_addEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString.AllKeys.Contains("ID"))
            {
                int ret = 0;
                bool result = int.TryParse(Request.QueryString["ID"], out ret);
                if (!result)
                    Response.Redirect("Default.aspx");

                FAQid = ret;
                filldata();
            }
            else
            {
                FAQid = 0;
            }
        }
    }

    public int FAQid
    {
        get { return int.Parse(ViewState["FAQId"].ToString()); }
        set { ViewState["FAQId"] = value; }
    }

    protected void btnSaveExit_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("Default.aspx");
        }
    }

    public bool InsertOrUpdate()
    {
        bool success = false;
        if (FAQid == 0)
        {
             
                FAQid =
                    int.Parse(
                        new FAQ
                        {
                            Question = txtQuestion.Text,
                            Answer = txtAnswer.Text,
                            Language = int.Parse(ddlLang.SelectedValue) 
                        }.Insert().ToString());
                success = true;
        }
        else
        {
           
                bool isUpdated =
                    new FAQ
                    {
                        FAQId = FAQid,
                        Question = txtQuestion.Text,
                        Answer = txtAnswer.Text,
                        Language = int.Parse(ddlLang.SelectedValue) 
                    }.Update();
                success = isUpdated;
        }
        return success;
    }

    private void filldata()
    {
        FAQ objFAQ = MashaweerDatabaseHandler.Single<FAQ>(FAQid);

        if (objFAQ != null)
        {
            txtQuestion.Text = objFAQ.Question;
            txtAnswer.Text = objFAQ.Answer;
            ddlLang.SelectedValue = objFAQ.Language.ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (InsertOrUpdate())
        {
            Response.Redirect("addEdit.aspx?ID=" + FAQid);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}