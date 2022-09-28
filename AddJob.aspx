<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="AddJob.aspx.cs" Inherits="AddJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>Add Project</h2>
        <p>Please fill up all text box!</p>
    </div>
    <table class="table table-striped">
        <tbody>
            <tr>
                <td colspan="1">

                    <fieldset>
                       
                          <div class="form-group">
                            <label class="col-md-4 control-label">Project Title</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group">
                                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                    <%--<input id="phoneNumber" name="phoneNumber" placeholder="Job Description" class="form-control" required="true" value="" type="text"></div>--%>
                                    <asp:TextBox ID="txtJT" runat="server" class="form-control" placeholder="Project Title" 
                                        MaxLength="300" required/>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-md-4 control-label">Project Description</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group">
                                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                    <%--<input id="phoneNumber" name="phoneNumber" placeholder="Job Description" class="form-control" required="true" value="" type="text"></div>--%>
                                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" placeholder="Description" TextMode="MultiLine"
                                        MaxLength="300" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Amount Offered</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group">
                                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>--%>
                                    <asp:TextBox ID="txtamt" runat="server" class="form-control" placeholder="Amount Offered" type="number"
                                        min="0.00" max="10000000.00" step="0.00" required/>
                                </div>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    Enabled="True" FilterMode="InvalidChars"
                                    InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>qwertyuiopasdfghjklzxcvbnm"
                                    TargetControlID="txtamt">
                                </asp:FilteredTextBoxExtender>

                            </div>
                        </div>
                      <div class="form-group">
                            <label class="col-md-4 control-label">Time frame</label>
                      
                           <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon" style="max-width: 100%;"><i class="glyphicon glyphicon-list"></i></span>--%>
                      <asp:TextBox ID="txttf" runat="server" class="form-control" placeholder="" type="number"
                                        min="1" max="30" step="0" required/>
                 
                </div>
            </div>
                        </div>

                            <div class="form-group">
                            <label class="col-md-4 control-label">Time frame Category</label>
                           <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                     <asp:DropDownList runat="server" ID="ddltimecat" class="form-control">

                        <asp:ListItem Text="Days" Value="Days"></asp:ListItem>
                        <asp:ListItem Text="Months" Value="Months"></asp:ListItem>
                           <asp:ListItem Text="Years" Value="Years"></asp:ListItem>
                    </asp:DropDownList>
                  
                </div>
            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Category</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group">
                                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                    <asp:DropDownList ID="ddlCategory" runat="server" class="custom-select2 form-control" data-live-search="true"
                                        AutoPostBack="true" />
                                </div>

                            </div>
                        </div>
                     
                        <div class="form-group">

                            <div class="col-md-8 inputGroupContainer">
                                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

                            </div>
                        </div>
                    </fieldset>

                </td>
            </tr>
        </tbody>
    </table>

</asp:Content>

