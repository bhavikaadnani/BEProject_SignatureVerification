using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUserName.Text.Equals("admin") && txtPass.Text.Equals("admin"))
            {
                Response.Redirect("Registration.aspx");

            }
            else if (txtUserName.Text.Equals("banker") && txtPass.Text.Equals("banker"))
            {
                Response.Redirect("Signatureauth.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong UserName and PassWord  !.')", true);
                return;
            }

        }
        catch (Exception ex)
        {
           Response.Write(ex.Message);
        }
    }
}