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
        ConnectionString con = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
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
            if (EmpID.Text != "")
            {
                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT emp_name from employee where emp_id=@emp_id", con);
                cmd.Parameters.AddWithValue("@emp_id", EmpID.Text);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    EmpName.Text = (string)da.GetValue(1);
                }
                con.Close();
            }
            /* SqlCommand cmdo = new SqlCommand("SELECT vaccency FROM vaccency where dept_id='" + DeptID.Text.Trim() + "';", con);
                int temp = 0;
                SqlDataReader readerw = cmdo.ExecuteReader();
                while (readerw.Read())
                {
                    temp = Convert.ToInt32(readerw["vaccency"]);
                }*/
        }
        protected void QuarterID_TextChanged(object sender, EventArgs e)
        {

        }
    }
}