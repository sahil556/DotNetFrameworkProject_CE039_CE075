using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronBarCode;

namespace Employee_Hourly_Attendance
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblerror.Visible = false;
            string mysession = (string)Session["UserName"];
            if (mysession == null)
                Session["UserName"] = "Guest";
        }

        protected void login_click(object sender, EventArgs e)
        {
            panelLogin.Visible = true;
            panelAttendance.Visible = false;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["employeeConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string command = "Select * from Admin where Email='" + tbEmail.Text + "' AND Password='" + tbPassword.Text + "'";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.HasRows)
                    {
                        Session["UserName"] = tbEmail.Text;
                        Response.Redirect("SignUp.aspx");
                    }
                    else
                    {
                        lblerror.Text = "Invalid Credential !";
                        lblerror.Visible = true;
                        Response.Write("");
                    }

                    rdr.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btnAttendance_Click(object sender, EventArgs e)
        {
            panelAttendance.Visible = true;
            panelLogin.Visible = false;
        }

        protected void btnViewAttendence_Click(object sender, EventArgs e)
        {
            string name = this.FileUpload1.FileName;
            string path = Server.MapPath("/uploaded_barcode") + "\\" + name;

            if (System.IO.File.Exists(path))
            {

                System.IO.File.Delete(path);
            }
            FileUpload1.SaveAs(path);
            BarcodeResult barResults = BarcodeReader.QuicklyReadOneBarcode(path);

            string empid = barResults.Text;
            string username = null, message = "Something Went Wrong !";
            int hour = 0;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["employeeConnection"].ConnectionString;
            string query = "SELECT Name, Hours FROM employee WHERE Eid='" + empid + "';";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                        if (rdr.Read())
                        {
                            username = rdr["Name"].ToString();
                            hour = Convert.ToInt32(rdr["Hours"]);
                        }
                        con.Close();
                    }
                }
                if (username != null)
                {
                    message = "Your Attendence is: ! " + hour;

                }
            }
            catch (Exception ex)
            {
                Response.Write("error: " + ex.Message + " " + empid);
            }
            this.lblresult.Text = message;
            this.lblresult.Visible = true;
            Response.Write("");
        }


        protected void btnupload_Click(object sender, EventArgs e)
        {
            string name = this.FileUpload1.FileName;
            string path = Server.MapPath("/uploaded_barcode") + "\\" + name;

            if (System.IO.File.Exists(path))
            {

                System.IO.File.Delete(path);
            }
            FileUpload1.SaveAs(path);
            BarcodeResult barResults = BarcodeReader.QuicklyReadOneBarcode(path);

            if (barResults != null)
            {
                if (barResults != null)
                {
                    Console.WriteLine("GetStarted was a success.  Read Value: " + barResults.Text);
                }
            }
            string empid = barResults.Text;
            string intime = "", outtime = "";
            string username = null, message = "Something Went Wrong !";
            int tmp_hour = 0;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["employeeConnection"].ConnectionString;
            string query = "SELECT Name, Intime, Outtime , Hours FROM employee WHERE Eid='" + empid + "';";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                        if (rdr.Read())
                        {
                            username = rdr["Name"].ToString();
                            intime = rdr["Intime"].ToString();
                            outtime = rdr["Outtime"].ToString();
                            tmp_hour = Convert.ToInt32(rdr["Hours"]);
                        }
                        con.Close();
                    }
                }
                if (username != null)
                {
                    con = new SqlConnection();
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["employeeConnection"].ConnectionString;
                    string time = DateTime.Now.ToString("h:mm:ss tt");
                    if (intime.Equals("00:00:00"))
                    {
                        query = "UPDATE employee SET intime='" + time + "' WHERE Eid='" + empid + "';";
                        message = "Welcome ! " + username;

                    }
                    else
                    {
                        DateTime time1 = Convert.ToDateTime(intime);
                        DateTime time2 = Convert.ToDateTime(time);
                        outtime = "00:00:00";
                        intime = outtime;
                        int hour;

                        hour = (int)(time2 - time1).TotalSeconds;
                        // change it to hour

                        hour = hour + tmp_hour;

                        query = "UPDATE employee SET Outtime='" + outtime + "', Hours='" + hour + "', intime='" + intime + "' WHERE Eid='" + empid + "';";
                        message = "Bye Bye ! " + username + " Have a Nice Day ! ";
                    }
                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            con.Open();
                            int row = cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("error: " + ex.Message);
            }
            this.lblresult.Text = message;
            this.lblresult.Visible = true;
            Response.Write("");
        }
    }
}