using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronBarCode;

namespace Employee_Hourly_Attendance
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblusernotexists.Visible = false;
            lblmsg.Visible = false;
            string mysession = (string)Session["UserName"];
            Console.WriteLine(mysession);
            if (mysession == "Guest")
            {
                Response.Redirect("index.aspx", true);
            }
        }
        protected void btnViewEmp_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeData.aspx", true);
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string mysession = (string)Session["UserName"];
            Console.WriteLine(mysession);
            if (mysession == "Guest")
            {
                Response.Redirect("index.aspx", true);
            }

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["employeeConnection"].ConnectionString;
            string query2 = "SELECT * FROM employee WHERE Eid='" + tbEid.Text + "';";
            string query = "INSERT INTO Employee (Eid, Name, Email, Hours, Barcode, Intime, Outtime) VALUES(@Eid, @Name, @Email, @Hours, @Barcode, @Intime, @Outtime);";
            bool should_generate_barcode = true;
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query2, con))
                    {
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                        if (rdr.HasRows)
                        {
                            lblusernotexists.Visible = true;
                            should_generate_barcode = false;
                        }
                        con.Close();
                    }
                    if (should_generate_barcode)
                    {
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@Eid", tbEid.Text);
                            cmd.Parameters.AddWithValue("@Name", tbName.Text);
                            cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                            cmd.Parameters.AddWithValue("@Hours", 0);
                            cmd.Parameters.AddWithValue("@Barcode", tbEid.Text);
                            cmd.Parameters.AddWithValue("@Intime", "00:00:00");
                            cmd.Parameters.AddWithValue("@Outtime", "00:00:00");


                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        var barcode = BarcodeWriter.CreateBarcode(tbEid.Text, BarcodeEncoding.Code128);
                        barcode.AddBarcodeValueTextBelowBarcode();
                        string path = "C:/Users/sahil/source/repos/Employee-Hourly-Attendance/Employee Hourly Attendance/barcodes/" + tbEid.Text + ".png";
                        barcode.SaveAsPng(path);
                        lblmsg.Text = "Barcode Generated Successfully !";
                        lblmsg.Visible = true;
                    }
                }
               


            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
           
            Response.Write("");

        }

        protected void btnsignout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Response.Redirect("index.aspx", true);
        }
    }
}