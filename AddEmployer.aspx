<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddEmployer.aspx.cs" Inherits="AddEmployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>New Employer Form</h2>
        <p>Please fill up all text box!</p>
    </div>


    <fieldset>
        <div class="form-group">
            <label class="col-md-4 control-label">Employer Company </label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="txtFN" runat="server" class="form-control" placeholder="Client Company here" required />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Contact Person</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Contact Person here" required />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Complete Address</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder=" Address here" TextMode="MultiLine"
                        MaxLength="300" required />
                </div>
            </div>
        </div>

        <%--  
                         <div class="form-group">
                            <label class="col-md-4 control-label">Country</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group">
                                  <span class="input-group-addon" style="max-width: 100%;"><i class="glyphicon glyphicon-list"></i></span>
                                  <select class="selectpicker form-control">
                                     <option>A really long option to push the menu over the edget</option>
                                  </select>
                               </div>
                            </div>
                         </div>--%>

        <div class="form-group">
            <label class="col-md-4 control-label">Email</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="  Email Address here" required />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Phone Number</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder=" Phone number here" required />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Password</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="****" required />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Logo</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:FileUpload ID="fuImage" runat="server" class="form-control" />
                </div>
            </div>
        </div>
        <div class="form-group">

            <div class="col-md-8 inputGroupContainer">
                <asp:Button ID="btnReg" runat="server" Text="Register" type="button" class="btn btn-primary" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

            </div>
        </div>
    </fieldset>


</asp:Content>

