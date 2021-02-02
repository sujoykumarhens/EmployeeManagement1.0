using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Quarter : System.Web.UI.Page
    {
        readonly string Strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //This is to redirect the page if the user is not logged in
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Response.Redirect("Default.aspx");
            }
            QuarterInfo.DataBind();
        }
        //checking employee details
        protected void EmpID_TextChanged(object sender, EventArgs e)
        {
            if (EmpID.Text != "")
            {
                SqlConnection con = new SqlConnection(Strcon);
                EmpName.Text = "";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT emp_name from employee where emp_id='" + EmpID.Text.Trim() + "';", con);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    EmpName.Text = da["emp_name"].ToString();
                }
                if (EmpName.Text == "")
                {
                    ClearForm();
                    Response.Write("<script>alert('Sorry no employee ID found. Please try again.');</script>");
                }
                con.Close();
            }
        }
        //checking qharter id and name
        protected void QuarterID_TextChanged(object sender, EventArgs e)
        {
            if (QuarterID.Text != "")
            {
                SqlConnection conn = new SqlConnection(Strcon);
                QuarterName.Text = "";
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmdd = new SqlCommand("SELECT quarter_name from quarterlist where quarter_id='" + QuarterID.Text.Trim() + "';", conn);
                SqlDataReader daa = cmdd.ExecuteReader();
                while (daa.Read())
                {
                    QuarterName.Text = daa["quarter_name"].ToString();
                }
                if (EmpName.Text == "")
                {
                    ClearForm();
                    Response.Write("<script>alert('Please enter employee ID first.');</script>");
                }
                else if (QuarterName.Text == "")
                {
                    Response.Write("<script>alert('Please enter a valid quarter ID.');</script>");
                }
                conn.Close();
            }
        }

        protected void Submit2_Click(object sender, EventArgs e)
        {
            if (EmpID.Text == "" || QuarterID.Text == "")
            {
                Response.Write("<script>alert('Please enter all of the details.');</script>");
                ClearForm();
            }
            else if (CheckIfExists())
            {
                Response.Write("<script>alert('The employee is allocated to a quarter already or the quarter is already taken.');</script>");
                ClearForm();
            }
            else
            {
                AddNew();
                QuarterInfo.DataBind();
                ClearForm();
            }
        }

        //Checking whether it is exists or not
        bool CheckIfExists()
        {
            try
            {
                SqlConnection con3 = new SqlConnection(Strcon);
                if (con3.State == ConnectionState.Closed)
                {
                    con3.Open();
                }
                SqlCommand cmd3 = new SqlCommand("SELECT * from allocatedquarter where emp_id='" + EmpID.Text.Trim() + "' OR quarter_id='" + QuarterID.Text.Trim() + "';", con3);
                SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                if (dt3.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //Adding a new department
        void AddNew()
        {
            try
            {
                SqlConnection con4 = new SqlConnection(Strcon);
                if (con4.State == ConnectionState.Closed)
                {
                    con4.Open();
                }
                SqlCommand cmd4 = new SqlCommand("INSERT INTO allocatedquarter (quarter_id,emp_id) values(@quarter_id,@emp_id)", con4);
                cmd4.Parameters.AddWithValue("@emp_id", EmpID.Text.Trim());
                cmd4.Parameters.AddWithValue("@quarter_id", QuarterID.Text.Trim());
                cmd4.ExecuteNonQuery();
                Response.Write("<script>alert('" + EmpName.Text.Trim() + " is allocated to " + QuarterName.Text.Trim() + " successfully.');</script>");
                SqlCommand cmd5 = new SqlCommand("INSERT INTO rent (rent_id,rent_status,rent_amount,rent_paid_date,emp_id) values('NIL','Due',0,'',@emp_id)", con4);
                cmd5.Parameters.AddWithValue("@emp_id", EmpID.Text.Trim());
                cmd5.ExecuteNonQuery();
                con4.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //clear the form
        void ClearForm()
        {
            EmpID.Text = "";
            EmpName.Text = "";
            QuarterID.Text = "";
            QuarterName.Text = "";
        }
    }
}