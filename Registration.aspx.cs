using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        String fileName = FileUpload1.PostedFile.FileName.Substring(FileUpload1.PostedFile.FileName.LastIndexOf("\\") + 1);
        string strFileType = FileUpload1.PostedFile.ContentType;
        int FileSize = FileUpload1.PostedFile.ContentLength;
        FileUpload1.PostedFile.SaveAs(Server.MapPath("Upload\\" + fileName));

        String fileName1 = FileUpload2.PostedFile.FileName.Substring(FileUpload2.PostedFile.FileName.LastIndexOf("\\") + 1);
        string strFileType1 = FileUpload2.PostedFile.ContentType;
        int FileSize1 = FileUpload2.PostedFile.ContentLength;
        FileUpload2.PostedFile.SaveAs(Server.MapPath("Upload\\" + fileName1));
        try
        {
            SqlConnection con= new SqlConnection(DB.getcon());
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            com.CommandText = "Select * from Register where accountno='" + txtaccountnumber.Text + "' and Adhaarcard='" + txtAddress.Text + "'";
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Already Exists!.')", true);
                return;
            }
            dr.Close();
            com.CommandText = "Insert into  Register(Fname,Lname,EmailId,Address,accountno,Adhaarcard,Profile,Signature) values('" + txtFname.Text + "','" + txtLname.Text + "','" + txtEmailId.Text + "','" + txtAddress.Text + "','" + txtaccountnumber.Text + "','" + txtAdhaar.Text + "','" + fileName + "','" + fileName1 + "')";
            com.ExecuteNonQuery();
            con.Close();
            empty();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Uploaded!.')", true); ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Already Exists!.')", true);


        }
        catch (Exception ex)
        {
            Response.Redirect(ex.Message);
        }   

    }
    void empty()
    {
        txtAdhaar.Text = "";
        txtAddress.Text = "";
        txtaccountnumber.Text = "";
        txtEmailId.Text = "";
        txtFname.Text = "";
        txtLname.Text = "";
        
    }
}