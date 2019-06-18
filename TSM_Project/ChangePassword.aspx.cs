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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtusername.Text = Session["User_Name"] as string;

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                if (txtnewpassword.Text == txtrepassword.Text)
                {
                 
                    string sqlString = "UPDATE Employee_Master_Table SET password=@password WHERE User_Name='"+txtusername.Text+"'";
                    SqlCommand cmd = new SqlCommand(sqlString, con);
                    cmd.Parameters.AddWithValue("@password", txtnewpassword.Text);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("LoginTMS.aspx");

                }
            }
        }
    }
}