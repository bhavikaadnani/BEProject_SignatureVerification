<%@ Page Title="" Language="C#" MasterPageFile="~/Banker.master" AutoEventWireup="true" CodeFile="Signatureauth.aspx.cs" Inherits="Signatureauth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contentArea">
        <div class="divPanel notop page-content">
            <div class="row-fluid">
            <!--Edit Main Content Area here-->
            <div class="span12" id="divMain">
            <center>
            <h2>Login Form</h2>
            <table>
            <tr>
              <td>Account Number  :</td><td><asp:TextBox ID="txtaccountnumber" Width="300" runat="server"></asp:TextBox></td>
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
                <tr>
                   <td><asp:Label ID="lblMessage" runat="server" Visible="False" Text="Label" Font-Bold="True"></asp:Label></td>
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

