using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Configuration;


namespace TSM_Project
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbusername.Text = Session["User_Name"] as string;
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT First_Name,Last_Name,Email,Mobile_number,DOB,City FROM Employee_Master_Table WHERE User_Name='"+lbusername.Text+"' ";
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlString, con);

                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                lbdatetime1.Text = DateTime.Now.ToString("dd,MM,yyyy");
                    lbdatetime2.Text = DateTime.Now.ToString("hh:mm");
                    proname1.Text = sdr["First_Name"].ToString();
                    proname2.Text = sdr["Last_Name"].ToString();
                    procity.Text = sdr["City"].ToString();
                    profirstlastname1.Text = sdr["First_Name"].ToString();
                    profirstlastname2.Text = sdr["Last_Name"].ToString();
                    twit.Text = sdr["Email"].ToString();
                    mob.Text = sdr["Mobile_number"].ToString(); lbheading.Text = sdr["First_Name"].ToString();
                    lbfirstname.Text = sdr["First_Name"].ToString();
                    lblastname.Text = sdr["Last_Name"].ToString();
                    lbbirthday.Text = sdr["DOB"].ToString();
                    lbcity.Text = sdr["City"].ToString();
                    lbmobile.Text = sdr["Mobile_number"].ToString();
                    lbemail.Text = sdr["Email"].ToString();
                
                this.DataBind();
            }


        }


        }
}