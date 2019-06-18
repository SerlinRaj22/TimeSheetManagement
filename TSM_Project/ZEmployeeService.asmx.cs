using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

namespace TSM_Project
{
    /// <summary>
    /// Summary description for EmployeeService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class EmployeeService : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetEmployee()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            List<empLoad> emp = new List<empLoad>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    empLoad employee = new empLoad();
                    employee.Emp_ID = Convert.ToInt32(rdr["Emp_id"]);
                    employee.First_Name = rdr["First_Name"].ToString();
                    employee.Last_Name = rdr["Last_Name"].ToString();
                    employee.Gender = rdr["Gender"].ToString();
                    employee.DOB = rdr["DOB"].ToString();
                    employee.City = rdr["City"].ToString();
                    employee.Assigned_project_ID = Convert.ToInt32(rdr["Assigned_project_ID"]);
                    emp.Add(employee);
                }

            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(emp));
        }
    }
}
