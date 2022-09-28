<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="login-wrapper">
			<div class="container">
				<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
					<form id="Form1" >
						 <div id="Div1" runat="server" class="alert alert-success" visible="false">
                            An Email was sent to you!
                        </div>

                        <div id="error" runat="server" class="alert alert-danger" visible="false">
                            Invalid Email or password or Account was not verified.
                        </div>
                        <h2>Forgot Password?</h2>
					  <div id="Div2" runat="server" class="alert alert-success" visible="false">
                       Your account has been verified. You can now login!
                    </div>
                    <div id="Div3" runat="server" class="alert alert-danger" visible="false">
                        Customer is not validated. Please check email!
                    </div>
                    <div id="Div4" runat="server" class="alert alert-danger" visible="false">
                        Invalid username or password or Account not validated.
                    </div>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ValidationGroup="save"
                            ErrorMessage="Invalid Email Format"
                            ForeColor="red"></asp:RegularExpressionValidator>
                 
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control input-lg" type="text" placeholder="Email Address here..." MaxLength="254" oncopy="return false" onpaste="return false" oncut="return false" />
					    
                            <asp:Button ID="btnLogin" runat="server" class="btn"
                                Text="Submit" OnClick="btnLogin_Click" />
						<p>New Applicant? <a href="register.aspx">Create An Account</a></p>
					</form>
				</div>
			</div>
		</section>
</asp:Content>
