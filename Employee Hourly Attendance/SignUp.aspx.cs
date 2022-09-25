using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
            string query = "INSERT INTO Employee (Eid, Name, Email, Hours, Barcode, Intime, Outtime) VALUES(@Eid, @Name, @Email, @Hours, @Barcode, @Intime, @Outtime);";
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {

                        cmd.Parameters.AddWithValue("@Eid", tbEid.Text);
                        cmd.Parameters.AddWithValue("@Name", tbName.Text);
                        cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                        cmd.Parameters.AddWithValue("@Hours", 0);
                        cmd.Parameters.AddWithValue("@Barcode", tbEid.Text);
                        cmd.Parameters.AddWithValue("@Intime", "00:00:00");
                        cmd.Parameters.AddWithValue("@Outtime", "00:00:00");

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                var barcode = BarcodeWriter.CreateBarcode(tbEid.Text, BarcodeEncoding.Code128);
                barcode.AddBarcodeValueTextBelowBarcode();
                string path = "C:/Users/sahil/source/repos/Employee Hourly Attendance/Employee Hourly Attendance/barcodes/" + tbEid.Text + ".png";
                barcode.SaveAsPng(path);
                

            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            lblmsg.Text = "Barcode Generated Successfully !";
            lblmsg.Visible = true;
            Response.Write("");

        }

        protected void btnsignout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Response.Redirect("index.aspx", true);
        }
    }
}