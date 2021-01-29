﻿using System;
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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //This is to redirect the page if the user is logged in
            if (!string.IsNullOrEmpty((string)Session["role"]))
            {
                Response.Redirect("Dashboard.aspx");
            }            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
               
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT *  FROM admin where username = '" +username.Text.Trim()+ "' AND password='" +password.Text.Trim()+ "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["fullname"]=dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                    }
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid user');</script>");
                }
            }
            catch (Exception )
            {
                Response.Write("<script>alert('Sorry, some error occured!');</script>");
            }
        }
    }
}