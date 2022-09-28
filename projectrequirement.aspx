<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="projectrequirement.aspx.cs" Inherits="projectrequirement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div class="row heading">
        <h2>Project Requirements</h2>
        <p>Please fill up all text box!</p>
    </div>
    
    <div class="container">
        <div class="card">
                    <fieldset class="col-md-12">
                        <%--<div class="form-group">
                            <label class="col-md-2 control-label">My Skills</label>

                        </div--%>
                    
                        <div class="form-group">
                            <label class="control-label">Description</label>
                            <div class="col-md-12 inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                                     <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine"  Width="700"/>
                                </div>
                            </div>
                        </div>
                      
                        <div class="form-group">

                            <div class="col-md-8 inputGroupContainer">

                              <asp:Button ID="btnAdd" runat="server" class="btn btn-primary"
                        Text="Add" OnClick="btnReg_Click" />
                            </div>
                        </div>
                        <div class="form-group">
                            <%--<label class="col-md-4 control-label">Work Expeirnece List</label>--%>
                            <div class="col-md-12 inputGroupContainer">
                                <div class="input-group">
                                 
                                        <asp:GridView ID="gvexperience" runat="server" AutoGenerateColumns="False"
                                        class="table table-bordered" OnSelectedIndexChanged="gvexperience_SelectedIndexChanged">
                                        <Columns>
                                            <asp:BoundField DataField="projreqid" HeaderText="Ref. #" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" />
                                            <asp:CommandField SelectText="x" ShowSelectButton="True" HeaderText="Delete" />
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
                        Text="Cancel" OnClick="Button2_Click"  />
                            </div>
                            <div class="col-md-8 inputGroupContainer">

                            
                            </div>
                        </div>
                    </fieldset>
        </div>
        </div>
                   
</asp:Content>

