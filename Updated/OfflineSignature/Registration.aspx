<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="contentArea">
        <div class="divPanel notop page-content">
            <div class="row-fluid">
            <!--Edit Main Content Area here-->
            <div class="span12" id="divMain">
            <center>
            <h2>Registration Form</h2>
            <table>

            <tr>
              <td> First Name :</td><td><asp:TextBox ID="txtFname" Width="300" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
              <td> Last Name :</td><td><asp:TextBox ID="txtLname" Width="300" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
               <td>Email Id :</td><td><asp:TextBox ID="txtEmailId" Width="300" runat="server"></asp:TextBox></td>
            </tr>


            <tr>
                <td>Address :</td><td><asp:TextBox ID="txtAddress" Width="300" runat="server"></asp:TextBox></td>
            </tr>


            <tr>
              <td>Account Number  :</td><td><asp:TextBox ID="txtaccountnumber" Width="300" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
              <td>Adhaar Number  :</td><td><asp:TextBox ID="txtAdhaar" Width="300" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
             <td>Profil Pic :</td><td><asp:FileUpload ID="FileUpload2" runat="server" /></td>
            </tr>

             <tr>
             <td>Signature :</td><td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr><td></td></tr>
            <tr>
             <td></td><td><br /><asp:Button ID="Button1" 
                    class="btn btn-navbar-highlight btn-small btn-primary" runat="server" 
                    Text="Submit" onclick="Button1_Click" /></td>
            </tr>
            </table>
            </center>

                </div>
            <!--End Main Content-->
            </div>
            <div id="footerInnerSeparator"></div>
        </div>
    </div>
</asp:Content>

