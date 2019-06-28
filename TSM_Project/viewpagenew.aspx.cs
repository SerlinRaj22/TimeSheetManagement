using System;
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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbusername.Text = Session["User_Name"] as string;
            lbroleid.Text = Session["Role_ID"] as string;
            populateEmpview();
            if (lbroleid.Text == "5")
            {
                viewbtn.Visible = true;
            }

        }
        void ViewAllEmployee()
        {
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {

                string sqlString = "SELECT TimeSheet_ID,UserName,Date,Start_Time,End_Time,Project_Name,Role_ID FROM Time_sheet T JOIN Project_Master_table P on T.Project_ID = P.Project_ID ORDER BY UserName ASC";
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
        void populateEmpview()
        {

            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT TimeSheet_ID,UserName,Date,Start_Time,End_Time,Project_Name FROM Time_sheet T JOIN Project_Master_table P on T.Project_ID = P.Project_ID AND T.UserName='" + lbusername.Text + "'";
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

        protected void viewbtn_Click(object sender, EventArgs e)
        {
            ViewAllEmployee();
        }
    }
}