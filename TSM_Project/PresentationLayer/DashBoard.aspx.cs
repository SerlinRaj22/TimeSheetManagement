using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TSM_Project
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbusername.Text = Session["User_Name"] as string;
            populateLabelCount();
            BarchartDataBind();
            piechartDataBind();

        }



        void selectRole()
        {

            if (Session["Role_Name"] != null)
            {
                lbemprole.Text = Convert.ToString(Session["Role_Name"]);
            }

            //string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con1 = new SqlConnection(cs1))
            //{
            //    con1.Open();
            //    String sqlString4 = "select R.Role_name from Employee_Master_Table E JOIN Role_Table R on E.Role_ID=R.Role_ID WHERE E.User_Name='" + lbusername.Text + "'";
            //    SqlCommand cmd4 = new SqlCommand(sqlString4, con1);

            //    SqlDataReader sdr = cmd4.ExecuteReader();
            //    {
            //        sdr.Read();

            //        lbemprole.Text = sdr["Role_name"].ToString();

            //        DataBind();

            //    }

            //}
        }
        void selectmail()
        {
            if(Session["Email"] != null)
            {
                linklbmail.Text = Convert.ToString(Session["Email"]);
            }
           // string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
           // using (SqlConnection con1 = new SqlConnection(cs1))
          //  {
             //   con1.Open();
             //   String sqlString4 = "select E.Email from Employee_Master_Table E WHERE E.User_Name='" + lbusername.Text + "'";
              //  SqlCommand cmd4 = new SqlCommand(sqlString4, con1);

              //  SqlDataReader sdr = cmd4.ExecuteReader();
              //  {
                //    sdr.Read();

                 //   linklbmail.Text = sdr["Email"].ToString();

                 //   DataBind();

               // }

           // }
        }


        void populateLabelCount()
        {
            string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(cs1))
            {

                SqlCommand cmd1 = new SqlCommand("get_count",con1);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@EmployeeCount", SqlDbType.Int);
                cmd1.Parameters["@EmployeeCount"].Direction = ParameterDirection.Output;
                cmd1.Parameters.Add("@TimeSheetCount", SqlDbType.Int);
                cmd1.Parameters["@TimeSheetCount"].Direction = ParameterDirection.Output;
                cmd1.Parameters.Add("@ProjectCount", SqlDbType.Int);
                cmd1.Parameters["@ProjectCount"].Direction = ParameterDirection.Output;

                con1.Open();
                cmd1.ExecuteNonQuery();
                con1.Close();
                lbempcount.Text = cmd1.Parameters["@EmployeeCount"].Value.ToString();
                lbTScount.Text= cmd1.Parameters["@TimeSheetCount"].Value.ToString();
                lbprojectcount.Text = cmd1.Parameters["@ProjectCount"].Value.ToString();

              

               // string sqlString2 = "SELECT COUNT(*) FROM Project_Master_table";
                //SqlCommand cmd2 = new SqlCommand(sqlString2, con1);
              //  int projectcount = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
              //  lbprojectcount.Text = projectcount.ToString();

             //   string sqlString3 = "SELECT COUNT (*) FROM Time_sheet";
             //   SqlCommand cmd3 = new SqlCommand(sqlString3, con1);
             //   int TScount = Convert.ToInt32(cmd3.ExecuteScalar().ToString());
             //   lbTScount.Text = TScount.ToString();

                lbtime.Text = DateTime.Now.ToString("hh:mm:ss");
                selectRole();
                selectmail();

            }

        }

        void BarchartDataBind()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string Sqlquery = "SELECT Date,SUM(CAST(DATEDIFF(MINUTE, T.Start_Time,T.End_Time) AS float)/CAST(60 AS float) ) as Time FROM Time_sheet T WHERE  T.UserName= '" + lbusername.Text + "' GROUP BY CONVERT(date, T.Date)";
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

                Chart2.Series["Series2"].XValueMember = "Date";
                Chart2.Series["Series2"].YValueMembers = "Time";


                Chart2.DataSource = sdr;
                Chart2.DataBind();

            }
        }




    }

}

