<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="AddJob.aspx.cs" Inherits="AddJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row heading">
                <h2><b>Add Project</b></h2>
                <small><i>Please fill up all text box!</i></small>
            </div>
         <div class="panel panel-primary">
        <div class="panel-heading">
            
        </div>
        <div class="panel-body">
            <div class="row">
        <div class="col-md-12">
            <fieldset>
                       
                          <div class="form-group">
                            <label class="col-md-4 control-label">Project Title</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtJT" runat="server" class="form-control" placeholder="Project Title" 
                                        MaxLength="300" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Project Description</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtDesc" runat="server" class="form-control" placeholder="Description" TextMode="MultiLine"
                                        MaxLength="300" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Amount Offered</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtamt" runat="server" class="form-control" placeholder="Amount Offered" type="number"
                                        min="0.00" max="10000000.00" step="0.00" required/>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    Enabled="True" FilterMode="InvalidChars"
                                    InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>qwertyuiopasdfghjklzxcvbnm"
                                    TargetControlID="txtamt">
                                </asp:FilteredTextBoxExtender>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Time frame</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txttf" runat="server" class="form-control" placeholder="1-9999" type="number"
                                        min="1" max="30" step="1" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label">Time frame Category</label>
                           <div class="col-md-8">
                                <asp:DropDownList runat="server" ID="ddltimecat" class="form-control">
                                    <asp:ListItem Text="Days" Value="Days"></asp:ListItem>
                                    <asp:ListItem Text="Months" Value="Months"></asp:ListItem>
                                    <asp:ListItem Text="Years" Value="Years"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label">Category</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlCategory" runat="server" class="custom-select2 form-control" data-live-search="true"
                                        AutoPostBack="true" />
                            </div>
                        </div>
                     
                        <div class="form-group">

                            <div class="col-md-12 text-center">
                                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" style="width:100%" class="btn btn-success" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

                            </div>
                        </div>
                    </fieldset>
        </div>
    </div>
        </div>
    </div>
    </div>
</asp:Content>

