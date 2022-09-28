<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="MyProfileApplicant.aspx.cs" Inherits="MyProfileApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                  <h2 class="text-primary"><b>My Profile</b></h2>
             </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                        <label>Full Name</label>
                        <asp:TextBox ID="txtContactPerson" runat="server" class="form-control" placeholder="Applicant Name here" />
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
                        <label>Gender</label>
                        <asp:DropDownList runat="server" ID="Dropdownlist1" class="selectpicker form-control">
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Birthday</label>
                        <asp:TextBox ID="txtBD" runat="server" class="form-control" TextMode="Date" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Contact Number</label>
                        <asp:TextBox ID="txtContactNo" runat="server" class="form-control" placeholder=" Phone number here" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="  Email Address here" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" placeholder="****" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6 text-right">
                        <asp:Image ID="imgApplicant" runat="server" Width="150" Height="150" />
                    </div>
                    <div class="col-md-6">
                       <label>Photo</label>
                       <asp:FileUpload ID="fuImage" runat="server" class="form-control" />
                    </div>
                </div>
                <hr />
                <div class="row">
                     <div class="col-md-6 text-right">
                         <asp:Image ID="Image1" runat="server" Width="150" Height="150" />
                     </div>
                     <div class="col-md-6">
                        <label>Identification Photo Front</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-6 text-right">
                        <asp:Image ID="Image2" runat="server" Width="150" Height="150" />
                    </div>
                    <div class="col-md-6">
                        <label>Identification Photo Back</label>
                        <asp:FileUpload ID="fuImage2" runat="server" class="form-control" />
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="btnReg" runat="server" style="width: 100%" Text="Submit" type="button" class="btn btn-primary"  OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
            </div>
        </div>
    </div>

</asp:Content>

