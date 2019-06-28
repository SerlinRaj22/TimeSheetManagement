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

            viewEmployee();
            populateLabelCount();
        }

       void viewEmployee()
        {
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {

                string sqlString = "SELECT Date,SUM(CAST(DATEDIFF(MINUTE, T.Start_Time,T.End_Time) AS float)/CAST(60 AS float) ) as Time FROM Time_sheet T WHERE  T.UserName=T.UserName GROUP BY CONVERT(date, T.Date) ";
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlString, con);

                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {

                EmpView.DataSource = dt;
                EmpView.DataBind();


            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                EmpView.DataSource = dt;
                EmpView.DataBind();
                EmpView.Rows[0].Cells.Clear();
                EmpView.Rows[0].Cells.Add(new TableCell());
                EmpView.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                EmpView.Rows[0].Cells[0].Text = "No Data Found";
                EmpView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }


        }


        void selectRole()
        {
            string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(cs1))
            {
                con1.Open();
                String sqlString4 = "select R.Role_name from Employee_Master_Table E JOIN Role_Table R on E.Role_ID=R.Role_ID WHERE E.User_Name='" + lbusername.Text + "'";
                SqlCommand cmd4 = new SqlCommand(sqlString4, con1);

                SqlDataReader sdr = cmd4.ExecuteReader();
                {
                    sdr.Read();

                    lbemprole.Text = sdr["Role_name"].ToString();

                    DataBind();

                }

            }
        }
        void selectmail()
        {
            string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(cs1))
            {
                con1.Open();
                String sqlString4 = "select E.Email from Employee_Master_Table E WHERE E.User_Name='" + lbusername.Text + "'";
                SqlCommand cmd4 = new SqlCommand(sqlString4, con1);

                SqlDataReader sdr = cmd4.ExecuteReader();
                {
                    sdr.Read();

                    linklbmail.Text = sdr["Email"].ToString();

                    DataBind();

                }

            }
        }


        void populateLabelCount()
        {
            string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(cs1))
            {
                con1.Open();

                string sqlString = "SELECT COUNT (*) FROM Employee_Master_Table";
                SqlCommand cmd1 = new SqlCommand(sqlString, con1);
                int empcount = Convert.ToInt32(cmd1.ExecuteScalar().ToString());
                lbempcount.Text = empcount.ToString();

                string sqlString2 = "SELECT COUNT(*) FROM Project_Master_table";
                SqlCommand cmd2 = new SqlCommand(sqlString2, con1);
                int projectcount = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
                lbprojectcount.Text = projectcount.ToString();

                string sqlString3 = "SELECT COUNT (*) FROM Time_sheet";
                SqlCommand cmd3 = new SqlCommand(sqlString3, con1);
                int TScount = Convert.ToInt32(cmd3.ExecuteScalar().ToString());
                lbTScount.Text = TScount.ToString();

                lbtime.Text = DateTime.Now.ToString("hh:mm:ss");
                selectRole();
                selectmail();

            }

        }


    }

}

