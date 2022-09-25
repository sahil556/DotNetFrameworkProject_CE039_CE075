using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Employee_Hourly_Attendance
{
    public partial class EmployeeData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mysession = (string)Session["UserName"];
            Console.WriteLine(mysession);
            if (mysession == "Guest")
            {
                Response.Redirect("index.aspx", true);
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["employeeConnection"].ConnectionString;
            try
            {
                using(con)
                {
                    string command = "Select * from Employee";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                  //  GridViewEmp.DataSource = rdr;
                  // GridViewEmp.DataBind
                    rdr.Close();
                    
                }
            }
            catch(Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx", true);
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("index.aspx", true);
        }
    }
}