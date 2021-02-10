using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FinalProject
{
    public partial class Rent : System.Web.UI.Page
    {
        readonly string Strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e) {
            //This is to redirect the page if the user is not logged in
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Response.Redirect("~/");
            }
            if (!IsPostBack){
                SqlConnection connection = new SqlConnection(Strcon);
                connection.Open();
                SqlCommand Command = new SqlCommand("SELECT allocatedquarter.emp_id from allocatedquarter INNER JOIN rent ON allocatedquarter.emp_id=rent.emp_id WHERE rent.rent_status='Due'", connection);
                EmpID.DataSource = Command.ExecuteReader();
                EmpID.DataBind();
                EmpID.Items.Insert(0, new ListItem("Select a employee ID", ""));
                RentGrid.DataBind();
                connection.Close();
            }
        }
        //checking employee details
        protected void EmpIDS_TextChanged(object sender, EventArgs e)
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
            else if (EmpID.Text == "")
            {
                Response.Write("<script>alert('Please select one of the employee ID');</script>");
            }
        }
        //Saving the data
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (EmpName.Text == "" || RentAmount.Text == "" || Month.Text == "")
                {
                    Response.Write("<script>alert('Please enter all of the details.');</script>");
                    ClearForm();
                }
                else
                {
                    SqlConnection con1 = new SqlConnection(Strcon);
                    if (con1.State == ConnectionState.Closed)
                    {
                        con1.Open();
                    }
                    SqlCommand cmd1 = new SqlCommand("SELECT emp_id from rent where emp_id='" + EmpID.Text.Trim() + "';", con1);
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    if (dt1.Rows.Count >= 1)
                    {
                        //Response.Write("<script>alert('Employee ID exists in the list.');</script>");
                        SqlCommand cmd2 = new SqlCommand("SELECT rent_status from rent where emp_id='" + EmpID.Text.Trim() + "';", con1);
                        SqlDataReader da2 = cmd2.ExecuteReader();
                        while (da2.Read())
                        {
                            string rent_status=da2["rent_status"].ToString().Trim();
                            if (rent_status == "Due"|| rent_status == "due")
                            {
                                //checking date is in range or not
                                DateTime Mydate = Convert.ToDateTime(Month.Text.Trim());
                                if (CheckDateRange(Mydate))
                                {
                                    //Response.Write("<script>alert('Payment is due...! Pay now.');</script>");
                                    Dataentry();
                                    Response.Write("<script>alert('Payment complete ! Thank You !');window.location='Rent.aspx';</script>");
                                }
                                else
                                {
                                    Response.Write("<script>alert('Invalid date. Date should be within 6 months.');</script>");
                                    ClearForm();
                                }
                            }
                            else if(rent_status == "Paid" || rent_status == "paid")
                            {
                                Response.Write("<script>alert('Amount paid already.');</script>");
                                ClearForm();
                            }
                            else
                            {
                                Response.Write("<script>alert('Sorry there are some technical issues.');</script>");
                                ClearForm();
                            }
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Employee is not listed here. Sorry you can't pay.');</script>");
                        ClearForm();
                    }
                    ClearForm();
                    con1.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                ClearForm();
            }
        }
        //Payment process is finally done here
        protected void Dataentry()
        {
            SqlConnection con2 = new SqlConnection(Strcon);
            con2.Open();
            SqlCommand cmd2 = new SqlCommand("Update rent set rent_amount = @rent_amount, rent_status='Paid', rent_paid_date=@rent_paid_date where emp_id = @emp_id ; ", con2);
            cmd2.Parameters.AddWithValue("@emp_id", EmpID.Text.Trim());
            cmd2.Parameters.AddWithValue("@rent_amount", RentAmount.Text.Trim());
            cmd2.Parameters.AddWithValue("@rent_paid_date", Month.Text.Trim());
            cmd2.ExecuteNonQuery();
            RentGrid.DataBind();
            con2.Close();
            ClearForm();
        }
        //printing into spreadsheets
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=EmployeesRent.xls");
            Response.ContentType = "application/excel";
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
            RentGrid.HeaderRow.Style.Add("background-color", "#FFFFFF");
            foreach (TableCell tableCell in RentGrid.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#A55129";
            }
            foreach (GridViewRow gridViewRow in RentGrid.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }
            RentGrid.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }
        //clear the form
        void ClearForm()
        {
            EmpID.Text = "";
            EmpName.Text = "";
            Month.Text = "";
        }
        //checking the date range
        protected static bool CheckDateRange(DateTime Mydate)
        {
            DateTime datePast = DateTime.Now.AddMonths(-6);
            DateTime dateFuture = DateTime.Now.AddMonths(0);
            if (datePast <= Mydate && Mydate <= dateFuture)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}