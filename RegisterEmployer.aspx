<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="RegisterEmployer.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
           <div class="row">
               <div class="col-md-6">
                   <img style="width: 100%" src="https://images.unsplash.com/photo-1587614297696-d150ef162d88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lybCUyMGxhcHRvcHxlbnwwfHwwfHw%3D&w=1000&q=80"/>
               </div>
               <div class="col-md-4">
                   <br />
                   <form id="Form1">
                    <div id="Div1" runat="server" class="alert alert-success" visible="false">
                        Your account has been verified. You can now login!
                    </div>

                    <div id="error" runat="server" class="alert alert-danger" visible="false">
                        Invalid Email or password or Account was not verified.
                    </div>
                    <h2>Employer Registration Page</h2>
                    <div id="Div2" runat="server" class="alert alert-success" visible="false">
                        Your account has been verified. You can now login!
                    </div>
                    <div id="Div3" runat="server" class="alert alert-danger" visible="false">
                        User is not validated. Please check email!
                    </div>
                    <div id="Div4" runat="server" class="alert alert-danger" visible="false">
                        Invalid Email or password or Account not validated.
                    </div>
                    <%--  <div class="form-group">
                        <label>Email/UserName </label>

                        <asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg" />

                    </div>--%>

                    <div id="Div5" runat="server" class="alert alert-danger" visible="false">
                        Existing Email!
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ValidationGroup="save"
                            ErrorMessage="Invalid Email Format"
                            ForeColor="red"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control input-lg" required />
                    </div>
                    <div class="form-group">
                        <label>Employer Company </label>
                        <asp:TextBox ID="txtFN" runat="server" class="form-control input-lg" required />
                              <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtFN">
                        </asp:FilteredTextBoxExtender>
                    </div>
                     <div class="form-group">
                        <label>Contact Person </label>
                        <asp:TextBox ID="txtContactPerson" runat="server" class="form-control input-lg" required />
                               <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtContactPerson">
                        </asp:FilteredTextBoxExtender>
                    </div>
                    <div class="form-group">
                        <label>Complete Address </label>
                        <asp:TextBox ID="txtAddress" runat="server" class="form-control input-lg" required />
                          <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtAddress">
                            </asp:FilteredTextBoxExtender>
                    </div>
                    <div class="form-group">
                        <label>Contact # </label>
                        <asp:TextBox ID="txtCN" runat="server" class="form-control input-lg" required />
                             <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" 
                            Enabled="True" FilterMode="InvalidChars" 
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>;[a-z],[A-Z]"
                            TargetControlID="txtCN">
                        </asp:FilteredTextBoxExtender>
                    </div>
                  
                    <div class="form-group">
                        <label>Password</label>

                        <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg"
                            TextMode="Password" required />

                    </div>
                      <div class="form-group">
                        <label>Confirm Password</label>

                        <asp:TextBox ID="txtPassword_confirm" runat="server" class="form-control input-lg" TextMode="Password" required></asp:TextBox>


                    </div>
                    <div class="form-group">
                        <label>Logo</label>
                        <div class="input-group">
                            <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                          <%--    <asp:Image ID="imgApplicant" runat="server" />--%>
                                  <asp:FileUpload ID="fuImage" runat="server" class="form-control" accept="image/png, image/gif, image/jpeg"/>

                        </div>
                    </div>
                    <div class="form-group">
                        <label>Business Permit</label>
                        <div class="input-group">
                            <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                          <%--    <asp:Image ID="imgApplicant" runat="server" />--%>
                                  <asp:FileUpload ID="fuImage2" runat="server" class="form-control" accept="image/png, image/gif, image/jpeg"/>

                        </div>
                    </div>
                  


                    <asp:Button ID="btnLogin" runat="server" class="btn btn-primary"
                        Text="Register" OnClick="btnLogin_Click" />

                </form>
               </div>
           </div>
       </div>
</asp:Content>

