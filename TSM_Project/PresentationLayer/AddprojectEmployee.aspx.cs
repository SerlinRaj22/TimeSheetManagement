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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateemp();

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
        void populateemp()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT Emp_ID,First_Name FROM Employee_Master_Table";
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlString, con);
                ddlempid.DataSource = cmd.ExecuteReader();
                ddlempid.DataTextField = "First_Name";
                ddlempid.DataValueField = "Emp_ID";
                ddlempid.DataBind();
                ddlempid.Items.Insert(0, new ListItem("Select Employee", "0"));
                con.Close();


            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string empddl = ddlempid.Text;
                string dd = ddlproject.Text;
                string ErrMsg = "";
                if (string.IsNullOrEmpty(dd)||string.IsNullOrEmpty(empddl))
                {
                    ErrMsg = ErrMsg + "Please fill all blank fields </br>";
                }

                if (string.IsNullOrEmpty(ErrMsg))

                {

                   
                    string sqlString = "INSERT INTO Assigned_project_table(Emp_ID,Project_ID) VALUES(@Emp_ID,@Project_ID) ";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlString, con);
                    cmd.Parameters.AddWithValue("@Emp_ID", ddlempid.Text);
                    cmd.Parameters.AddWithValue("@Project_ID", ddlproject.Text);
                    cmd.ExecuteNonQuery();
                   
                }
                else
                {
                    lberror.Text = ErrMsg;

                }

            }

        }
    }
}