<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="FilesuploadContractFreelancer.aspx.cs" Inherits="FilesuploadContractFreelancer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="jobs">
        <div class="container">

            <div class="companies">
                <div class="row heading">
                    <h2>Freelancer Contract Upload</h2>
                <%--    <p>Please fill up all text box!</p>--%>
                </div>

                <div class="container">
                    <div class="card">
                        <fieldset class="col-md-12">
                            <%--<div class="form-group">
                            <label class="col-md-2 control-label">My Skills</label>

                        </div--%>
                              
                            <div class="form-group">
                                <label class="control-label">Select File</label>
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                        <asp:FileUpload ID="fuimage" runat="server"  Width="500" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Freelancer Contract Upload</label>
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">
                                       <%-- <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                        <asp:Label ID="txtFNAMEU" runat="server" class="form-control" Enabled="false" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-md-8 inputGroupContainer">

                                    <asp:Button ID="btnAdd" runat="server" class="btn btn-danger"
                                        Text="Upload" OnClick="btnReg_Click" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Employer Contract File </label>
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">
                                        <%--<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                        <asp:Label ID="txtFNAMED" runat="server" class="form-control" Enabled="false"/>
                                    </div>

                                </div>
                            </div>
                             <div class="form-group">

                                <div class="col-md-8 inputGroupContainer">

                                    <asp:Button ID="Button3" runat="server" class="btn btn-primary"
                                        Text="Download" OnClick="Button3_Click" />
                                </div>
                            </div>
                         <%--   <div class="form-group">
                             
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">

                                        <asp:GridView ID="gvfiles" runat="server" AutoGenerateColumns="False"
                                            class="table" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="gvfiles_SelectedIndexChanged" OnRowDeleting="gvfiles_RowDeleting">
                                            <Columns>

                                                <asp:BoundField DataField="Uploadfileid" HeaderText="Ref. #" />
                                                <asp:BoundField DataField="FileDescription" HeaderText="FileDescription" />
                                                <asp:BoundField DataField="FileName" HeaderText="File Name" />
                                                <asp:ButtonField ButtonType="Link" Text="Delete" CommandName="Delete" />
                                                <asp:ButtonField ButtonType="Link" Text="Download" CommandName="Download" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>--%>
                            <%--     <div class="form-group">
                            <label class="col-md-4 control-label">Email</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span><input id="email" name="email" placeholder="Email" class="form-control" required="true" value="" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Phone Number</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span><input id="phoneNumber" name="phoneNumber" placeholder="Phone Number" class="form-control" required="true" value="" type="text"></div>
                            </div>

                         </div>--%>
                            <div class="form-group">

                                <div class="col-md-8 inputGroupContainer">

                                    <asp:Button ID="Button1" runat="server" class="btn btn-success"
                                        Text="Finish" OnClick="Button1_Click1" />
                                    <asp:Button ID="Button2" runat="server" class="btn btn-warning"
                                        Text="Cancel" OnClick="Button2_Click" />
                                </div>
                                <div class="col-md-8 inputGroupContainer">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

