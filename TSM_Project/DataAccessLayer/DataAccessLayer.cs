using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TSM_Project.DataAccessLayer
{
    public class DataAccessLayer
    {
        public string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        public DataTable GetRecords (string strSqlQuery)
        {
            DataTable dt = new DataTable();
            try
            {
                return dt; 
            }
            catch(Exception ex)
            {
                return dt;
            }
        }

        public void GetRecordByReader (string strSqlQuery)
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