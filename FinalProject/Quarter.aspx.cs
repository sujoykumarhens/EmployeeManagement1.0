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
                Response.Redirect("~/");
            }
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection(Strcon);
                connection.Open();
                SqlCommand Command = new SqlCommand("SELECT employee.emp_id from employee LEFT JOIN allocatedquarter ON allocatedquarter.emp_id=employee.emp_id WHERE allocatedquarter.emp_id IS NULL;", connection);
                SqlCommand Command2 = new SqlCommand("SELECT quarterlist.quarter_id from quarterlist LEFT JOIN allocatedquarter ON allocatedquarter.quarter_id=quarterlist.quarter_id WHERE allocatedquarter.quarter_id IS NULL;", connection);
                EmpID.DataSource = Command.ExecuteReader();
                QuarterID.DataSource = Command2.ExecuteReader();
                EmpID.DataBind();
                QuarterID.DataBind();
                QuarterID.Items.Insert(0, new ListItem("Select a quarter ID", ""));
                EmpID.Items.Insert(0, new ListItem("Select a employee ID", ""));
                QuarterInfo.DataBind();
                connection.Close();
            }
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
        protected void AddNew()
        {
            SqlConnection con4 = new SqlConnection(Strcon);
            con4.Open();
            SqlCommand cmd4 = new SqlCommand("INSERT INTO allocatedquarter (quarter_id,emp_id) values (@quarter_id,@emp_id);", con4);
            cmd4.Parameters.AddWithValue("@emp_id", EmpID.Text.Trim());
            cmd4.Parameters.AddWithValue("@quarter_id", QuarterID.Text.Trim());
            cmd4.ExecuteNonQuery();
            con4.Close();
            SqlConnection con5 = new SqlConnection(Strcon);
            con5.Open();
            SqlCommand cmd5 = new SqlCommand("INSERT INTO rent ([emp_id],[rent_id],[rent_amount],[rent_status],[rent_paid_date]) VALUES (@emp_ids,@emp_ids,0,'Due','1997-12-07');", con5);
            cmd5.Parameters.AddWithValue("@emp_ids", EmpID.Text.Trim());
            cmd5.ExecuteNonQuery();
            con5.Close();
            Response.Write("<script>alert('" + EmpName.Text.Trim() + " is allocated to " + QuarterName.Text.Trim() + " successfully.');</script>");
        }
        //clear the form
        void ClearForm()
        {
            EmpID.Text = "";
            EmpName.Text = "";
            QuarterID.Text = "";
            QuarterName.Text = "";
        }
        //Adding new quarter
        protected void QuarterSave_Clicked(object sender,EventArgs e)
        {
            try
            {
                SqlConnection con5 = new SqlConnection(Strcon);
                if (con5.State == ConnectionState.Closed)
                {
                    con5.Open();
                }
                SqlCommand cmd5 = new SqlCommand("SELECT * from quarterlist where quarter_id='" + NewQuarterID.Text.Trim() + "' OR quarter_name='" + NewQuarterName.Text.Trim() + "';", con5);
                SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
                DataTable dt5 = new DataTable();
                da5.Fill(dt5);
                if (dt5.Rows.Count >= 1)
                {
                    Response.Write("<script>alert('Quarter exixts. Try another.');</script>");
                    NewQuarterID.Text = "";
                    NewQuarterName.Text = "";
                }
                else
                {
                    SqlCommand cmd6 = new SqlCommand("INSERT INTO quarterlist (quarter_id,quarter_name) values (@quarter_id,@quarter_name)", con5);
                    cmd6.Parameters.AddWithValue("@quarter_id", NewQuarterID.Text.Trim());
                    cmd6.Parameters.AddWithValue("@quarter_name", NewQuarterName.Text.Trim());
                    cmd6.ExecuteNonQuery();
                    NewQuarterID.Text = "";
                    NewQuarterName.Text = "";
                    Response.Write("<script>alert('" + NewQuarterName.Text.Trim() + " Successfully registered.');window.location='Quarter.aspx';</script>");
                }
                con5.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}