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
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbusername.Text = Session["User_Name"] as string;
            lbempid.Text = Session["Emp_ID"] as string;
            lbemail.Text = Session["Email"] as string;
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                DataTable dt = new DataTable();
                string sqlString = "SELECT N.Menu_ID, M.Role_ID,Menu_Name,N.URL,E.Emp_ID FROM Main_MenuTable M JOIN Menu_Table N ON M.Menu_ID = N.Menu_ID JOIN Role_Table R ON R.Role_ID = M.Role_ID JOIN Employee_Master_Table E ON R.Role_ID = E.Role_ID AND E.User_Name ='"+lbusername.Text+"' ";
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlString, con);
                sda.Fill(dt);
                repeater.DataSource = dt;
                repeater.DataBind();
            }
            
            

        }

        protected string GetClassIcon(object data)
        {
         
            var iconRow = (System.Data.DataRowView)data;
            int choice = Convert.ToInt32(iconRow[0]);
            var ip="";
            switch(choice)
            {
                case 1:
                    ip = "icon_profile";
                    break;
                case 2:
                    ip= "fa fa-laptop";
                    break;
                case 3:
                    ip = "fa fa-file-text-o";
                    break;
                case 4:
                    ip = "fa fa-files-o";
                    break;
                case 5:
                    ip = "icon_piechart";
                    break;
                case 6:
                    ip = "fa fa-bars";
                    break;
                case 7:
                    ip = "icon_table";
                    break;
                case 8:
                    ip = "fa fa-paperclip";
                    break;
                case 9:
                    ip = "icon_key_alt";
                    break;

            }
            return ip;
            //if (Convert.ToInt32(iconRow[0]) == 1)
            //{
            //}
            //else
            //{
            //    return "";
            //}

            }



    }
}