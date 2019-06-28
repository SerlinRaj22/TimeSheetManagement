﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace TSM_Project
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbusername.Text = Session["User_Name"] as string;

            BarchartDataBind();
            piechartDataBind();
        }
        void BarchartDataBind()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string Sqlquery = "SELECT Date,SUM(CAST(DATEDIFF(MINUTE, T.Start_Time,T.End_Time) AS float)/CAST(60 AS float) ) as Time FROM Time_sheet T WHERE  T.UserName= '"+lbusername.Text+"' GROUP BY CONVERT(date, T.Date)";
                SqlCommand cmd = new SqlCommand(Sqlquery, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                Chart1.Series["Series1"].IsValueShownAsLabel = true;
                Chart1.Series["Series1"].XValueMember = "Date";
                Chart1.Series["Series1"].YValueMembers = "Time";
                Chart1.DataSource = sdr;
                Chart1.DataBind();

            }
        }
        void piechartDataBind()
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string Sqlquery = "SELECT Date,SUM(CAST(DATEDIFF(MINUTE, T.Start_Time,T.End_Time) AS float)/CAST(60 AS float) ) as Time FROM Time_sheet T WHERE  T.UserName= '" + lbusername.Text + "' GROUP BY CONVERT(date, T.Date)";
                SqlCommand cmd = new SqlCommand(Sqlquery, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                Chart2.Series["Series2"].IsValueShownAsLabel = true;

                Chart2.Series["Series2"].XValueMember= "Date";
                Chart2.Series["Series2"].YValueMembers = "Time";
               
               
                Chart2.DataSource = sdr;
                Chart2.DataBind();

            }
        }

    }
}