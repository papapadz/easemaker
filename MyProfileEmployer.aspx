<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="MyProfileEmployer.aspx.cs" Inherits="MyProfileEmployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-primary"><b>My Profile</b></h2>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label>Employer Company Name</label>
            <asp:TextBox ID="txtFN" runat="server" class="form-control" placeholder="Client Company here" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label>Contact Person</label>
            <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Contact Person here" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label>Complete Address</label>
            <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder=" Address here" TextMode="MultiLine"
                        MaxLength="300" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="  Email Address here" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label>Phone Number</label>
            <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder=" Phone number here" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" textmode="Password" placeholder="****" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <label>Logo</label>
            <asp:FileUpload ID="fuImage" runat="server" class="form-control" />
        </div>
        <div class="col-md-6 text-left">
            <asp:Image ID="imgApplicant" runat="server" Width="150" Height="150" />
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn btn-primary" Width="100%" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
        </div>
    </div>


</asp:Content>

