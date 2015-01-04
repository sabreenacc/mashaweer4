using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using System.Net;

public partial class order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            SqlConnection con = new SqlConnection(@"Data Source=mashaweeruae.db.9413790.hostedresource.com;Initial Catalog=mashaweeruae;User ID=mashaweeruae;Password=M1@3e4a6");

            //initializing from cities
            SqlCommand com = new SqlCommand("SELECT ZoneId,ArabicName FROM AcrossZone ORDER BY ArabicName", con);
            SqlCommand command;
            SqlDataReader MyReader;

            SqlDataReader reader;


            try
            {
                ListItem newItem = new ListItem();

                con.Open();
                reader = com.ExecuteReader();

                while (reader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = reader["ArabicName"].ToString();
                    newItem.Value = reader["ZoneId"].ToString();

                    CityFromARB.Items.Add(newItem);
                    CityToARB.Items.Add(newItem);

                }

                reader.Close();

            }
            catch (Exception exp)
            {

                Response.Write(exp.Message);

            }



            //initializing dropdown for area
            SqlCommand com2 = new SqlCommand("SELECT ZoneId,ArabicName FROM Zone ORDER BY ArabicName", con);


            SqlDataReader reader2;

            try
            {
                ListItem newItem = new ListItem();

                //  con.Open();
                reader2 = com2.ExecuteReader();

                while (reader2.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = reader2["ArabicName"].ToString();
                    newItem.Value = reader2["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    AreaFromARB.Items.Add(newItem);
                    AreaToARB.Items.Add(newItem);


                }

                reader2.Close();


                //Initializing Area for sharjah to to sharjah 
                command = new SqlCommand("SELECT ZoneId,ArabicName FROM SharjahZone ORDER BY ArabicName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["ArabicName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlAreaShjFrom1ARB.Items.Add(newItem);
                    ddlAreaShjTo1ARB.Items.Add(newItem);


                }

                MyReader.Close();



                //Initializing Area for Dubai to sharjah

                command = new SqlCommand("SELECT ZoneId,ArabicName FROM Zone ORDER BY ArabicName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["ArabicName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlAreaDxbFrom1ARB.Items.Add(newItem);


                }

                MyReader.Close();


                command = new SqlCommand("SELECT ZoneId,ArabicName FROM SharjahZone ORDER BY ArabicName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["ArabicName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlAreaShjTo2ARB.Items.Add(newItem);


                }

                MyReader.Close();

                //Initializing From Sharjah To Dubai
                command = new SqlCommand("SELECT ZoneId,ArabicName FROM SharjahZone ORDER BY ArabicName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["ArabicName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlFromSharjahARB.Items.Add(newItem);

                }

                MyReader.Close();


                command = new SqlCommand("SELECT ZoneId,ArabicName FROM Zone ORDER BY ArabicName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["ArabicName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlToDubaiARB.Items.Add(newItem);

                }

                MyReader.Close();

                //Disabling and hiding dropdowns
                AreaFromARB.Enabled = false;
                //AreaFromARB.Visible = false;
                AreaToARB.Enabled = false;
                // AreaToARB.Visible = false;
                ddlAreaShjFrom1ARB.Enabled = false;
                ddlAreaShjFrom1ARB.Visible = false;
                ddlAreaShjTo1ARB.Enabled = false;
                ddlAreaShjTo1ARB.Visible = false;
                ddlAreaDxbFrom1ARB.Enabled = false;
                ddlAreaDxbFrom1ARB.Visible = false;
                ddlAreaShjTo2ARB.Enabled = false;
                ddlAreaShjTo2ARB.Visible = false;
                ddlFromSharjahARB.Visible = false;
                ddlFromSharjahARB.Enabled = false;
                ddlToDubaiARB.Enabled = false;
                ddlToDubaiARB.Visible = false;
                disableOnLoad();

                CityFromARB.Items.Add(new ListItem("الرجاء اختيار مدينة"));
                CityToARB.Items.Add(new ListItem("الرجاء اختيار مدينة"));
                CityFromARB.SelectedIndex = 8;
                CityToARB.SelectedIndex = 8;
            }
            catch (Exception exp)
            {

                Response.Write(exp.Message);


            }

        }

    }


    public void disableOnLoad()
    {


        AreaFromARB.Style.Add("background-color", "#d5d5d5");
        AreaFromARB.Style.Add("border-color", "#d5d5d5");
        AreaFromARB.Style.Add("color", "#d5d5d5");

        AreaToARB.Style.Add("background-color", "#d5d5d5");
        AreaToARB.Style.Add("border-color", "#d5d5d5");
        AreaToARB.Style.Add("color", "#d5d5d5");

        ddlAreaShjFrom1ARB.Style.Add("background-color", "#d5d5d5");
        ddlAreaShjFrom1ARB.Style.Add("border-color", "#d5d5d5");
        ddlAreaShjFrom1ARB.Style.Add("color", "#d5d5d5");

        ddlAreaShjTo1ARB.Style.Add("background-color", "#d5d5d5");
        ddlAreaShjTo1ARB.Style.Add("border-color", "#d5d5d5");
        ddlAreaShjTo1ARB.Style.Add("color", "#d5d5d5");

        ddlAreaShjTo2ARB.Style.Add("background-color", "#d5d5d5");
        ddlAreaShjTo2ARB.Style.Add("border-color", "#d5d5d5");
        ddlAreaShjTo2ARB.Style.Add("color", "#d5d5d5");

        ddlFromSharjahARB.Style.Add("background-color", "#fff");
        ddlFromSharjahARB.Style.Add("border-color", "#fff");
        ddlFromSharjahARB.Style.Add("color", "#000");

        ddlToDubaiARB.Style.Add("background-color", "#fff");
        ddlToDubaiARB.Style.Add("border-color", "#fff");
        ddlToDubaiARB.Style.Add("color", "#000");


    }


    protected void DDLRate(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(@"Data Source=mashaweeruae.db.9413790.hostedresource.com;Initial Catalog=mashaweeruae;User ID=mashaweeruae;Password=M1@3e4a6");
        try
        {

            if (Int32.Parse(CityFromARB.SelectedValue) == 3 && Int32.Parse(CityToARB.SelectedValue) == 3)
            {
                ddlAreaShjFrom1ARB.Enabled = false;
                ddlAreaShjFrom1ARB.Visible = false;
                ddlAreaShjTo1ARB.Enabled = false;
                ddlAreaShjTo1ARB.Visible = false;
                ddlAreaDxbFrom1ARB.Enabled = false;
                ddlAreaDxbFrom1ARB.Visible = false;
                ddlAreaShjTo2ARB.Enabled = false;
                ddlAreaShjTo2ARB.Visible = false;
                ddlFromSharjahARB.Enabled = false;
                ddlFromSharjahARB.Visible = false;
                ddlToDubaiARB.Enabled = false;
                ddlToDubaiARB.Visible = false;


                string ZoneAreaFromARB;
                string ZoneAreaToARB;

                if (AreaFromARB.Enabled == false && AreaToARB.Enabled == false)
                {

                    AreaFromARB.Enabled = true;
                    AreaToARB.Enabled = true;
                    AreaFromARB.Visible = true;
                    AreaToARB.Visible = true;

                }

                AreaFromARB.Style.Add("background-color", "#fff");
                AreaFromARB.Style.Add("border-color", "#fff");
                AreaFromARB.Style.Add("color", "#000");

                AreaToARB.Style.Add("background-color", "#fff");
                AreaToARB.Style.Add("border-color", "#fff");
                AreaToARB.Style.Add("color", "#000");


                //getting zone_number for areas

                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "ZoneHandler.ashx");

                WebClient cl = new WebClient();
                ZoneAreaFromARB = cl.DownloadString(rep.ToString() + "?db=" + AreaFromARB.SelectedValue + "");
                ZoneAreaToARB = cl.DownloadString(rep.ToString() + "?db=" + AreaToARB.SelectedValue + "");


                //calculating Area cost
                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "CalculateHandler.ashx");



                //lblPrice.Text = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + ZoneAreaFromARB + "&to=" + ZoneAreaToARB + "");
                lblPrice.Text = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + AreaFromARB.SelectedValue + "&to=" + AreaToARB.SelectedValue + "");


            }
            //check if sharjah to sharjah

            else if (Int32.Parse(CityFromARB.SelectedValue) == 4 && Int32.Parse(CityToARB.SelectedValue) == 4)
            {
                AreaFromARB.Enabled = false;
                AreaToARB.Enabled = false;
                AreaFromARB.Visible = false;
                AreaToARB.Visible = false;
                ddlAreaDxbFrom1ARB.Enabled = false;
                ddlAreaDxbFrom1ARB.Visible = false;
                ddlAreaShjTo2ARB.Enabled = false;
                ddlAreaShjTo2ARB.Visible = false;
                ddlFromSharjahARB.Enabled = false;
                ddlFromSharjahARB.Visible = false;
                ddlToDubaiARB.Enabled = false;
                ddlToDubaiARB.Visible = false;

                ddlAreaShjFrom1ARB.Enabled = true;
                ddlAreaShjFrom1ARB.Visible = true;
                ddlAreaShjTo1ARB.Enabled = true;
                ddlAreaShjTo1ARB.Visible = true;

                ddlAreaShjFrom1ARB.Style.Add("background-color", "#fff");
                ddlAreaShjFrom1ARB.Style.Add("border-color", "#fff");
                ddlAreaShjFrom1ARB.Style.Add("color", "#000");

                ddlAreaShjTo1ARB.Style.Add("background-color", "#fff");
                ddlAreaShjTo1ARB.Style.Add("border-color", "#fff");
                ddlAreaShjTo1ARB.Style.Add("color", "#000");


                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "PriceCalc.ashx");
                WebClient cl = new WebClient();

                string getVal = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + ddlAreaShjFrom1ARB.SelectedValue + "&to=" + ddlAreaShjTo1ARB.SelectedValue + "");
                if (getVal == "Coming Soon!")
                {
                    //transPort.Style.Add("display", "none");
                    lblPrice.Text = getVal;
                }


                else
                {
                    var temp = getVal.IndexOf('.');
                    lblPrice.Text = getVal.Remove(temp);

                }


            }


            else if (Int32.Parse(CityFromARB.SelectedValue) == 3 && Int32.Parse(CityToARB.SelectedValue) == 4)
            {
                AreaFromARB.Enabled = false;
                AreaToARB.Enabled = false;
                AreaFromARB.Visible = false;
                AreaToARB.Visible = false;

                ddlAreaShjFrom1ARB.Enabled = false;
                ddlAreaShjFrom1ARB.Visible = false;
                ddlAreaShjTo1ARB.Enabled = false;
                ddlAreaShjTo1ARB.Visible = false;
                ddlFromSharjahARB.Enabled = false;
                ddlFromSharjahARB.Visible = false;
                ddlToDubaiARB.Enabled = false;
                ddlToDubaiARB.Visible = false;

                ddlAreaDxbFrom1ARB.Enabled = true;
                ddlAreaDxbFrom1ARB.Visible = true;
                ddlAreaShjTo2ARB.Enabled = true;
                ddlAreaShjTo2ARB.Visible = true;

                ddlAreaDxbFrom1ARB.Style.Add("background-color", "#fff");
                ddlAreaDxbFrom1ARB.Style.Add("border-color", "#fff");
                ddlAreaDxbFrom1ARB.Style.Add("color", "#000");

                ddlAreaShjTo2ARB.Style.Add("background-color", "#fff");
                ddlAreaShjTo2ARB.Style.Add("border-color", "#fff");
                ddlAreaShjTo2ARB.Style.Add("color", "#000");

                string ZoneAreaFromARB;
                string ZoneAreaToARB;

                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "ZoneHandler.ashx");
                WebClient cl = new WebClient();
                ZoneAreaFromARB = cl.DownloadString(rep.ToString() + "?db=" + ddlAreaDxbFrom1ARB.SelectedValue + "&val=dxb");
                ZoneAreaToARB = cl.DownloadString(rep.ToString() + "?db=" + ddlAreaShjTo2ARB.SelectedValue + "&val=shj");
                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "DxbToShjHandler.ashx");
                string getVal = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + ZoneAreaFromARB + "&to=" + ZoneAreaToARB + "");

                if (getVal == "Coming Soon!")
                {
                    //transPort.Style.Add("display", "none");
                    lblPrice.Text = getVal;
                }


                else
                {
                    var temp = getVal.IndexOf('.');
                    lblPrice.Text = getVal.Remove(temp);

                }



            }

                  //Checking Sharjah To Dubai
            else if (Int32.Parse(CityFromARB.SelectedValue) == 4 && Int32.Parse(CityToARB.SelectedValue) == 3)
            {

                AreaFromARB.Enabled = false;
                AreaToARB.Enabled = false;
                AreaFromARB.Visible = false;
                AreaToARB.Visible = false;

                ddlAreaShjFrom1ARB.Enabled = false;
                ddlAreaShjFrom1ARB.Visible = false;
                ddlAreaShjTo1ARB.Enabled = false;
                ddlAreaShjTo1ARB.Visible = false;
                ddlFromSharjahARB.Enabled = true;
                ddlFromSharjahARB.Visible = true;
                ddlToDubaiARB.Enabled = true;
                ddlToDubaiARB.Visible = true;

                ddlAreaDxbFrom1ARB.Enabled = false;
                ddlAreaDxbFrom1ARB.Visible = false;
                ddlAreaShjTo2ARB.Enabled = false;
                ddlAreaShjTo2ARB.Visible = false;

                ddlToDubaiARB.Style.Add("background-color", "#fff");
                ddlToDubaiARB.Style.Add("border-color", "#fff");
                ddlToDubaiARB.Style.Add("color", "#000");

                ddlFromSharjahARB.Style.Add("background-color", "#fff");
                ddlFromSharjahARB.Style.Add("border-color", "#fff");
                ddlFromSharjahARB.Style.Add("color", "#000");



                string ZoneAreaFromARB;
                string ZoneAreaToARB;

                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "ZoneHandler.ashx");
                WebClient cl = new WebClient();
                ZoneAreaFromARB = cl.DownloadString(rep.ToString() + "?db=" + ddlFromSharjahARB.SelectedValue + "&val=shj");
                ZoneAreaToARB = cl.DownloadString(rep.ToString() + "?db=" + ddlToDubaiARB.SelectedValue + "&val=dxb");
                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "DxbToShjHandler.ashx");
                string getVal = cl.DownloadString(rep2.ToString() + "?type=1&db=2&from=" + ZoneAreaFromARB + "&to=" + ZoneAreaToARB + "");


                if (getVal == "Coming Soon!")
                {
                    //transPort.Style.Add("display", "none");
                    lblPrice.Text = getVal;
                }


                else
                {
                    var temp = getVal.IndexOf('.');
                    lblPrice.Text = getVal.Remove(temp);

                }



            }


            else
            {
                disableOnLoad();
                AreaFromARB.Enabled = false;
                AreaFromARB.Visible = true;
                AreaToARB.Enabled = false;
                AreaToARB.Visible = true;
                ddlAreaShjFrom1ARB.Enabled = false;
                ddlAreaShjFrom1ARB.Visible = false;
                ddlAreaShjTo1ARB.Enabled = false;
                ddlAreaShjTo1ARB.Visible = false;
                ddlAreaDxbFrom1ARB.Enabled = false;
                ddlAreaDxbFrom1ARB.Visible = false;
                ddlAreaShjTo2ARB.Enabled = false;
                ddlAreaShjTo2ARB.Visible = false;
                ddlFromSharjahARB.Visible = false;
                ddlFromSharjahARB.Enabled = false;
                ddlToDubaiARB.Enabled = false;
                ddlToDubaiARB.Visible = false;


                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "Handler.ashx");


                WebClient cl = new WebClient();
                string getVal = cl.DownloadString(rep.ToString() + "?type=1&db=1&from=" + CityFromARB.SelectedValue + "&to=" + CityToARB.SelectedValue + "");

                if (getVal == "Coming Soon!")
                {
                    //transPort.Style.Add("display", "none");
                    lblPrice.Text = getVal;
                }


                else
                {
                    var temp = getVal.IndexOf('.');
                    lblPrice.Text = getVal.Remove(temp);

                }



            }

        }
        catch (Exception exp)
        {

            //lblPrice.Text = "Oops!. Looks like an error. Try again later.";
             //lblPrice.Text = exp.Message;
        }



    }
}


