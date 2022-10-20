<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="Filesuploadinvoice.aspx.cs" Inherits="Filesupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="jobs">
        <div class="container">

            <div class="companies">
                <div class="row heading">
                    <h2 class="text-primary"><b>Invoice Upload for Project # <asp:Label ID="Label1" runat="server" class="form-control" Enabled="false"/></b></h2>
                    <p><small><i>Please fill up all text box!</i></small></p>
                </div>

                <div class="container">
                        <fieldset>
                            <%--<div class="form-group">
                            <label class="col-md-2 control-label">My Skills</label>

                        </div--%>
                            <div class="form-group row">
                                <label class="col-md-4 control-label">Select File</label>
                                <div class="col-md-8">
                                   
                                        <%--<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                        <asp:FileUpload ID="fuimage" runat="server" class="form-control" />
                                    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 control-label">Description</label>
                                <div class="col-md-8">
                                    
                                        <%--<span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>--%>
                                        <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine" />
                                    
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-4"></div>
                                <div class="col-md-8 text-right">

                                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success"
                                        Text="Submit" OnClick="btnReg_Click" width="100%"/>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <%--<label class="col-md-4 control-label">Work Expeirnece List</label>--%>
                                <div class="col-md-12 text-center">
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
                            <asp:Button ID="Button1" runat="server" class="btn btn-info"
                                        Text="Back" OnClick="Button1_Click1" width="100%"/>
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

                         </div>
                            <hr />
                            <div class="row">

                                <div class="col-md-6">
                                    <asp:Button ID="Button1" runat="server" class="btn btn-info"
                                        Text="Back" OnClick="Button1_Click1" width="100%"/>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="Button2" runat="server" class="btn btn-danger"
                                        Text="Cancel" OnClick="Button2_Click" width="100%"/>
                                </div>
                            </div>
                                --%>
                        </fieldset>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

