<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container" style="margin: 0 auto">
       <div class="row">
           <div class="col-md-6">
               <img style="width: 100%;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnydo7yAVSXjYb1cGcQDxxEZAPjswditlVZA&usqp=CAU"/>
           </div>
           <div class="col-md-6">
            <br />
               <form id="Form1" >
						 <div id="Div1" runat="server" class="alert alert-success" visible="false">
                            Your account has been verified. You can now login!
                        </div>

                        <div id="error" runat="server" class="alert alert-danger" visible="false">
                            Invalid Email or password or Account was not verified.
                        </div>
                        <h2 class="text-primary">Login</h2>
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
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg" placeholder="Password here..."
                            MaxLength="20" TextMode="Password" oncopy="return false" onpaste="return false" oncut="return false" />
					
						
						
                        
                            <asp:Button ID="btnLogin" runat="server" class="btn btn-primary w-100"
                                Text="Login" OnClick="btnLogin_Click" />
                   <label><a style="font-family:'Roboto', sans-serif;" href="ForgotPassword.aspx">Forgot Password?</a></label>
                   <hr />
						<p style="font-family:'Roboto', sans-serif;">No account yet? <a href="register.aspx">Create An Account</a></p>
                        	
					</form>
           </div>
       </div>
   </div>
</asp:Content>

