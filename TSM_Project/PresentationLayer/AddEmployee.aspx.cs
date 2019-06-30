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
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateEmpview();
            }
        }
        public void populateEmpview()
        {
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT Emp_ID,First_Name,Last_Name,Email,Mobile_number,DOB FROM Employee_Master_Table";
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(sqlString, con);

                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                EmpView.DataSource = dt;
                EmpView.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                EmpView.DataSource = dt;
                EmpView.DataBind();
                EmpView.Rows[0].Cells.Clear();
                EmpView.Rows[0].Cells.Add(new TableCell());
                EmpView.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                EmpView.Rows[0].Cells[0].Text = "No Data Found";
                EmpView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void EmpView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Add"))
                {
                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {

                        string fisrtname = (EmpView.FooterRow.FindControl("Txtfisrtnamefooter") as TextBox).Text.ToString();
                        string lastname = (EmpView.FooterRow.FindControl("Txtlastnamefooter") as TextBox).Text.Trim();
                        string email = (EmpView.FooterRow.FindControl("Txtemailfooter") as TextBox).Text.Trim();
                        string Mobile = (EmpView.FooterRow.FindControl("Txtmobilefooter") as TextBox).Text.Trim();
                        string DOB = (EmpView.FooterRow.FindControl("TxtDOBfooter") as TextBox).Text.Trim();
                        string ErrMsg = "";
                        if (string.IsNullOrEmpty(fisrtname) || string.IsNullOrEmpty(lastname) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(Mobile) || string.IsNullOrEmpty(DOB))
                        {
                            ErrMsg = ErrMsg + "Please fill all blank fields </br>";
                        }

                        if (string.IsNullOrEmpty(ErrMsg))
                        {
                            string sqlString = "INSERT INTO Employee_Master_Table(First_Name,Last_Name,Email,Mobile_number,DOB) VALUES(@First_Name,@Last_Name,@Email,@Mobile_number,@DOB) ";
                            con.Open();
                            SqlCommand cmd = new SqlCommand(sqlString, con);
                            cmd.Parameters.AddWithValue("@First_Name", (EmpView.FooterRow.FindControl("Txtfisrtnamefooter") as TextBox).Text.Trim());
                            cmd.Parameters.AddWithValue("@Last_Name", (EmpView.FooterRow.FindControl("Txtlastnamefooter") as TextBox).Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", (EmpView.FooterRow.FindControl("Txtemailfooter") as TextBox).Text.Trim());
                            cmd.Parameters.AddWithValue("@Mobile_number", (EmpView.FooterRow.FindControl("Txtmobilefooter") as TextBox).Text.Trim());
                            cmd.Parameters.AddWithValue("@DOB", (EmpView.FooterRow.FindControl("TxtDOBfooter") as TextBox).Text.Trim());
                            cmd.ExecuteNonQuery();
                            populateEmpview();
                            lbsuccess.Text = "New Record Added";
                            lberror.Text = "";
                        }
                        else
                        {
                            lberror.Text = ErrMsg;
                        }



                    }
                }
            }
            catch (Exception ex)
            {
                lbsuccess.Text = "";
                lberror.Text = ex.Message;


            }
        }

        protected void EmpView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EmpView.EditIndex = e.NewEditIndex;
            populateEmpview();
        }

        protected void EmpView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EmpView.EditIndex = -1;
            populateEmpview();
        }


        protected void EmpView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string sqlString = "UPDATE Employee_Master_Table SET First_Name=@First_Name,Last_Name=@Last_Name,Email=@Email,Mobile_number=@Mobile_number,DOB=@DOB WHERE EMP_ID=@EMP_ID";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlString, con);
                    cmd.Parameters.AddWithValue("@First_Name", (EmpView.Rows[e.RowIndex].FindControl("Txtfisrtname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Last_Name", (EmpView.Rows[e.RowIndex].FindControl("Txtlastname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", (EmpView.Rows[e.RowIndex].FindControl("Txtemail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile_number", (EmpView.Rows[e.RowIndex].FindControl("Txtmobile") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@DOB", (EmpView.Rows[e.RowIndex].FindControl("TxtDOB") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@EMP_ID", Convert.ToInt32(EmpView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    EmpView.EditIndex = -1;
                    populateEmpview();
                    lbsuccess.Text = "Selected Record Updated";
                    lberror.Text = "";

                }

            }
            catch (Exception ex)
            {
                lbsuccess.Text = "";
                lberror.Text = ex.Message;


            }

        }

        protected void EmpView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string sqlString = "DELETE FROM Employee_Master_Table  WHERE EMP_ID=@EMP_ID";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlString, con);

                    cmd.Parameters.AddWithValue("@EMP_ID", Convert.ToInt32(EmpView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                    populateEmpview();
                    lbsuccess.Text = "Selected Record Deleted";
                    lberror.Text = "";

                }

            }
            catch (Exception ex)
            {
                lbsuccess.Text = "";
                lberror.Text = ex.Message;


            }

        }
    }
}

      // protected void EmpView_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
          //  populateEmpview();
           // string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(cs))
            //{
              //  con.Open();
                //var dropdown = (DropDownList)e.Row.FindControl("ddownlist");
                //string sqlString = "SELECT Role_name FROM Role_Table";
                //SqlCommand cmd = new SqlCommand(sqlString, con);
                //SqlDataAdapter sda = new SqlDataAdapter(cmd);

                //sda.Fill(dt);
                //con.Close();
                //dropdown.DataSource = dt;
                //dropdown.DataTextField = "Select Role";
                //dropdown.DataValueField = "Select Role";
                //dropdown.DataBind();


           // }
        //}
   // }

//}