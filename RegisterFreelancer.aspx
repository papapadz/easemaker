<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="RegisterFreelancer.aspx.cs" Inherits="RegisterFreelancer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin: 0 auto">
       <div class="row">
           <div class="col-md-6" >
               <img style="width: 100%"; height=auto; src="https://images.unsplash.com/photo-1587614297696-d150ef162d88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lybCUyMGxhcHRvcHxlbnwwfHwwfHw%3D&w=1000&q=80"/>
           </div>
           <div class="col-md-6">
               <form id="Form1">
                    <div id="Div1" runat="server" class="alert alert-success" visible="false">
                        Your account has been verified. You can now login!
                    </div>

                    <div id="error" runat="server" class="alert alert-danger" visible="false">
                        Invalid Email or password or Account was not verified.
                    </div>
                    <h2>Freelancer Registration Page</h2>
                    <div id="Div2" runat="server" class="alert alert-success" visible="false">
                        Your account has been verified. You can now login!
                    </div>
                    <div id="Div3" runat="server" class="alert alert-danger" visible="false">
                        User is not validated. Please check email!txtBD
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
                        <label>Email </label><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ValidationGroup="save"
                            ErrorMessage=" Invalid Email Format"
                            ForeColor="red"></asp:RegularExpressionValidator>
                        <asp:label id="errorEmail" class="text-danger" runat="server" ></asp:label>
                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control input-lg" required />

                    </div>
                    <div class="form-group">
                        <label>Full Name </label>
                        <asp:TextBox ID="txtFN" runat="server" class="form-control input-lg" required />
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtFN">
                        </asp:FilteredTextBoxExtender>
                    </div>
                    <div class="form-group">
                        <label>Complete Address </label>
                        <asp:TextBox ID="txtAddress" runat="server" class="form-control input-lg" required />
                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtAddress">
                            </asp:FilteredTextBoxExtender>
                    </div>
                    <div class="form-group">
                        <label>Contact # </label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ValidationExpression="^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$"
                            ControlToValidate="txtCN" ValidationGroup="save"
                            ErrorMessage=" Invalid Contact Number!"
                            ForeColor="red"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtCN" runat="server" class="form-control input-lg" required />
                          
                       
                    </div>
                   <div class="form-group form-check-inline">
                       <label>Preferences</label>
                       <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="preference1" value="1" runat="server">
  <label class="form-check-label" for="inlineCheckbox1">Graphic Design</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="preference2" value="2" runat="server">
  <label class="form-check-label" for="inlineCheckbox2">Illustration</label>
</div>
                       <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox"  id="preference3" value="3" runat="server">
  <label class="form-check-label" for="inlineCheckbox2">Web Design</label>
</div>
                       <div class="form-check form-check-inline">
  <input class="form-check-input" type="checkbox" id="preference4" value="4" runat="server">
  <label class="form-check-label" for="inlineCheckbox2">Photoshop</label>
</div>
                   </div>
                    <div class="form-group">
                        <label>Birthday</label><asp:label id="errorBirthday" class="text-danger" runat="server" ></asp:label>
                        <asp:TextBox ID="txtBD" runat="server" class="form-control input-lg" TextMode="Date" required/>
                    </div>
                    <div class="form-group">
                        <label>Password</label><asp:label id="errorPassword" class="text-danger" runat="server" required></asp:label>

                        <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg"
                            TextMode="Password" required />

                    </div>
                      <div class="form-group">
                        <label>Confirm Password</label>

                        <asp:TextBox ID="txtPassword_confirm" runat="server" class="form-control input-lg" TextMode="Password" required></asp:TextBox>


                    </div>
                    <div class="form-group">
                        <label>Identification Photo Front</label> <asp:label id="errorImage" class="text-danger" runat="server" required></asp:label>
                        <div class="input-group">
                            <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                            <asp:FileUpload required ID="fuImage" runat="server" class="form-control" accept="image/png, image/gif, image/jpeg"/>

                        </div>
                    </div>
                    <div class="form-group">
                        <label>Identification Photo Back</label>
                        <div class="input-group">
                            <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                            <asp:FileUpload required ID="fuImage2" runat="server" class="form-control" accept="image/png, image/gif, image/jpeg"/>

                        </div>
                    </div>
                  


                    <asp:Button ID="btnLogin" runat="server" class="btn btn-primary"
                        Text="Register" OnClick="btnLogin_Click" />

                </form>
           </div>
       </div>
   </div>
</asp:Content>

