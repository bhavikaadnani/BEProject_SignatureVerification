using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

public partial class Signatureauth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String result = "1";
            SqlConnection con = new SqlConnection(DB.getcon());
            con.Open();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            SqlDataReader dr;
            bool found=false;
            com.CommandText = "Select * from Register where accountno='" + txtaccountnumber.Text + "'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                found=true;

               
                //for (int i = 1; i < 30; i++)
                //{
                //    if (result.Equals("1"))
                //    {
                //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + i + "-Result" + result + "')", true);
                //    }
                //}
            }
            dr.Close();
           if(File.Exists(Server.MapPath("~/data.txt")))
           {
               File.Delete(Server.MapPath("~/data.txt"));
           }

            String fileName = FileUpload1.PostedFile.FileName.Substring(FileUpload1.PostedFile.FileName.LastIndexOf("\\") + 1);
            using (StreamWriter _testData = new StreamWriter(Server.MapPath("~/data.txt"), true))
            {
                
                _testData.WriteLine(fileName,true); // Write the file.
                
            }    

            if(found)
            {
                MLApp.MLApp matlab = new MLApp.MLApp();
               matlab.Execute(@"cd D:\MatlabFile");
                object result1 = null;

               

                result1 = matlab.Execute("verify1");




                object res = result1 as object;
                string str = res.ToString();
                str = Regex.Match(str, @"\d+").Value;
                if (txtaccountnumber.Text.Equals(str))
                {
                   // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Signature Match!.')", true);
                    lblMessage.Visible = true;
                    lblMessage.Text = "Signature  Match";
                }


                
            }
            if (!found)
            {
               // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record No found!.')", true);
                lblMessage.Visible = true;
                lblMessage.Text = "Signature Not Match";
            }
                
            
            
            //txtResult.Text = res.ToString();
           
            
        }
        catch (Exception ex)
        {
            Response.Redirect(ex.Message);
        }
    }
}