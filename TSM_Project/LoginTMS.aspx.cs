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
    public partial class LoginTMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                Session["User_Name"] = txtloginname.Text;
                string sqlString = "SELECT COUNT (*) FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "'";
                SqlCommand cmd = new SqlCommand(sqlString, con);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();
                if (temp == 1)
                {
                    con.Open();
                    string sqlpassword = "SELECT Password FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "' ";
                    SqlCommand passcmd = new SqlCommand(sqlpassword, con);
                    string password = passcmd.ExecuteScalar().ToString().Replace(" ", "");
                    if (password == txtpassword.Text)
                    {
                        Session["new"] = txtloginname.Text;
                        Response.Redirect("~/DashBoard.aspx");
                    }
                    else
                    {
                        lberror.Text = "Incorrect Password";
                    }



                }
                else
                {
                    lberror.Text = "Incorrect Password";

                }

            }
        }

       
    }
}