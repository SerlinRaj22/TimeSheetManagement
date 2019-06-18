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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT First_Name,Last_Name,Email,Mobile_number,DOB,City FROM Employee_Master_Table WHERE EMP_ID=1";
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlString, con);

                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lbdatetime1.Text = DateTime.Now.ToString("dd,MM,yyyy");
                    lbdatetime2.Text = DateTime.Now.ToString("hh:mm");
                    proname1.Text = sdr["First_Name"].ToString();
                    proname2.Text = sdr["Last_Name"].ToString();
                    procity.Text = sdr["City"].ToString();
                    profirstlastname1.Text = sdr["First_Name"].ToString();
                    profirstlastname2.Text = sdr["Last_Name"].ToString();
                    twit.Text = sdr["Email"].ToString();
                    mob.Text = sdr["Mobile_number"].ToString();
                 }
                this.DataBind();
            }


        }
    }
}