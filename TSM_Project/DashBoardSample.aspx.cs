using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TSM_Project
{
    public partial class DashBoardSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BarchartDataBind();
            piechartDataBind();
        }
        void BarchartDataBind()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string Sqlquery = "";
                SqlCommand cmd = new SqlCommand(Sqlquery, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                Chart1.DataSource = sdr;
                Chart1.DataBind();

            }
        }
        void piechartDataBind()
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string Sqlquery = "";
                SqlCommand cmd = new SqlCommand(Sqlquery, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                Chart2.DataSource = sdr;
                Chart2.DataBind();

            }
        }
    }
}