<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="login-wrapper">
			<div class="container">
				<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
					<form id="Form1" >
						 <div id="Div2" runat="server" class="alert alert-danger" visible="false">
                        User is not validated. Please check email!
                    </div>
                     <div id="error" runat="server" class="alert alert-success" visible="false">
                        We have sent an email for you!
                    </div>
                 
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg" placeholder="Password here..."
                            MaxLength="20" TextMode="Password" oncopy="return false" onpaste="return false" oncut="return false" />
					 <asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg" placeholder="Confirm Password here..."
                                TextMode="Password" />
						<!-- <label><a href="ForgotPassword.aspx">Forget Password?</a></label> -->
						    <%--<asp:TextBox ID="TextBox1" runat="server" class="input"
                                TextMode="Password" />--%>
                        
                            <asp:Button ID="btnLogin" runat="server" class="btn"
                                Text="Submit" OnClick="btnLogin_Click" />
						<p>New Applicant? <a href="register.aspx">Create An Account</a></p>
					</form>
				</div>
			</div>
		</section>
</asp:Content>
