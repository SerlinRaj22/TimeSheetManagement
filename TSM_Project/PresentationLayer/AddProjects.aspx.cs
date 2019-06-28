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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateProject();
            }
        }
        void populateProject()
        {
            DataTable dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT Project_ID,Project_Name,Project_Description FROM Project_Master_table";
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

                        con.Open();
                        string projectname = (EmpView.FooterRow.FindControl("Txtprojectnamefooter") as TextBox).Text.Trim();
                        string projectdescript = (EmpView.FooterRow.FindControl("Txtprojectdescriptfooter") as TextBox).Text.Trim();
                        string ErrMsg = "";
                        if (string.IsNullOrEmpty(projectname) || string.IsNullOrEmpty(projectdescript))
                        {
                            ErrMsg = ErrMsg + "Please fill all blank fields </br>";
                        }
                        //count of the existing project 
                        string sqlStringcount = "SELECT COUNT(Project_Name) FROM Project_Master_table WHERE Project_Name='"+projectname+"'";
                        SqlCommand cmdcount = new SqlCommand(sqlStringcount, con);
                        int TScount = Convert.ToInt32(cmdcount.ExecuteScalar().ToString());

                        if (string.IsNullOrEmpty(ErrMsg))
                        {
                            if ((TScount <= 0))
                            {

                                string sqlString = "INSERT INTO Project_Master_table(Project_Name,Project_Description) VALUES(@Project_Name,@Project_Description) ";
                                SqlCommand cmd = new SqlCommand(sqlString, con);

                                cmd.Parameters.AddWithValue("@Project_Name", (EmpView.FooterRow.FindControl("Txtprojectnamefooter") as TextBox).Text.Trim());
                                cmd.Parameters.AddWithValue("@Project_Description", (EmpView.FooterRow.FindControl("Txtprojectdescriptfooter") as TextBox).Text.Trim());
                                cmd.ExecuteNonQuery();

                                populateProject();
                                lbsuccess.Text = "New Record Added";
                                lberror.Text = "";
                            }
                            else
                            {
                                lbsuccess.Text = "";
                                lberror.Text = "Project name already exist";
                            }
                        }
                        con.Close();
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
            populateProject();
        }

        protected void EmpView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EmpView.EditIndex = -1;
            populateProject();
        }


        protected void EmpView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string projectname = (EmpView.Rows[e.RowIndex].FindControl("Txtprojectname") as TextBox).Text.Trim();
                    string projectdescript = (EmpView.Rows[e.RowIndex].FindControl("Txtprojectdescript") as TextBox).Text.Trim();
                    string ErrMsg = "";
                    if (string.IsNullOrEmpty(projectname) || string.IsNullOrEmpty(projectdescript))
                    {
                        ErrMsg = ErrMsg + "Please fill all blank fields </br>";
                    }
                    //count of the existing project 
                    string sqlStringcount = "SELECT COUNT(Project_Name) FROM Project_Master_table WHERE Project_Name='" + projectname + "'";
                    SqlCommand cmdcount = new SqlCommand(sqlStringcount, con);
                    int TScount = Convert.ToInt32(cmdcount.ExecuteScalar().ToString());

                    if (string.IsNullOrEmpty(ErrMsg))
                    {
                        if ((TScount <= 0))
                        {

                            string sqlString = "UPDATE Project_Master_table SET Project_Name=@Project_Name,Project_description=@Project_description WHERE Project_ID=@Project_ID";
                            SqlCommand cmd = new SqlCommand(sqlString, con);
                            cmd.Parameters.AddWithValue("@Project_Name", (EmpView.Rows[e.RowIndex].FindControl("Txtprojectname") as TextBox).Text.Trim());
                            cmd.Parameters.AddWithValue("@Project_description", (EmpView.Rows[e.RowIndex].FindControl("Txtprojectdescript") as TextBox).Text.Trim());
                            cmd.Parameters.AddWithValue("@Project_ID", Convert.ToInt32(EmpView.DataKeys[e.RowIndex].Value.ToString()));
                            cmd.ExecuteNonQuery();
                            EmpView.EditIndex = -1;
                            populateProject();
                            lbsuccess.Text = "Selected Record Updated";
                            lberror.Text = "";

                        }
                        else
                        {
                            lberror.Text = "Project name already exist";
                        }
                    }
                    lberror.Text = ErrMsg;
                    con.Close();
                        

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
                    string sqlString = "DELETE FROM Project_Master_table  WHERE Project_ID=@Project_ID";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlString, con);

                    cmd.Parameters.AddWithValue("@Project_ID", Convert.ToInt32(EmpView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                    populateProject();
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