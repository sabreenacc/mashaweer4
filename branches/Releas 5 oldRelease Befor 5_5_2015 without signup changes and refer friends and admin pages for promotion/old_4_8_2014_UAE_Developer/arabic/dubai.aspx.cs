﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dubai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
/*
        //ltrlCalculatorTitle.Text = Resources.LanguageFile.CALCULATOR;
        ltrlCalculatorMapGuide.Text = Resources.LanguageFile.CALCULATOR_MAP_GUIDE;
        ltrlReset.Text = Resources.LanguageFile.RESET;
        ltrlReset1.Text = Resources.LanguageFile.RESET;
        //ltrlMashaweerWall.Text = Resources.LanguageFile.WRITE_ON_MASHAWEER_WALL;
        ltrlFrom.Text = Resources.LanguageFile.FROM;
        ltrlFrom1.Text = Resources.LanguageFile.FROM;
        ltrlbyMtrCle.Text = Resources.LanguageFile.BYMOTORCYCLE;
        ltrlbyMtrCle1.Text = Resources.LanguageFile.BYMOTORCYCLE;*/

        if (!IsPostBack)
        {
            Session["PriceList"] = Mashaweer.MashaweerDatabaseHandler.GetAll<ZonePrice>();
        }

    }
}