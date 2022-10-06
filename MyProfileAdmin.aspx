<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfileAdmin.aspx.cs" Inherits="MyProfileAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2 class="text-primary"><b>My Profile</b></h2>
    </div>
    <hr />

    <fieldset>
        
        <div class="form-group">
            <label class="col-md-4 text-right">Full name</label>
            <div class="col-md-8">
                <div>
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Contact Person here" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Complete Address</label>
            <div class="col-md-8">
                <div>
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>--%>
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder=" Address here" TextMode="MultiLine"
                        MaxLength="300" />
                </div>
            </div>
        </div>

     

        <div class="form-group">
            <label class="col-md-4 text-right">Email</label>
            <div class="col-md-8">
                <div>
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>--%>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="  Email Address here" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Phone Number</label>
            <div class="col-md-8">
                <div>
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>--%>
                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder=" Phone number here" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 text-right">Password</label>
            <div class="col-md-8">
                <div>
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>--%>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" textmode="Password" placeholder="****" />
                </div>
            </div>
        </div>
      
        <div class="form-group">
            <label class="col-md-4 text-right"></label>
            <div class="col-md-8">
                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn btn-success" Width="100%" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

            </div>
        </div>
    </fieldset>

</asp:Content>

