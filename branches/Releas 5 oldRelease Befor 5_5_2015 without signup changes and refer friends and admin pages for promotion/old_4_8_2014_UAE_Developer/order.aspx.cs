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
            SqlCommand com = new SqlCommand("SELECT ZoneId,EnglishName FROM AcrossZone ORDER BY EnglishName", con);
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
                    newItem.Text = reader["EnglishName"].ToString();
                    newItem.Value = reader["ZoneId"].ToString();

                    CityFrom.Items.Add(newItem);
                    CityTo.Items.Add(newItem);

                }

                reader.Close();

            }
            catch (Exception exp)
            {

                Response.Write(exp.Message);

            }



            //initializing dropdown for area
            SqlCommand com2 = new SqlCommand("SELECT ZoneId,EnglishName FROM Zone ORDER BY EnglishName", con);


            SqlDataReader reader2;

            try
            {
                ListItem newItem = new ListItem();

                //  con.Open();
                reader2 = com2.ExecuteReader();

                while (reader2.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = reader2["EnglishName"].ToString();
                    newItem.Value = reader2["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    AreaFrom.Items.Add(newItem);
                    AreaTo.Items.Add(newItem);


                }

                reader2.Close();


                //Initializing Area for sharjah to to sharjah 
                command = new SqlCommand("SELECT ZoneId,EnglishName FROM SharjahZone ORDER BY EnglishName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["EnglishName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlAreaShjFrom1.Items.Add(newItem);
                    ddlAreaShjTo1.Items.Add(newItem);


                }

                MyReader.Close();



                //Initializing Area for Dubai to sharjah

                command = new SqlCommand("SELECT ZoneId,EnglishName FROM Zone ORDER BY EnglishName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["EnglishName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlAreaDxbFrom1.Items.Add(newItem);


                }

                MyReader.Close();


                command = new SqlCommand("SELECT ZoneId,EnglishName FROM SharjahZone ORDER BY EnglishName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["EnglishName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlAreaShjTo2.Items.Add(newItem);


                }

                MyReader.Close();

                //Initializing From Sharjah To Dubai
                command = new SqlCommand("SELECT ZoneId,EnglishName FROM SharjahZone ORDER BY EnglishName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["EnglishName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlFromSharjah.Items.Add(newItem);

                }

                MyReader.Close();


                command = new SqlCommand("SELECT ZoneId,EnglishName FROM Zone ORDER BY EnglishName", con);
                newItem = new ListItem();

                MyReader = command.ExecuteReader();

                while (MyReader.Read())
                {
                    newItem = new ListItem();
                    newItem.Text = MyReader["EnglishName"].ToString();
                    newItem.Value = MyReader["ZoneId"].ToString();

                    // DropDownList1.Items.Add(newItem);
                    ddlToDubai.Items.Add(newItem);

                }

                MyReader.Close();

                //Disabling and hiding dropdowns
                AreaFrom.Enabled = false;
                //AreaFrom.Visible = false;
                AreaTo.Enabled = false;
                // AreaTo.Visible = false;
                ddlAreaShjFrom1.Enabled = false;
                ddlAreaShjFrom1.Visible = false;
                ddlAreaShjTo1.Enabled = false;
                ddlAreaShjTo1.Visible = false;
                ddlAreaDxbFrom1.Enabled = false;
                ddlAreaDxbFrom1.Visible = false;
                ddlAreaShjTo2.Enabled = false;
                ddlAreaShjTo2.Visible = false;
                ddlFromSharjah.Visible = false;
                ddlFromSharjah.Enabled = false;
                ddlToDubai.Enabled = false;
                ddlToDubai.Visible = false;
                disableOnLoad();

                CityFrom.Items.Add(new ListItem("Please select city"));
                CityTo.Items.Add(new ListItem("Please select city"));
                CityFrom.SelectedIndex = 8;
                CityTo.SelectedIndex = 8;
            }
            catch (Exception exp)
            {

                Response.Write(exp.Message);


            }

        }

    }


    public void disableOnLoad()
    {
        

        AreaFrom.Style.Add("background-color", "#d5d5d5");
        AreaFrom.Style.Add("border-color", "#d5d5d5");
        AreaFrom.Style.Add("color", "#d5d5d5");

        AreaTo.Style.Add("background-color", "#d5d5d5");
        AreaTo.Style.Add("border-color", "#d5d5d5");
        AreaTo.Style.Add("color", "#d5d5d5");

        ddlAreaShjFrom1.Style.Add("background-color", "#d5d5d5");
        ddlAreaShjFrom1.Style.Add("border-color", "#d5d5d5");
        ddlAreaShjFrom1.Style.Add("color", "#d5d5d5");

        ddlAreaShjTo1.Style.Add("background-color", "#d5d5d5");
        ddlAreaShjTo1.Style.Add("border-color", "#d5d5d5");
        ddlAreaShjTo1.Style.Add("color", "#d5d5d5");

        ddlAreaShjTo2.Style.Add("background-color", "#d5d5d5");
        ddlAreaShjTo2.Style.Add("border-color", "#d5d5d5");
        ddlAreaShjTo2.Style.Add("color", "#d5d5d5");

        ddlFromSharjah.Style.Add("background-color", "#fff");
        ddlFromSharjah.Style.Add("border-color", "#fff");
        ddlFromSharjah.Style.Add("color", "#000");

        ddlToDubai.Style.Add("background-color", "#fff");
        ddlToDubai.Style.Add("border-color", "#fff");
        ddlToDubai.Style.Add("color", "#000");

        
    }


    protected void DDLRate(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(@"Data Source=mashaweeruae.db.9413790.hostedresource.com;Initial Catalog=mashaweeruae;User ID=mashaweeruae;Password=M1@3e4a6");
        try
        {

            if (Int32.Parse(CityFrom.SelectedValue) == 3 && Int32.Parse(CityTo.SelectedValue) == 3)
            {
                ddlAreaShjFrom1.Enabled = false;
                ddlAreaShjFrom1.Visible = false;
                ddlAreaShjTo1.Enabled = false;
                ddlAreaShjTo1.Visible = false;
                ddlAreaDxbFrom1.Enabled = false;
                ddlAreaDxbFrom1.Visible = false;
                ddlAreaShjTo2.Enabled = false;
                ddlAreaShjTo2.Visible = false;
                ddlFromSharjah.Enabled = false;
                ddlFromSharjah.Visible = false;
                ddlToDubai.Enabled = false;
                ddlToDubai.Visible = false;

               
                string ZoneAreaFrom;
                string ZoneAreaTo;

                if (AreaFrom.Enabled == false && AreaTo.Enabled == false)
                {

                    AreaFrom.Enabled = true;
                    AreaTo.Enabled = true;
                    AreaFrom.Visible = true;
                    AreaTo.Visible = true;
                    
                }

                AreaFrom.Style.Add("background-color", "#fff");
                AreaFrom.Style.Add("border-color", "#fff");
                AreaFrom.Style.Add("color", "#000");

                AreaTo.Style.Add("background-color", "#fff");
                AreaTo.Style.Add("border-color", "#fff");
                AreaTo.Style.Add("color", "#000");


                //getting zone_number for areas

                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "ZoneHandler.ashx");

                WebClient cl = new WebClient();
                ZoneAreaFrom = cl.DownloadString(rep.ToString() + "?db=" + AreaFrom.SelectedValue + "");
                ZoneAreaTo = cl.DownloadString(rep.ToString() + "?db=" + AreaTo.SelectedValue + "");


                //calculating Area cost
                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "CalculateHandler.ashx");



                //lblPrice.Text = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + ZoneAreaFrom + "&to=" + ZoneAreaTo + "");
                lblPrice.Text = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + AreaFrom.SelectedValue + "&to=" + AreaTo.SelectedValue + "");


            }
            //check if sharjah to sharjah

            else if (Int32.Parse(CityFrom.SelectedValue) == 4 && Int32.Parse(CityTo.SelectedValue) == 4)
            {
                AreaFrom.Enabled = false;
                AreaTo.Enabled = false;
                AreaFrom.Visible = false;
                AreaTo.Visible = false;
                ddlAreaDxbFrom1.Enabled = false;
                ddlAreaDxbFrom1.Visible = false;
                ddlAreaShjTo2.Enabled = false;
                ddlAreaShjTo2.Visible = false;
                ddlFromSharjah.Enabled = false;
                ddlFromSharjah.Visible = false;
                ddlToDubai.Enabled = false;
                ddlToDubai.Visible = false;

                ddlAreaShjFrom1.Enabled = true;
                ddlAreaShjFrom1.Visible = true;
                ddlAreaShjTo1.Enabled = true;
                ddlAreaShjTo1.Visible = true;

                ddlAreaShjFrom1.Style.Add("background-color", "#fff");
                ddlAreaShjFrom1.Style.Add("border-color", "#fff");
                ddlAreaShjFrom1.Style.Add("color", "#000");

                ddlAreaShjTo1.Style.Add("background-color", "#fff");
                ddlAreaShjTo1.Style.Add("border-color", "#fff");
                ddlAreaShjTo1.Style.Add("color", "#000");


                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "PriceCalc.ashx");
                WebClient cl = new WebClient();

                string getVal = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + ddlAreaShjFrom1.SelectedValue + "&to=" + ddlAreaShjTo1.SelectedValue + "");
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


            else if (Int32.Parse(CityFrom.SelectedValue) == 3 && Int32.Parse(CityTo.SelectedValue) == 4)
            {
                AreaFrom.Enabled = false;
                AreaTo.Enabled = false;
                AreaFrom.Visible = false;
                AreaTo.Visible = false;

                ddlAreaShjFrom1.Enabled = false;
                ddlAreaShjFrom1.Visible = false;
                ddlAreaShjTo1.Enabled = false;
                ddlAreaShjTo1.Visible = false;
                ddlFromSharjah.Enabled = false;
                ddlFromSharjah.Visible = false;
                ddlToDubai.Enabled = false;
                ddlToDubai.Visible = false;

                ddlAreaDxbFrom1.Enabled = true;
                ddlAreaDxbFrom1.Visible = true;
                ddlAreaShjTo2.Enabled = true;
                ddlAreaShjTo2.Visible = true;

                ddlAreaDxbFrom1.Style.Add("background-color", "#fff");
                ddlAreaDxbFrom1.Style.Add("border-color", "#fff");
                ddlAreaDxbFrom1.Style.Add("color", "#000");

                ddlAreaShjTo2.Style.Add("background-color", "#fff");
                ddlAreaShjTo2.Style.Add("border-color", "#fff");
                ddlAreaShjTo2.Style.Add("color", "#000");

                string ZoneAreaFrom;
                string ZoneAreaTo;

                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "ZoneHandler.ashx");
                WebClient cl = new WebClient();
                ZoneAreaFrom = cl.DownloadString(rep.ToString() + "?db=" + ddlAreaDxbFrom1.SelectedValue + "&val=dxb");
                ZoneAreaTo = cl.DownloadString(rep.ToString() + "?db=" + ddlAreaShjTo2.SelectedValue + "&val=shj");
                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "DxbToShjHandler.ashx");
                string getVal = cl.DownloadString(rep2.ToString() + "?type=1&db=1&from=" + ZoneAreaFrom + "&to=" + ZoneAreaTo + "");

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
            else if (Int32.Parse(CityFrom.SelectedValue) == 4 && Int32.Parse(CityTo.SelectedValue) == 3)
            {

                AreaFrom.Enabled = false;
                AreaTo.Enabled = false;
                AreaFrom.Visible = false;
                AreaTo.Visible = false;

                ddlAreaShjFrom1.Enabled = false;
                ddlAreaShjFrom1.Visible = false;
                ddlAreaShjTo1.Enabled = false;
                ddlAreaShjTo1.Visible = false;
                ddlFromSharjah.Enabled = true;
                ddlFromSharjah.Visible = true;
                ddlToDubai.Enabled = true;
                ddlToDubai.Visible = true;

                ddlAreaDxbFrom1.Enabled = false;
                ddlAreaDxbFrom1.Visible = false;
                ddlAreaShjTo2.Enabled = false;
                ddlAreaShjTo2.Visible = false;

                ddlToDubai.Style.Add("background-color", "#fff");
                ddlToDubai.Style.Add("border-color", "#fff");
                ddlToDubai.Style.Add("color", "#000");

                ddlFromSharjah.Style.Add("background-color", "#fff");
                ddlFromSharjah.Style.Add("border-color", "#fff");
                ddlFromSharjah.Style.Add("color", "#000");



                string ZoneAreaFrom;
                string ZoneAreaTo;

                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "ZoneHandler.ashx");
                WebClient cl = new WebClient();
                ZoneAreaFrom = cl.DownloadString(rep.ToString() + "?db=" + ddlFromSharjah.SelectedValue + "&val=shj");
                ZoneAreaTo = cl.DownloadString(rep.ToString() + "?db=" + ddlToDubai.SelectedValue + "&val=dxb");
                StringBuilder rep2 = new StringBuilder(data);
                rep2.Replace("order.aspx", "DxbToShjHandler.ashx");
                string getVal = cl.DownloadString(rep2.ToString() + "?type=1&db=2&from=" + ZoneAreaFrom + "&to=" + ZoneAreaTo + "");


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
                AreaFrom.Enabled = false;
                AreaFrom.Visible = true;
                AreaTo.Enabled = false;
                AreaTo.Visible = true;
                ddlAreaShjFrom1.Enabled = false;
                ddlAreaShjFrom1.Visible = false;
                ddlAreaShjTo1.Enabled = false;
                ddlAreaShjTo1.Visible = false;
                ddlAreaDxbFrom1.Enabled = false;
                ddlAreaDxbFrom1.Visible = false;
                ddlAreaShjTo2.Enabled = false;
                ddlAreaShjTo2.Visible = false;
                ddlFromSharjah.Visible = false;
                ddlFromSharjah.Enabled = false;
                ddlToDubai.Enabled = false;
                ddlToDubai.Visible = false;


                Uri my = Request.Url;
                string data;
                data = my.AbsoluteUri;

                StringBuilder rep = new StringBuilder(data);
                rep.Replace("order.aspx", "Handler.ashx");


                WebClient cl = new WebClient();
                string getVal = cl.DownloadString(rep.ToString() + "?type=1&db=1&from=" + CityFrom.SelectedValue + "&to=" + CityTo.SelectedValue + "");

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
            // lblPrice.Text = exp.Message;
        }



    }
}


