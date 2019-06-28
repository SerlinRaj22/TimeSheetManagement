using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TSM_Project
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbusername.Text = Session["User_Name"] as string;
                lbroleid.Text = Session["Role_ID"] as string;
                lbempid.Text = Session["Emp_ID"] as string;
                if (lbroleid.Text == "5")
                {
                  DataTable dt =  viewRequestList(0, true);
                    EmpView.DataSource = dt;
                    EmpView.DataBind();

                }
            }

        }


        public DataTable viewRequestList(int Approve_ID, Boolean isViewAll = false)
        {
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "";

                if (isViewAll)
                {
                    sqlString = "SELECT * FROM ApproveTable";
                }
                else
                {
                    sqlString = "SELECT * FROM ApproveTable Where Approve_ID=" + Approve_ID;
                }

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlString, con);

                sda.Fill(dt);
            }
            return dt;

        }



        //https://www.slideshare.net/MonotheistSakib/employee-management-system-62900052
        protected void EmpView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ApproveEmployee")
            {
                int app = Convert.ToInt32(e.CommandArgument);
                DataTable dt = viewRequestList(app);
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string sqlString = "UPDATE Employee_Master_Table SET First_Name= '" + dt.Rows[0]["updatedFirst_name"] + "',Last_Name='" + dt.Rows[0]["updatedLast_name"] + "',Email='" + dt.Rows[0]["updatedemail"] + "',Mobile_number='" + dt.Rows[0]["updatedmobile"] + "',DOB='" + dt.Rows[0]["updatedDOB"] + "' WHERE Emp_ID= '" + dt.Rows[0]["Emp_ID"] + "' ";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlString, con);
                    cmd.ExecuteNonQuery();

                }
            }
        }
    }

}