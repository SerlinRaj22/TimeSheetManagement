using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Configuration;
using System.Data;


namespace TSM_Project
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbusername.Text = Session["User_Name"] as string;
            if (!Page.IsPostBack)
            {
                populateProject();
            }           
        }
        void populateProject()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT Project_ID,Project_Name FROM Project_Master_table";
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlString, con);
                ddlproject.DataSource = cmd.ExecuteReader();
                ddlproject.DataTextField = "Project_Name";
                ddlproject.DataValueField = "Project_ID";
                ddlproject.DataBind();
                ddlproject.Items.Insert(0, new ListItem("Select Project", "0"));
                con.Close();


            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                lberror.Text = "";
                lbsuccess.Text = "";
                string username = lbusername.Text;
                string date = txtDate.Text;
                string strtime = txtstarttime.Text;
                string endtime = txtendtime.Text;
                string dd = ddlproject.Text;
                string ErrMsg = "";
                string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (string.IsNullOrEmpty(date) || string.IsNullOrEmpty(strtime)|| string.IsNullOrEmpty(endtime)|| (dd=="0") || string.IsNullOrEmpty(username))
                {
                    ErrMsg = ErrMsg + "Please fill all blank fields </br>";
                }
              
                    if (string.IsNullOrEmpty(ErrMsg))

                    {
                    

                        if (date == currentDate)
                        {
                            //  populateProject();
                            string sqlString = "INSERT INTO Time_sheet(Date,Start_Time,End_Time,Project_ID,UserName) VALUES(@Date,@Start_Time,@End_Time,@Project_ID,@UserName) ";
                            con.Open();
                            SqlCommand cmd = new SqlCommand(sqlString, con);
                            cmd.Parameters.AddWithValue("@UserName", lbusername.Text);
                            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                            cmd.Parameters.AddWithValue("@Start_Time", txtstarttime.Text);
                            cmd.Parameters.AddWithValue("@End_Time", txtendtime.Text);
                            cmd.Parameters.AddWithValue("@Project_ID", ddlproject.Text);
                            cmd.ExecuteNonQuery();
                            txtDate.Text = "";
                            txtstarttime.Text = "";
                            txtendtime.Text = "";
                            ddlproject.SelectedValue = "0";
                            lbsuccess.Text = "Added a new timesheet";
                        }
                        else
                        {
                        lberror.Text = "Please select today's date ";

                        }
                    }
                    else
                    {
                        lberror.Text = ErrMsg;

                    }

               
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtDate.Text = "";
            txtstarttime.Text = "";
            txtendtime.Text = "";

            populateProject();

        }
    }
}