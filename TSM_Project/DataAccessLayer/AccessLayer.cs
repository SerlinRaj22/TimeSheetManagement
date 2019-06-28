using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TSM_Project.DataAccessLayer
{

    public class AccessLayer
    {
        public string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


        public DataTable ExecuteSqlDataAdpter(string strSqlQuery)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open(); // Opeming connection  
                    SqlDataAdapter sda = new SqlDataAdapter(strSqlQuery, con);
                    sda.Fill(dt);
                    con.Close();
                }
                return dt;
            }
            catch (Exception ex)
            {
                return dt;
            }
        }
        public void GetRecordByReader(string strSqlQuery)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {

                    con.Open(); // Opeming connection  
                    using (SqlCommand command = new SqlCommand(strSqlQuery, con))
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}