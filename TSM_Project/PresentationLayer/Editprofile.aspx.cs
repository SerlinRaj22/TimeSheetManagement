﻿using System;
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
            lbusername.Text = Session["User_Name"] as string;
            lbroleid.Text = Session["Role_ID"] as string;
            lbempid.Text = Session["Emp_ID"] as string;
             populateLabel();
            if (lbroleid.Text == "5")
            {
                btnApprovepage.Visible = true;

            }

        }
        void populateLabel()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string sqlString = "SELECT First_Name,Last_Name,Email,Mobile_number,DOB,City FROM Employee_Master_Table WHERE User_Name='" + lbusername.Text + "'";
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
                mob.Text = sdr["Mobile_number"].ToString();

                this.DataBind();
            }
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string strFN = txtfirstname.Text;
                string strLN = txtlastname.Text;
                string strcity = txtCountry.Text;
                string strmobile = txtmobile.Text;
                string strmail = txtmail.Text;
                string strdob = txtbirthday.Text;
                string strusername = lbusername.Text;
                string errmsg = "";
                if (string.IsNullOrEmpty(strFN) || string.IsNullOrEmpty(strLN) || string.IsNullOrEmpty(strcity) || string.IsNullOrEmpty(strmail) || string.IsNullOrEmpty(strmobile) || string.IsNullOrEmpty(strdob)||string.IsNullOrEmpty(strusername))
                {
                    errmsg = "*Please fill all required fields";
                }
                if (string.IsNullOrEmpty(errmsg)) { 
                    string sqlString = "INSERT INTO ApproveTable(updatedFirst_name,updatedLast_name,updatedcity,updatedemail,updatedmobile,updatedDOB,UserName,Emp_ID) VALUES(@updatedFirst_name,@updatedLast_name,@updatedcity,@updatedemail,@updatedmobile,@updatedDOB,@UserName,@Emp_ID) ";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sqlString, con);
                    cmd.Parameters.AddWithValue("@Emp_ID", lbempid.Text);
                    cmd.Parameters.AddWithValue("@updatedFirst_name", txtfirstname.Text);
                    cmd.Parameters.AddWithValue("@updatedLast_name", txtlastname.Text);
                    cmd.Parameters.AddWithValue("@updatedcity", txtCountry.Text);
                    cmd.Parameters.AddWithValue("@updatedemail", txtmail.Text);
                    cmd.Parameters.AddWithValue("@updatedmobile", txtmobile.Text);
                    cmd.Parameters.AddWithValue("@updatedDOB", txtbirthday.Text);
                    cmd.Parameters.AddWithValue("@UserName", lbusername.Text);
                    cmd.ExecuteNonQuery();
                     lbsuccess.Text = "Request Sent";
                }else {
                    lberror.Text = errmsg;
                }
            }
           
        }
        public string firstname
        {
            get
            {
                return txtfirstname.Text;
            }
        }
        public string lastname
        {
            get
            {
                return txtlastname.Text;
            }
        }
        public string email
        {
            get
            {
                return txtmail.Text;
            }
        }
        public string dateofbirth
        {
            get
            {
                return txtbirthday.Text;
            }
        }
        public string city
        {
            get
            {
                return txtCountry.Text;
            }
        }
        public string mobile
        {
            get
            {
                return txtmobile.Text;
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void btnApprovepage_Click(object sender, EventArgs e)
        {
            if (lbroleid.Text == "5")
            {
                string path = "~/ApprovalPage.aspx";
                Server.Transfer(path);
            }
        }
    }
}