<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="Filesdownloadinvoice.aspx.cs" Inherits="Filesdownload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="jobs">
        <div class="container">

            <div class="companies">
                <div class="row heading">
                    <h2>Invoice Download for Project #  <asp:Label ID="txtDesc" runat="server" class="form-control" Enabled="false"/></h2>
                  <%--  <p>Please fill up all text box!</p>--%>
                </div>

                <div class="container">
                    <div class="card">
                        <fieldset class="col-md-12">
                            <%--<div class="form-group">
                            <label class="col-md-2 control-label">My Skills</label>

                        </div--%>
                         <%--   <div class="form-group">
                                <label class="control-label">Select File</label>
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                        <asp:FileUpload ID="fuimage" runat="server" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Description</label>
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                        <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine" Width="700" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-md-8 inputGroupContainer">

                                    <asp:Button ID="btnAdd" runat="server" class="btn btn-primary"
                                        Text="Add" OnClick="btnReg_Click" />
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <%--<label class="col-md-4 control-label">Work Expeirnece List</label>--%>
                                <div class="col-md-12 inputGroupContainer">
                                    <div class="input-group">

                                        <asp:GridView ID="gvfiles" runat="server" AutoGenerateColumns="False"
                                            class="table" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="gvfiles_SelectedIndexChanged" OnRowDeleting="gvfiles_RowDeleting">
                                            <Columns>

                                                <asp:BoundField DataField="Uploadfileid" HeaderText="Ref. #" />
                                                <asp:BoundField DataField="FileDescription" HeaderText="FileDescription" />
                                                <asp:BoundField DataField="FileName" HeaderText="File Name" />
                                                 <asp:BoundField DataField="DateAdded" HeaderText="Date & Time" />
                                              <%--  <asp:ButtonField ButtonType="Link" Text="Delete" CommandName="Delete" />--%>
                                                <asp:ButtonField ButtonType="Link" Text="Download" CommandName="Download" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
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

