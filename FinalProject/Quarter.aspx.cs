using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Quarter : System.Web.UI.Page
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //This is to redirect the page if the user is not logged in
            /*if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Response.Redirect("Default.aspx");
            }*/
        }
        protected void EmpID_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT emp_name from employee where emp_id=@emp_id", con);
            cmd.Parameters.AddWithValue("@emp_id", string.Format(EmpID.Text));
            SqlDataReader da = cmd.ExecuteReader();
            while (da.Read())
            {
                EmpName.Text = da.GetValue(1).ToString();
            }
            con.Close();
        }
        protected void QuarterID_TextChanged(object sender, EventArgs e)
        {

        }
    }
}