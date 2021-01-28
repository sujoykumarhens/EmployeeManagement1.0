using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (Session["role"].Equals(""))
                if (string.IsNullOrEmpty((string)Session["role"]))
                { 
                    LinkButton3.Visible = true; //login button
                    LinkButton1.Visible = false; //hello user button
                    LinkButton2.Visible = false; //logout button                    
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton3.Visible = false; //login button
                    LinkButton1.Visible = true; //hello user button
                    LinkButton1.Text = "Hello " + Session["fullname"].ToString();
                    LinkButton2.Visible = true; //logout button
                }
            }
            catch(Exception )
            {
                Response.Write("<script>alert('Sorry, some error occured!');</script>");
            }
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            LinkButton3.Visible = true; //login button
            LinkButton1.Visible = false; //hello user button
            LinkButton2.Visible = false; //logout button
            Response.Redirect("Default.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}