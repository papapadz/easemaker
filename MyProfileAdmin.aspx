<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfileAdmin.aspx.cs" Inherits="MyProfileAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2>My Profile</h2>
        <p>Please fill up all text box!</p>
    </div>


    <fieldset>
        
        <div class="form-group">
            <label class="col-md-4 control-label">Full name</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Contact Person here" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Complete Address</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>--%>
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder=" Address here" TextMode="MultiLine"
                        MaxLength="300" />
                </div>
            </div>
        </div>

     

        <div class="form-group">
            <label class="col-md-4 control-label">Email</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>--%>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="  Email Address here" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Phone Number</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>--%>
                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder=" Phone number here" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Password</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" textmode="Password" placeholder="****" />
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

