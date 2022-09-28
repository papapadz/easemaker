<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="OTP.aspx.cs" Inherits="OTP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="login-wrapper">
        <div class="container">
            <div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
                <form id="Form1">
                    <div id="Div1" runat="server" class="alert alert-success" visible="false">
                        Your account has been verified. You can now login!
                    </div>

                    <div id="error" runat="server" class="alert alert-danger" visible="false">
                        Invalid Code!
                    </div>
                    <h2>One-Time Password</h2>
                    <div id="Div2" runat="server" class="alert alert-success" visible="true">
                        You will receive a One-Time Password (OTP) on your registered E-mail Address
                    </div>
                    <div id="Div3" runat="server" class="alert alert-danger" visible="false">
                        Customer is not validated. Please check email!
                    </div>
                    <div id="Div4" runat="server" class="alert alert-danger" visible="false">
                        Invalid username or password or Account not validated.
                    </div>
                    <asp:FilteredTextBoxExtender ID="txtCode_FilteredTextBoxExtender"
                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtCode">
                    </asp:FilteredTextBoxExtender>
                    <asp:TextBox ID="txtCode" runat="server" class="form-control input-lg" type="text" placeholder="" MaxLength="6" oncopy="return false" onpaste="return false" oncut="return false" />


                    <label><a href="ForgotPassword.aspx">Forget Password?</a></label>


                    <asp:Button ID="btnLogin" runat="server" class="btn"
                        Text="Submit" OnClick="btnLogin_Click" />
                    <p>New User?<a href="register.aspx">Create An Account</a></p>
                    <%-- <p>New Client? <a href="clientform.aspx">Client Form</a></p>--%>
                </form>
            </div>
        </div>
    </section>
</asp:Content>

