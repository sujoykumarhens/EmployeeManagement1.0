using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        readonly string Strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //This is to redirect the page if the user is not logged in
            //if (string.IsNullOrEmpty((string)Session["role"]))
            //{
              //  Response.Redirect("Default.aspx");
            //}
        }
        //add a new
        protected void Save_Click(object sender, EventArgs e)
        {
            if (CheckIfExists())
            {
                Response.Write("<script>alert('Department ID already Exist. You cannot add another same ID.');</script>");
            }
            else
            {
                AddNew();
            }
        }

        //Checking whether it is exists or not
        bool CheckIfExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(Strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from department where dept_id='" + DeptID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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
                SqlConnection con = new SqlConnection(Strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO department(dept_id,dept_name,phone,email) values(@dept_id,@dept_name,@phone,@email)", con);
                SqlCommand cmdd = new SqlCommand("INSERT INTO vaccency(dept_id,vaccency) values(@dept_id,@vaccency)", con);
                cmd.Parameters.AddWithValue("@dept_id", DeptID.Text.Trim());
                cmd.Parameters.AddWithValue("@dept_name", DeptName.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", Phone.Text.Trim());
                cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
                cmdd.Parameters.AddWithValue("@dept_id", DeptID.Text.Trim());
                cmdd.Parameters.AddWithValue("@vaccency", Vaccency.Text.Trim());

                cmd.ExecuteNonQuery();
                cmdd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Department added Successfully');</script>");
                ClearForm();
                DeptInfo.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //clear the form
        void ClearForm()
        {
            DeptID.Text = "";
            DeptName.Text = "";
            Phone.Text = "";
            Email.Text = "";
            Vaccency.Text = "";
        }

    }
}