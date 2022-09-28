<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="uploadbillingpaymentemployer.aspx.cs" Inherits="uploadbillingpaymentemployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2>Upload Payment</h2>
        <p>Please fill up all text box!</p>
    </div>


    <fieldset>
        <div class="form-group">
            <label class="col-md-4 control-label">Job Order #</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:TextBox ID="txtONO" runat="server" class="form-control" Enabled="false"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Date</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>--%>
                    <asp:TextBox ID="txtDate" runat="server" class="form-control" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Upload</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-image"></i></span>--%>
                     <%--<asp:Image ID="imgApplicant" runat="server" Width="150" Height="150" />--%>
                    <asp:FileUpload ID="fuImage" runat="server" class="form-control" />
                </div>
            </div>
        </div>
        <div class="form-group">

            <div class="col-md-8 inputGroupContainer">
                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

            </div>
        </div>
    </fieldset>
</asp:Content>

