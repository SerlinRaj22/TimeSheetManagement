using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using TSM_Project.DataAccessLayer;

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
                DataTable dt = new DataTable();
                string strSqpQuery = "SELECT E.First_Name  + '' + E.Last_Name As UserName, E.Role_ID, E.Emp_ID, R.Role_name,E.Email  FROM Employee_Master_Table E JOIN Role_Table R ON R.Role_ID = E.Role_ID WHERE Email='" + txtloginname.Text + "' AND Password='" + txtpassword.Text + "'";
                // string sqlroleid = ""; // "SELECT Role_ID, Emp_ID  FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "' AND Password='" + txtpassword.Text + "'";
                // string sqlempid = ""; //"SELECT Emp_ID  FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "' AND Password='" + txtpassword.Text + "'";
                AccessLayer ac = new AccessLayer();
                dt = ac.ExecuteSqlDataAdpter(strSqpQuery);
                //string sqlString = "SELECT COUNT (*) FROM Employee_Master_Table WHERE User_Name='" + txtloginname.Text + "'";
                //SqlCommand cmd = new SqlCommand(sqlString, con);
                //int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());              
                //SqlCommand rolecmd = new SqlCommand(sqlroleid, con);
                //SqlCommand empcmd = new SqlCommand(sqlempid, con);
                //string roleid = rolecmd.ExecuteScalar().ToString();
                //string empid = empcmd.ExecuteScalar().ToString();

                if (dt.Rows.Count != 0)
                {
                    Session["User_Name"] = (dt.Rows[0]["UserName"] != DBNull.Value) ? dt.Rows[0]["UserName"] : "";
                    Session["Role_ID"] = (dt.Rows[0]["Role_ID"] != DBNull.Value) ? dt.Rows[0]["Role_ID"] : "";
                    Session["Emp_ID"] = (dt.Rows[0]["Emp_ID"] != DBNull.Value) ? dt.Rows[0]["Emp_ID"] : "";
                    Session["Role_Name"] = (dt.Rows[0]["Role_name"] != DBNull.Value) ? dt.Rows[0]["Role_name"] : "";
                    Session["Email"]= (dt.Rows[0]["Email"] != DBNull.Value) ? dt.Rows[0]["Email"] : "";
                    Response.Redirect("~/PresentationLayer/DashBoard.aspx");
                   

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
                    lberror.Text = "Incorrect User name and Password";

                }
            }
        }



        void getEmail()
        {

        }
    }

}