<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

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
              <td>UserName  :</td><td><asp:TextBox ID="txtUserName" Width="300" runat="server"></asp:TextBox></td>
            </tr>

             <tr>
              <td>PassWord :</td><td><asp:TextBox ID="txtPass" TextMode="Password" Width="300" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td></td></tr>
            <tr>
             <td></td><td><br /><asp:Button ID="Button1" 
                    class="btn btn-navbar-highlight btn-small btn-primary" runat="server" 
                    Text="Submit" onclick="Button1_Click" /> <asp:Button ID="Button2" 
                    class="btn btn-navbar-highlight btn-small btn-primary" runat="server" 
                    Text="Cancel" /></td>

             
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

