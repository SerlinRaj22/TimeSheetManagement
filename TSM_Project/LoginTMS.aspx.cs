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
               
                //string sqlString = "SELECT COUNT (*) FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "'";
                //SqlCommand cmd = new SqlCommand(sqlString, con);
                //int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                string sqlroleid = "SELECT Role_ID FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "' AND Password='" + txtpassword.Text + "'";
                string sqlempid = "SELECT Emp_ID FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "' AND Password='" + txtpassword.Text + "'";
                SqlCommand rolecmd = new SqlCommand(sqlroleid, con);
                SqlCommand empcmd = new SqlCommand(sqlempid, con);
                string roleid = rolecmd.ExecuteScalar().ToString();
                string empid = empcmd.ExecuteScalar().ToString();
                if (!String.IsNullOrEmpty(roleid))
                {
                    Session["User_Name"] = txtloginname.Text;
                    Session["Role_ID"] = roleid;
                    Session["Emp_ID"] = empid;
                    
                    Response.Redirect("~/DashBoard.aspx");
                    //  con.Open();
                    //string sqlpassword = "SELECT Password FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "' ";
                    //SqlCommand passcmd = new SqlCommand(sqlpassword, con);
                    //string password = passcmd.ExecuteScalar().ToString().Replace(" ", "");
                    //if (password == txtpassword.Text)
                    //{
                    //    Session["new"] = txtloginname.Text;

                    //}
                    //else
                    //{
                    //    lberror.Text = "Incorrect Password";
                    //}
                }
                else
                {
                    lberror.Text = "Incorrect Password";

                }
                
               

            }
        }



        void getEmail()
        {

        }
    }

}