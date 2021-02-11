using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
    {
        public partial class Employee : System.Web.UI.Page
        {
            readonly string Strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            protected void Page_Load(object sender, EventArgs e)
            {
            //This is to redirect the page if the user is not logged in
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
              Response.Redirect("~/");
            }
            VaccencyList.DataBind();
            EmployeeInfo.DataBind();
            }
        protected void VaccencyList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "apply")
            {
                int crow = Convert.ToInt32(e.CommandArgument.ToString());
                int v = Convert.ToInt32(VaccencyList.Rows[crow].Cells[2].Text);
                string Deptid = VaccencyList.Rows[crow].Cells[0].Text;
                if (v == 0)
                {
                    Response.Write("<script>alert('Sorry no vaccency now !');</script>");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Confirm();", true);
                    DeptID.Text = Deptid;
                }
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            if (EmpID.Text == "" || EmpName.Text == "" || Designation.Text == "" )
            {
                Response.Write("<script>alert('Plese fill all the fields');</script>");
                ClearForm();
            }
            else
            {
                if (CheckIfExists())
                {
                    Response.Write("<script>alert('Employee ID already Exist. You cannot add another same ID.');</script>");
                }
                else
                {
                    AddNew();
                }
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            ClearForm();
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

                SqlCommand cmd = new SqlCommand("SELECT * from employee where emp_id='" + EmpID.Text.Trim() + "';", con);
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
                SqlCommand cmd = new SqlCommand("INSERT INTO employee(emp_id,emp_name,emp_designation,dept_id) values (@emp_id,@emp_name,@emp_designation,@dept_id)", con);
                cmd.Parameters.AddWithValue("@emp_id", EmpID.Text.Trim());
                cmd.Parameters.AddWithValue("@emp_name", EmpName.Text.Trim());
                cmd.Parameters.AddWithValue("@emp_designation", Designation.Text.Trim());
                cmd.Parameters.AddWithValue("@dept_id", DeptID.Text.Trim());
                cmd.ExecuteNonQuery();
          
                SqlCommand cmdo = new SqlCommand("SELECT vaccency FROM vaccency where dept_id='" + DeptID.Text.Trim() + "';", con);
                int temp = 0;
                SqlDataReader readerw = cmdo.ExecuteReader();
                while (readerw.Read())
                {
                    temp = Convert.ToInt32(readerw["vaccency"]);
                }
                temp=temp-1;
                SqlCommand cmdu = new SqlCommand("Update vaccency set vaccency='"+temp+"' where dept_id='" + DeptID.Text.Trim() + "';", con);
                cmdu.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert ('Employee added Successfully');</script>");
                EmployeeInfo.DataBind();
                VaccencyList.DataBind();
                ClearForm();
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
            EmpID.Text = "";
            Designation.Text = "";
            EmpName.Text = "";
        }
    }    
}



