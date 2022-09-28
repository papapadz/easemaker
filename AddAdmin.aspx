<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="AddAdmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>New Admin Form</h2>
        <p>Please fill up all text box!</p>
    </div>


    <fieldset>

        <div class="form-group">
            <label class="col-md-4 control-label">Admin Full Name</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Name here" required />
                      <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtContactPerson">
                        </asp:FilteredTextBoxExtender>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Complete Address</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>--%>
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder=" Address here" TextMode="MultiLine"
                        MaxLength="300" required />
                          <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtAddress">
                        </asp:FilteredTextBoxExtender>
                </div>
            </div>
        </div>
        <a href="AdminPortfolio.aspx">AdminPortfolio.aspx</a>

        <div class="form-group">
            <label class="col-md-4 control-label">User Level</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon" style="max-width: 100%;"><i class="glyphicon glyphicon-list"></i></span>--%>

                    <asp:DropDownList runat="server" ID="ddlUserType" class="form-control">
                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        <%--<asp:ListItem Text="IT" Value="IT"></asp:ListItem>--%>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label">Email</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>--%>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="  Email Address here" required />
                             <asp:RegularExpressionValidator ID="regexEmailValid" runat="server"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ValidationGroup="save"
                            ErrorMessage="Invalid Email Format"
                            ForeColor="red"></asp:RegularExpressionValidator><br />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Phone Number</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>--%>
                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder=" Phone number here" required />
                       <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                            Enabled="True" FilterMode="InvalidChars"
                            InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>"
                            TargetControlID="txtContactNo">
                        </asp:FilteredTextBoxExtender>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Password</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="****" required />

                </div>
            </div>
        </div>

        <div class="form-group">

            <div class="col-md-8 inputGroupContainer">
                <asp:Button ID="btnReg" runat="server" Text="Update" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

            </div>
        </div>
    </fieldset>

</asp:Content>

